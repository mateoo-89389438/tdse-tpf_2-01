#include "storage.h"
#include "eeprom.h"
#include <string.h>

#define EE_HDR_ADDR     0x0000
#define EE_BASE_ADDR    0x0010

typedef struct __attribute__((packed)) {
    uint8_t  magicH;   /* 'E' */
    uint8_t  magicL;   /* 'E' */
    uint8_t  version;  /* 1 */
    uint16_t count;    
    uint8_t  reserved; /* 0xFF */
} ee_header_t;

#define EE_MAGIC_H   'E'
#define EE_MAGIC_L   'E'
#define EE_VERSION   1

static ee_header_t g_hdr;

static HAL_StatusTypeDef read_header(void){
    return EEPROM_Read(EE_HDR_ADDR, (uint8_t*)&g_hdr, sizeof(g_hdr));
}

static HAL_StatusTypeDef write_header(void){
    return EEPROM_Write(EE_HDR_ADDR, (uint8_t*)&g_hdr, sizeof(g_hdr));
}

HAL_StatusTypeDef storage_init(void){
    HAL_StatusTypeDef st = EEPROM_Init();
    if (st != HAL_OK) return st;

    st = read_header();
    if (st != HAL_OK ||
        g_hdr.magicH != EE_MAGIC_H ||
        g_hdr.magicL != EE_MAGIC_L ||
        g_hdr.version != EE_VERSION)
    {
        g_hdr.magicH  = EE_MAGIC_H;
        g_hdr.magicL  = EE_MAGIC_L;
        g_hdr.version = EE_VERSION;
        g_hdr.count   = 0;
        g_hdr.reserved= 0xFF;
        st = write_header();
    }
    return st;
}

uint16_t storage_get_count(void){
    return g_hdr.count;
}

HAL_StatusTypeDef storage_iterate(storage_iter_cb_t cb){
    if (!cb) return HAL_ERROR;

    uint32_t total_bytes = (uint32_t)g_hdr.count * sizeof(storage_record_t);
    if (EE_BASE_ADDR + total_bytes > EEPROM_SIZE_BYTES) {
        return HAL_ERROR;
    }

    storage_record_t rec;
    for (uint16_t i = 0; i < g_hdr.count; i++){
        uint16_t addr = EE_BASE_ADDR + i * sizeof(storage_record_t);
        HAL_StatusTypeDef st = EEPROM_Read(addr, (uint8_t*)&rec, sizeof(rec));
        if (st != HAL_OK) return st;
        if (!cb(&rec, i)) break; 
    }
    return HAL_OK;
}

HAL_StatusTypeDef storage_append(const storage_record_t* rec){
    if (!rec) return HAL_ERROR;

    uint32_t next_addr = EE_BASE_ADDR + (uint32_t)g_hdr.count * sizeof(storage_record_t);
    if (next_addr + sizeof(storage_record_t) > EEPROM_SIZE_BYTES) {
        return HAL_ERROR;
    }

    HAL_StatusTypeDef st = EEPROM_Write((uint16_t)next_addr, (uint8_t*)rec, sizeof(storage_record_t));
    if (st != HAL_OK) return st;

    g_hdr.count++;
    return write_header();
}
