#pragma once
#include "main.h"
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Permanent register (10 b) */
#pragma pack(push,1)
typedef struct {
    char    patente[4];      
    uint8_t day, month, year;
    uint8_t hora, minuto;
    uint8_t categoria;       
} storage_record_t;
#pragma pack(pop)

typedef bool (*storage_iter_cb_t)(const storage_record_t* rec, uint16_t index);

/* API */
HAL_StatusTypeDef storage_init(void);                                
uint16_t          storage_get_count(void);                            
HAL_StatusTypeDef storage_iterate(storage_iter_cb_t cb);              
HAL_StatusTypeDef storage_append(const storage_record_t* rec);        

#ifdef __cplusplus
}
#endif
