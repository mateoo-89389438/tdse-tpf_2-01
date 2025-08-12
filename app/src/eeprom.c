#include "eeprom.h"
#include "dwt.h" 

static inline uint16_t min_u16(uint16_t a, uint16_t b){ return (a < b) ? a : b; }

uint32_t wcet_eeprom_read_cycles = 0;
uint32_t wcet_eeprom_read_us = 0;
uint32_t wcet_eeprom_write_cycles = 0;
uint32_t wcet_eeprom_write_us = 0;

HAL_StatusTypeDef EEPROM_Init(void){
    return EEPROM_WaitReady(50);
}

HAL_StatusTypeDef EEPROM_WaitReady(uint32_t timeout_ms){
    uint32_t t0 = HAL_GetTick();
    while ((HAL_GetTick() - t0) < timeout_ms){
        if (HAL_I2C_IsDeviceReady(&EEPROM_I2C_HANDLE, EEPROM_I2C_ADDR, 1, 5) == HAL_OK){
            return HAL_OK;
        }
    }
    return HAL_TIMEOUT;
}

HAL_StatusTypeDef EEPROM_Read(uint16_t addr, uint8_t *buf, uint16_t len){

    uint32_t start_cycles = cycle_counter_get();

    if ((uint32_t)addr + len > EEPROM_SIZE_BYTES) return HAL_ERROR;
    HAL_StatusTypeDef st = HAL_I2C_Mem_Read(&EEPROM_I2C_HANDLE,
                                            EEPROM_I2C_ADDR,
                                            addr,
                                            EEPROM_MEMADD_SIZE,
                                            buf, len,
                                            100);

    uint32_t elapsed_cycles = cycle_counter_get() - start_cycles;
    uint32_t elapsed_us = elapsed_cycles / cycles_per_us;

    if (elapsed_us > wcet_eeprom_read_us) {
        wcet_eeprom_read_us = elapsed_us;
        wcet_eeprom_read_cycles = elapsed_cycles;
    }
    return st;
}

HAL_StatusTypeDef EEPROM_Write(uint16_t addr, const uint8_t *buf, uint16_t len){

    uint32_t start_cycles = cycle_counter_get();

    if ((uint32_t)addr + len > EEPROM_SIZE_BYTES) return HAL_ERROR;

    HAL_StatusTypeDef st = HAL_OK;
    while (len > 0){
        uint16_t page_off   = addr % EEPROM_PAGE_SIZE;
        uint16_t page_space = EEPROM_PAGE_SIZE - page_off;
        uint16_t chunk      = min_u16(len, page_space);

        st = HAL_I2C_Mem_Write(&EEPROM_I2C_HANDLE,
                               EEPROM_I2C_ADDR,
                               addr,
                               EEPROM_MEMADD_SIZE,
                               (uint8_t*)buf, chunk,
                               100);
        if (st != HAL_OK) return st;

        st = EEPROM_WaitReady(10);
        if (st != HAL_OK) return st;

        addr += chunk;
        buf  += chunk;
        len  -= chunk;
    }

    uint32_t elapsed_cycles = cycle_counter_get() - start_cycles;
    uint32_t elapsed_us = elapsed_cycles / cycles_per_us;

    if (elapsed_us > wcet_eeprom_write_us) {
        wcet_eeprom_write_us = elapsed_us;
        wcet_eeprom_write_cycles = elapsed_cycles;
    }
    
    return HAL_OK;
}
