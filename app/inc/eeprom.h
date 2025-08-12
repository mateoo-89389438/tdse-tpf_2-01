#pragma once
#include "main.h"
#include "i2c.h"     // para hi2c1

#ifdef __cplusplus
extern "C" {
#endif

/* ==== Configuración del dispositivo EEPROM ==== */
#define EEPROM_I2C_HANDLE       hi2c1
#define EEPROM_I2C_ADDR_7B      (0x50)                 /* A2..A0 = 0 */
#define EEPROM_I2C_ADDR         (EEPROM_I2C_ADDR_7B << 1)
#define EEPROM_MEMADD_SIZE      I2C_MEMADD_SIZE_16BIT  /* 16-bit addr para >= 24C32 */
#define EEPROM_PAGE_SIZE        32                     /* bytes por página (24C32=32) */
#define EEPROM_SIZE_BYTES       4096                   /* 32 kbit */

extern uint32_t wcet_eeprom_read_cycles;
extern uint32_t wcet_eeprom_read_us;
extern uint32_t wcet_eeprom_write_cycles;
extern uint32_t wcet_eeprom_write_us;

/* ==== API ==== */
HAL_StatusTypeDef EEPROM_Init(void);
HAL_StatusTypeDef EEPROM_WaitReady(uint32_t timeout_ms);

/* Lectura lineal (maneja internamente tamaños grandes) */
HAL_StatusTypeDef EEPROM_Read(uint16_t addr, uint8_t *buf, uint16_t len);

/* Escritura lineal con manejo de límites de página + ACK polling */
HAL_StatusTypeDef EEPROM_Write(uint16_t addr, const uint8_t *buf, uint16_t len);

#ifdef __cplusplus
}
#endif
