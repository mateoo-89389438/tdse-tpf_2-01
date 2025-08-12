/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    rtc.c
  * @brief   Configuración del RTC con LSE preferido y backup persistente
  ******************************************************************************
  */
/* USER CODE END Header */

#include "rtc.h"

/* ====== Config ====== */
#define RTC_BKP_MARK_VALUE   0x32F2  /* “RTC ya inicializado” */
#define RTC_BKP_MARK_REG     RTC_BKP_DR1

RTC_HandleTypeDef hrtc;

/* Helpers locales */
static void RTC_EnableClock_LSE_Pref(void);
static void RTC_WriteDefaultIfNotMarked(void);

/* ====== API ====== */
void MX_RTC_Init(void)
{
  /* 1) Habilitar dominio backup y acceso */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_RCC_BKP_CLK_ENABLE();
  HAL_PWR_EnableBkUpAccess();

  /* 2) Elegir fuente del RTC: LSE preferido, fallback a LSI */
  RTC_EnableClock_LSE_Pref();

  /* 3) Inicializar el handle del RTC */
  hrtc.Instance = RTC;
  hrtc.Init.AsynchPrediv = RTC_AUTO_1_SECOND;   /* F1: HAL calcula 1s automático */
  hrtc.Init.OutPut = RTC_OUTPUTSOURCE_NONE;

  if (HAL_RTC_Init(&hrtc) != HAL_OK) {
    Error_Handler();
  }

  /* 4) Solo escribir hora/fecha por defecto si NO está marcado el backup */
  RTC_WriteDefaultIfNotMarked();

  /* 5) (Opcional) Podés deshabilitar acceso a backup si no vas a usarlo más ahora */
  // HAL_PWR_DisableBkUpAccess();
}

/* ====== MSP ====== */
void HAL_RTC_MspInit(RTC_HandleTypeDef* rtcHandle)
{
  if (rtcHandle->Instance == RTC) {
    /* Ya se habilitaron PWR/BKP y se configuró LSE/LSI en MX_RTC_Init() */
    /* Solo habilitamos el reloj del periférico RTC si no lo hizo el helper */
    /* (El helper ya llama __HAL_RCC_RTC_ENABLE(); si preferís, dejalo acá.) */
  }
}

void HAL_RTC_MspDeInit(RTC_HandleTypeDef* rtcHandle)
{
  if (rtcHandle->Instance == RTC) {
    /* No deshabilitamos el backup domain ni el RTC acá para no perder hora */
    // __HAL_RCC_RTC_DISABLE();  // <- normalmente NO lo hagas en runtime
  }
}

/* ====== Helpers ====== */

/* Intenta LSE; si falla, usa LSI. Deja el RTC habilitado. */
static void RTC_EnableClock_LSE_Pref(void)
{
  /* Asegurar acceso al backup domain */
  HAL_PWR_EnableBkUpAccess();

  /* 1) Intentar LSE */
  __HAL_RCC_LSE_CONFIG(RCC_LSE_ON);

  /* Espera sencilla por LSE listo (timeout básico) */
  uint32_t timeout = 0xFFFF;
  while (__HAL_RCC_GET_FLAG(RCC_FLAG_LSERDY) == RESET && timeout--) {
    /* spin */
  }

  if (__HAL_RCC_GET_FLAG(RCC_FLAG_LSERDY) != RESET) {
    /* LSE ok -> fuente de RTC = LSE */
    __HAL_RCC_RTC_CONFIG(RCC_RTCCLKSOURCE_LSE);
  } else {
    /* LSE falló -> activar LSI y usarlo como fuente del RTC */
    __HAL_RCC_LSI_ENABLE();
    timeout = 0xFFFF;
    while (__HAL_RCC_GET_FLAG(RCC_FLAG_LSIRDY) == RESET && timeout--) {
      /* spin */
    }
    __HAL_RCC_RTC_CONFIG(RCC_RTCCLKSOURCE_LSI);
  }

  /* 2) Habilitar reloj del RTC */
  __HAL_RCC_RTC_ENABLE();
}

/* Si no está el marcador en BKP_DR1, setea hora/fecha por defecto y marca */
static void RTC_WriteDefaultIfNotMarked(void)
{
  uint32_t mark = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_MARK_REG);
  if (mark != RTC_BKP_MARK_VALUE) {
    /* Primera vez: cargar una hora/fecha de fábrica */
    RTC_TimeTypeDef t = {0};
    RTC_DateTypeDef d = {0};

    t.Hours   = 12;    /* 12:00:00 */
    t.Minutes = 0;
    t.Seconds = 0;

    d.WeekDay = RTC_WEEKDAY_MONDAY; /* opcional */
    d.Month   = 1;      /* enero */
    d.Date    = 1;
    d.Year    = 25;     /* 20 25 */

    if (HAL_RTC_SetTime(&hrtc, &t, RTC_FORMAT_BIN) != HAL_OK) {
      Error_Handler();
    }
    if (HAL_RTC_SetDate(&hrtc, &d, RTC_FORMAT_BIN) != HAL_OK) {
      Error_Handler();
    }

    /* Dejar marcado: “ya inicializado” */
    HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_MARK_REG, RTC_BKP_MARK_VALUE);
  }
}
