/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    rtc.h
  * @brief   Prototipos para rtc.c
  ******************************************************************************
  */
/* USER CODE END Header */
#ifndef __RTC_H__
#define __RTC_H__

#ifdef __cplusplus
extern "C" {
#endif

#include "main.h"

/* Handle global del RTC */
extern RTC_HandleTypeDef hrtc;

/* Inicialización del RTC (no reescribe hora si backup marcado) */
void MX_RTC_Init(void);

#ifdef __cplusplus
}
#endif

#endif /* __RTC_H__ */
