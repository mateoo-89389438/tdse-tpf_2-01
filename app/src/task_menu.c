/*
 * Copyright (c) 2023 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * @file   : task_menu.c
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

/********************** inclusions *******************************************/
/* Project includes. */
#include "main.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "app.h"
#include "task_menu_attribute.h"
#include "task_menu_interface.h"
#include "display.h"
#include "teclado.h"

#include "storage.h" 
#include "eeprom.h"    

#include "rtc.h"


/********************** macros and definitions *******************************/
#define G_TASK_MEN_CNT_INI          0ul
#define G_TASK_MEN_TICK_CNT_INI     0ul

#define DEL_MEN_XX_MIN              0ul
#define DEL_MEN_XX_MED              50ul
#define DEL_MEN_XX_MAX              500ul



/********************** internal data declaration ****************************/
volatile task_menu_dta_t task_menu_dta = {
    DEL_MEN_XX_MIN,
    ST_MEN_XX_IDLE,
    EV_MEN_ENT_IDLE,
    false
};


#define MENU_DTA_QTY    (sizeof(task_menu_dta)/sizeof(task_menu_dta_t))

/********************** internal data definition *****************************/
const char *p_task_menu       = "Task Menu (Interactive Menu)";
const char *p_task_menu_      = "Non-Blocking & Update By Time Code";

/********************** external data declaration ****************************/
uint32_t g_task_menu_cnt;
volatile uint32_t g_task_menu_tick_cnt;

// Enumerative structure to manage system operation modes
typedef enum {
    NORMAL_MODE = 0,
    SETUP_MODE
} modo_t;

static modo_t current_mode = NORMAL_MODE; // Default starts in NORMAL MODE


// License plate input handling variables
static char plate_buffer[4] = {0}; // 3 digits 
static uint8_t plate_index = 0;    // Current write position
static uint16_t plate_display_ticks = 0; 
#define DISPLAY_DELAY_TICKS 6 // 3 seconds delay

/* === Vehicles types=== */
// Enumerative to manage vehicle category
typedef enum {
    BIKE = 1,
    MOTORCYCLE,
    CAR,
    TRUCK
} vehicleType_t;

// Structure to manage vehicle data 
typedef struct {
    char plate[4];  // 3 plate digits + '\0'
    uint8_t day, month, year;
    uint8_t hour, minute;
    vehicleType_t category; 
    bool occupied;
} vehicle_record_t;

// Vehicle type rate structure
typedef struct {
    uint8_t bike_rate;       
    uint8_t motorcycle_rate;
    uint8_t car_rate;        
    uint8_t truck_rate;     
} rate_t;

// Default rates
static rate_t rates = { 1, 2, 5, 8 };

#define MAX_VEHICLES 50
static vehicle_record_t vehicles[MAX_VEHICLES];

// Vehicle exit handling variables
static char exit_plate_buffer[4] = {0};
static uint8_t exit_plate_index  = 0;
static bool exit_in_progress     = false;

// Key debounce / key repeat blocking
static uint8_t key_lock_ticks = 0;
#define KEY_LOCK_TICKS 3 // 150ms

// Display delays for messeges before clearing
static uint16_t exit_display_ticks  = 0;
static uint16_t error_display_ticks = 0;

// Vehicle type selection variables
static bool type_selection_in_progress = false;
static bool vehicle_type_page          = false; // false = first page, true = second page
static char plate_temp[4]              = {0};   // Store plate until type is selected

static bool exit_type_selection_in_progress = false;
static bool exit_vehicle_type_page          = false;

static uint16_t price_display_ticks = 0;
static char price_msg[16] = {0};

static bool setup_menu_active = false;

static uint32_t total_collected = 0; // $ ARS
static uint16_t funds_display_ticks = 0; // display duration for showing messege

static bool  rate_change_in_progress = false;
static uint8_t current_rate_idx = 0; // 0=Bike, 1=Motorcycle, 2=Car, 3=Truck
static char  rate_buffer[4] = {0};
static uint8_t rate_index = 0;

static bool display_list_in_progress = false;
static int  current_list_index = 0;

#define DEFAULT_PASSWORD "47969405"
static bool   password_entry_in_progress = false;
static char   password_buffer[9];
static uint8_t password_index = 0;

// Date/Time editor
static bool     dt_edit_in_progress = false;
static uint8_t  dt_step = 0;           // 0=DD, 1=MM, 2=YY, 3=HH, 4=mm
static char     dt_buf[3] = {0};       
static uint8_t  dt_idx = 0;
static uint8_t  ed_day=1, ed_month=1, ed_year=25, ed_hour=12, ed_minute=0;
static uint16_t dt_msg_ticks = 0;    

/********************** internal functions definition ************************/

// Helpers RTC: read and write date/time
static void rtc_get_datetime(uint8_t* d, uint8_t* m, uint8_t* y,
                             uint8_t* h, uint8_t* min)
{
    RTC_TimeTypeDef t;
    RTC_DateTypeDef dt;
    HAL_RTC_GetTime(&hrtc, &t, RTC_FORMAT_BIN);   
    HAL_RTC_GetDate(&hrtc, &dt, RTC_FORMAT_BIN);  
    if (d)   *d   = dt.Date;
    if (m)   *m   = dt.Month;
    if (y)   *y   = dt.Year;   
    if (h)   *h   = t.Hours;
    if (min) *min = t.Minutes;
}

static HAL_StatusTypeDef rtc_set_datetime(uint8_t d, uint8_t m, uint8_t y,
                                          uint8_t h, uint8_t min)
{
    if (m < 1 || m > 12)  return HAL_ERROR;
    if (d < 1 || d > 31)  return HAL_ERROR;
    if (h > 23)           return HAL_ERROR;
    if (min > 59)         return HAL_ERROR;

    RTC_TimeTypeDef t = {0};
    RTC_DateTypeDef dt = {0};

    t.Hours   = h;
    t.Minutes = min;
    t.Seconds = 0;

    dt.WeekDay = RTC_WEEKDAY_MONDAY;
    dt.Month   = m;
    dt.Date    = d;
    dt.Year    = y;  

    if (HAL_RTC_SetTime(&hrtc, &t, RTC_FORMAT_BIN) != HAL_OK) return HAL_ERROR;
    if (HAL_RTC_SetDate(&hrtc, &dt, RTC_FORMAT_BIN) != HAL_OK) return HAL_ERROR;
    return HAL_OK;
}

static inline void rtc_mark_initialized(void) {
    HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR1, 0x32F2);
}

static int findVehicle(const char* plate) {
    for (int i = 0; i < MAX_VEHICLES; i++) {
        if (vehicles[i].occupied && strcmp(vehicles[i].plate, plate) == 0) {
            return i;
        }
    }
    return -1;
}

static bool addVehicle(const char* plate, uint8_t d, uint8_t m, uint8_t y,
                       uint8_t h, uint8_t min, vehicleType_t category) {
    for (int i = 0; i < MAX_VEHICLES; i++) {
        if (!vehicles[i].occupied) {
            strcpy(vehicles[i].plate, plate);
            vehicles[i].day = d; vehicles[i].month = m; vehicles[i].year = y;
            vehicles[i].hour= h; vehicles[i].minute= min;
            vehicles[i].category = category;
            vehicles[i].occupied = true;
            LOGGER_LOG("Ingreso: %s - %02u/%02u/%02u %02u:%02u Tipo:%d\r\n",
                       plate, d, m, y, h, min, category);
            return true;
        }
    }
    LOGGER_LOG("ERROR: No hay espacio para más vehículos\r\n");
    return false;
}

static uint32_t elapsedMinutes(uint8_t sd, uint8_t sm, uint8_t sy,
                               uint8_t sh, uint8_t smin,
                               uint8_t ed, uint8_t em, uint8_t ey,
                               uint8_t eh, uint8_t emin) {
    int si = (sd * 24 * 60) + (sh * 60) + smin;
    int ei = (ed * 24 * 60) + (eh * 60) + emin;
    return (uint32_t)(ei - si);
}

static uint8_t countVehicles(void) {
    uint8_t cnt = 0;
    for (int i = 0; i < MAX_VEHICLES; i++) if (vehicles[i].occupied) cnt++;
    return cnt;
}

static void showVehicleIndex(int idx) {
    if (idx >= 0 && idx < MAX_VEHICLES && vehicles[idx].occupied) {
        displayClearFull();
        displayCharPositionWrite(0, 0);
        switch (vehicles[idx].category) {
            case BIKE:        displayStringWrite("Bicicleta "); break;
            case MOTORCYCLE:  displayStringWrite("Moto ");      break;
            case CAR:         displayStringWrite("Auto ");      break;
            case TRUCK:       displayStringWrite("Camioneta "); break;
        }
        displayStringWrite(vehicles[idx].plate);

        displayCharPositionWrite(0, 1);
        char horaStr[16];
        snprintf(horaStr, sizeof(horaStr), "Hora: %02u:%02u",
                 vehicles[idx].hour, vehicles[idx].minute);
        displayStringWrite(horaStr);
    } else {
        displayClearFull();
        displayCharPositionWrite(0, 0);
        displayStringWrite("No hay vehiculos");
    }
}

#define EXIT_HDR_ADDR    0x0800u
#define EXIT_BASE_ADDR   0x0810u

#define EXIT_HDR_ADDR    0x0800u
#define EXIT_BASE_ADDR   0x0810u

typedef struct __attribute__((packed)) {
    uint8_t  magicH;   /* 'X' */
    uint8_t  magicL;   /* 'L' */
    uint8_t  version;  /* 1 */
    uint16_t count;    
    uint8_t  reserved; 
} exit_hdr_t;

typedef struct __attribute__((packed)) {
    char     plate[4];
    uint8_t  category;     
    /* date/time IN */
    uint8_t  in_day, in_month, in_year, in_hour, in_min;
    /* date/time OUT */
    uint8_t  out_day, out_month, out_year, out_hour, out_min;
    /* Parking duration and charges */
    uint16_t minutes;
    uint16_t price;
} exit_log_rec_t;

#define EXIT_MAGIC_H  'X'
#define EXIT_MAGIC_L  'L'
#define EXIT_VERSION  1

static exit_hdr_t g_exit_hdr;

static HAL_StatusTypeDef exitlog_read_hdr(void){
    return EEPROM_Read(EXIT_HDR_ADDR, (uint8_t*)&g_exit_hdr, sizeof(g_exit_hdr));
}
static HAL_StatusTypeDef exitlog_write_hdr(void){
    return EEPROM_Write(EXIT_HDR_ADDR, (uint8_t*)&g_exit_hdr, sizeof(g_exit_hdr));
}
static HAL_StatusTypeDef exitlog_init(void){
    HAL_StatusTypeDef st = EEPROM_Init();
    if (st != HAL_OK) return st;

    st = exitlog_read_hdr();
    if (st != HAL_OK ||
        g_exit_hdr.magicH != EXIT_MAGIC_H ||
        g_exit_hdr.magicL != EXIT_MAGIC_L ||
        g_exit_hdr.version != EXIT_VERSION)
    {
        g_exit_hdr.magicH = EXIT_MAGIC_H;
        g_exit_hdr.magicL = EXIT_MAGIC_L;
        g_exit_hdr.version= EXIT_VERSION;
        g_exit_hdr.count  = 0;
        g_exit_hdr.reserved = 0xFF;
        st = exitlog_write_hdr();
    }
    return st;
}
static HAL_StatusTypeDef exitlog_append(const exit_log_rec_t* rec){
    if (!rec) return HAL_ERROR;
    uint32_t next = EXIT_BASE_ADDR + (uint32_t)g_exit_hdr.count * sizeof(exit_log_rec_t);
    if (next + sizeof(exit_log_rec_t) > EEPROM_SIZE_BYTES) {
        return HAL_ERROR; 
    }
    HAL_StatusTypeDef st = EEPROM_Write((uint16_t)next, (const uint8_t*)rec, sizeof(exit_log_rec_t));
    if (st != HAL_OK) return st;
    g_exit_hdr.count++;
    return exitlog_write_hdr();
}

/********************** external functions definition ************************/
void task_menu_init(void *parameters){

    volatile task_menu_dta_t *p_task_menu_dta;
    task_menu_st_t   state;
    task_menu_ev_t   event;
    bool             b_event;

    LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_menu_init), p_task_menu);
    LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_menu), p_task_menu_);

    g_task_menu_cnt = G_TASK_MEN_CNT_INI;

    LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_menu_cnt), g_task_menu_cnt);

    init_queue_event_task_menu();

    p_task_menu_dta = &task_menu_dta;

    state = p_task_menu_dta->state;
    LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

    event = p_task_menu_dta->event;
    LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

    b_event = p_task_menu_dta->flag;
    LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

    cycle_counter_init();
    cycle_counter_reset();

    displayInit( DISPLAY_CONNECTION_GPIO_4BITS );

    g_task_menu_tick_cnt = G_TASK_MEN_TICK_CNT_INI;

    if (storage_init() == HAL_OK) {
        bool load_cb(const storage_record_t* r, uint16_t idx){
            (void)idx;
            for (int i=0;i<MAX_VEHICLES;i++){
                if (!vehicles[i].occupied){
                    strncpy(vehicles[i].plate, r->patente, sizeof(vehicles[i].plate)-1);
                    vehicles[i].plate[sizeof(vehicles[i].plate)-1]='\0';
                    vehicles[i].day=r->day;   vehicles[i].month=r->month; vehicles[i].year=r->year;
                    vehicles[i].hour=r->hora; vehicles[i].minute=r->minuto;
                    vehicles[i].category=(vehicleType_t)r->categoria;
                    vehicles[i].occupied=true;
                    break;
                }
            }
            return true;
        };
        (void)storage_iterate(load_cb);
        LOGGER_LOG("Historial ingresos: %u\r\n", storage_get_count());
    } else {
        LOGGER_LOG("EEPROM (storage) no disponible\r\n");
    }

    if (exitlog_init() != HAL_OK){
        LOGGER_LOG("EEPROM (egresos) no disponible\r\n");
    }
}

void task_menu_update(void *parameters){
    uint32_t start_cycles = cycle_counter_get(); // Initial time

    volatile task_menu_dta_t *p_task_menu_dta;
    bool b_time_update_required = false;

    g_task_menu_cnt++;

    __asm("CPSID i");
    if (G_TASK_MEN_TICK_CNT_INI < g_task_menu_tick_cnt)
    {
        g_task_menu_tick_cnt--;
        b_time_update_required = true;
    }
    __asm("CPSIE i");

    while (b_time_update_required){

        __asm("CPSID i");
        if (G_TASK_MEN_TICK_CNT_INI < g_task_menu_tick_cnt){
            g_task_menu_tick_cnt--;
            b_time_update_required = true;
        }
        else{
            b_time_update_required = false;
        }
        __asm("CPSIE i");

        p_task_menu_dta = &task_menu_dta;

        if (key_lock_ticks > 0) key_lock_ticks--;

        keypadUpdate();

        if (keypadKeyAvailable() && key_lock_ticks == 0) {
            key_lock_ticks = KEY_LOCK_TICKS;

            char key = keypadReadKey();

            if (type_selection_in_progress) {
                if (key == 'D') {
                    vehicle_type_page = !vehicle_type_page;
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                    displayCharPositionWrite(0, 1);
                    displayStringWrite(!vehicle_type_page ? "1:Bici  2:Moto"
                                                          : "3:Auto 4:Pick-Up");
                }
                else if (key >= '1' && key <= '4') {
                    vehicleType_t category = (vehicleType_t)(key - '0');

                    uint8_t d,m,y,h,min;
                    rtc_get_datetime(&d,&m,&y,&h,&min);

                    if (addVehicle(plate_temp, d, m, y, h, min, category)) {
                        storage_record_t rec;
                        strncpy(rec.patente, plate_temp, sizeof(rec.patente)-1);
                        rec.patente[sizeof(rec.patente)-1] = '\0';
                        rec.day = d; rec.month = m; rec.year = y;
                        rec.hora = h; rec.minuto = min;
                        rec.categoria = (uint8_t)category;

                        if (storage_append(&rec) != HAL_OK) {
                            LOGGER_LOG("EEPROM llena o error al guardar INGRESO\r\n");
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            displayStringWrite("EEPROM LLENA");
                            error_display_ticks = DISPLAY_DELAY_TICKS;
                        } else {
                            LOGGER_LOG("Ingreso guardado. Total: %u\r\n", storage_get_count());
                        }

                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        displayStringWrite("Ingresa: ");
                        displayStringWrite(plate_temp);
                        plate_display_ticks = DISPLAY_DELAY_TICKS;
                    } else {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        displayStringWrite("No hay mas lugar");
                        error_display_ticks = DISPLAY_DELAY_TICKS;
                    }
                    type_selection_in_progress = false;
                }
                return;
            }

            if (password_entry_in_progress) {
                if (key >= '0' && key <= '9') {
                    if (password_index < 8) {
                        password_buffer[password_index++] = key;
                        password_buffer[password_index] = '\0';
                        displayRowClear(1); displayCharPositionWrite(0, 1);
                        for (uint8_t i = 0; i < password_index; i++) displayStringWrite("*");
                    }
                    if (password_index == 8) {
                        if (strcmp(password_buffer, DEFAULT_PASSWORD) == 0) {
                            password_entry_in_progress = false;
                            rate_change_in_progress = true;
                            current_rate_idx = 0; rate_index = 0; rate_buffer[0] = '\0';
                            displayClearFull();
                            displayCharPositionWrite(0, 0); displayStringWrite("Nueva tarifa:");
                            displayCharPositionWrite(0, 1); displayStringWrite("Bicicleta: ");
                        } else {
                            password_entry_in_progress = false;
                            displayClearFull();
                            displayCharPositionWrite(0, 0); displayStringWrite("Clave incorrecta");
                            funds_display_ticks = 6;
                            setup_menu_active = true;
                            LOGGER_LOG("Clave incorrecta\r\n");
                        }
                    }
                }
                else if (key == 'C') {
                    if (password_index > 0) {
                        password_index--;
                        password_buffer[password_index] = '\0';
                        displayRowClear(1); displayCharPositionWrite(0, 1);
                        for (uint8_t i = 0; i < password_index; i++) displayStringWrite("*");
                    }
                }
                return;
            }

            /* ======== Rate changes ======== */
            if (rate_change_in_progress) {
                if (key >= '0' && key <= '9') {
                    if (rate_index < 3) { rate_buffer[rate_index++] = key; rate_buffer[rate_index] = '\0'; }
                }
                else if (key == 'D') {
                    uint8_t valor = (uint8_t)atoi(rate_buffer);
                    switch (current_rate_idx) {
                        case 0: rates.bike_rate = valor; break;
                        case 1: rates.motorcycle_rate = valor; break;
                        case 2: rates.car_rate = valor; break;
                        case 3: rates.truck_rate = valor; break;
                    }
                    current_rate_idx++; rate_index = 0; rate_buffer[0] = '\0';

                    if (current_rate_idx > 3) {
                        rate_change_in_progress = false;
                        setup_menu_active = true;
                        displayClearFull();
                        displayCharPositionWrite(0, 0); displayStringWrite("Tarifas:1 Caja:2");
                        displayCharPositionWrite(0, 1); displayStringWrite("Lista:3   Hora:4");
                    } else {
                        displayClearFull();
                        displayCharPositionWrite(0, 0); displayStringWrite("Nueva tarifa:");
                        displayCharPositionWrite(0, 1);
                        if (current_rate_idx == 0)      displayStringWrite("Bicicleta: ");
                        else if (current_rate_idx == 1) displayStringWrite("Moto: ");
                        else if (current_rate_idx == 2) displayStringWrite("Auto: ");
                        else if (current_rate_idx == 3) displayStringWrite("Camioneta: ");
                    }
                }
                return;
            }

            /* ======== Vehicles list ======== */
            if (display_list_in_progress) {
                if (key == 'D') {
                    int start = current_list_index;
                    do {
                        current_list_index = (current_list_index + 1) % MAX_VEHICLES;
                    } while (!vehicles[current_list_index].occupied && current_list_index != start);
                    showVehicleIndex(current_list_index);
                }
                else if (key == 'C') {
                    int start = current_list_index;
                    do {
                        current_list_index = (current_list_index - 1 + MAX_VEHICLES) % MAX_VEHICLES;
                    } while (!vehicles[current_list_index].occupied && current_list_index != start);
                    showVehicleIndex(current_list_index);
                }
                else if (key == '#') {
                    display_list_in_progress = false;
                    setup_menu_active = true;
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tarifas:1 Caja:2");
                    displayCharPositionWrite(0, 1); displayStringWrite("Lista:3   Hora:4");
                }
                return;
            }

            /* ======== Date/Time editor ======== */
            if (dt_edit_in_progress) {
                if (key >= '0' && key <= '9') {
                    if (dt_idx < 2) {
                        dt_buf[dt_idx++] = key;
                        dt_buf[dt_idx] = '\0';

                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        switch (dt_step) {
                            case 0: displayStringWrite("DD:"); break;
                            case 1: displayStringWrite("MM:"); break;
                            case 2: displayStringWrite("YY:"); break;
                            case 3: displayStringWrite("HH:"); break;
                            case 4: displayStringWrite("mm:"); break;
                        }
                        displayStringWrite("__");
                        displayCharPositionWrite(3, 1);
                        displayStringWrite(dt_buf);
                    }
                }
                else if (key == 'C') {
                    if (dt_idx > 0) {
                        dt_idx--;
                        dt_buf[dt_idx] = '\0';
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        switch (dt_step) {
                            case 0: displayStringWrite("DD:"); break;
                            case 1: displayStringWrite("MM:"); break;
                            case 2: displayStringWrite("YY:"); break;
                            case 3: displayStringWrite("HH:"); break;
                            case 4: displayStringWrite("mm:"); break;
                        }
                        displayStringWrite("__");
                        displayCharPositionWrite(3, 1);
                        displayStringWrite(dt_buf);
                    }
                }
                else if (key == 'D') {
                    if (dt_idx == 2) {
                        uint8_t v = (uint8_t)atoi(dt_buf);
                        bool ok = false;
                        switch (dt_step) {
                            case 0: if (v >= 1 && v <= 31) { ed_day   = v; ok = true; } break;
                            case 1: if (v >= 1 && v <= 12) { ed_month = v; ok = true; } break;
                            case 2:                          { ed_year  = v; ok = true; } break;
                            case 3: if (v <= 23)            { ed_hour  = v; ok = true; } break;
                            case 4: if (v <= 59)            { ed_minute= v; ok = true; } break;
                        }

                        if (!ok) {
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1); displayStringWrite("Valor invalido");
                            dt_idx = 0; dt_buf[0] = '\0';
                        } else {
                            dt_step++;
                            dt_idx = 0; dt_buf[0] = '\0';

                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            if (dt_step == 1)      displayStringWrite("MM:__");
                            else if (dt_step == 2) displayStringWrite("YY:__");
                            else if (dt_step == 3) displayStringWrite("HH:__");
                            else if (dt_step == 4) displayStringWrite("mm:__");
                            else {
                                if (rtc_set_datetime(ed_day, ed_month, ed_year, ed_hour, ed_minute) == HAL_OK) {
                                    rtc_mark_initialized();
                                    displayClearFull();
                                    displayCharPositionWrite(0, 0); displayStringWrite("Reloj actualizado");
                                    dt_msg_ticks = 6;
                                } else {
                                    displayClearFull();
                                    displayCharPositionWrite(0, 0); displayStringWrite("Error al ajustar");
                                    dt_msg_ticks = 6;
                                }
                                dt_edit_in_progress = false;
                                setup_menu_active = true;
                            }
                        }
                    } else {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1); displayStringWrite("Ingrese 2 digitos");
                    }
                }
                return;
            }

            /* ======== Type selection ======== */
            if (exit_type_selection_in_progress) {
                if (key == 'D') {
                    exit_vehicle_type_page = !exit_vehicle_type_page;
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                    displayCharPositionWrite(0, 1);
                    displayStringWrite(!exit_vehicle_type_page ? "1:Bici  2:Moto"
                                                               : "3:Auto 4:Pick-Up");
                }
                else if (key >= '1' && key <= '4') {
                    vehicleType_t category = (vehicleType_t)(key - '0');

                    int idx = findVehicle(plate_temp);
                    if (idx >= 0) {
                        if (vehicles[idx].category != category) {
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1); displayStringWrite("No encontrado");
                            exit_display_ticks = DISPLAY_DELAY_TICKS;
                            LOGGER_LOG("Error tipo egreso %s (esp %d, ing %d)\r\n",
                                       plate_temp, vehicles[idx].category, category);
                        } else {
                            uint8_t d_now, m_now, y_now, h_now, min_now;
                            rtc_get_datetime(&d_now,&m_now,&y_now,&h_now,&min_now);

                            uint32_t mins = elapsedMinutes(
                                vehicles[idx].day, vehicles[idx].month, vehicles[idx].year,
                                vehicles[idx].hour, vehicles[idx].minute,
                                d_now, m_now, y_now, h_now, min_now
                            );
                            uint32_t price = 0;
                            switch (category) {
                                case BIKE:        price = mins * rates.bike_rate; break;
                                case MOTORCYCLE:  price = mins * rates.motorcycle_rate; break;
                                case CAR:         price = mins * rates.car_rate; break;
                                case TRUCK:       price = mins * rates.truck_rate; break;
                                default: break;
                            }

                            char msg[16];
                            snprintf(msg, sizeof(msg), "Tiempo: %lu min", mins);
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1); displayStringWrite(msg);
                            exit_display_ticks = DISPLAY_DELAY_TICKS;

                            snprintf(price_msg, sizeof(price_msg), "Precio: $%lu", price);
                            price_display_ticks = DISPLAY_DELAY_TICKS;

                            LOGGER_LOG("Egreso %s - %lu min - Tipo:%d - $%lu\r\n",
                                       plate_temp, mins, category, price);

                            total_collected += price;

                            exit_log_rec_t x;
                            strncpy(x.plate, plate_temp, sizeof(x.plate)-1);
                            x.plate[sizeof(x.plate)-1]='\0';
                            x.category  = (uint8_t)category;
                            x.in_day    = vehicles[idx].day;   x.in_month = vehicles[idx].month;
                            x.in_year   = vehicles[idx].year;  x.in_hour  = vehicles[idx].hour;
                            x.in_min    = vehicles[idx].minute;
                            x.out_day   = d_now;   x.out_month = m_now; x.out_year = y_now;
                            x.out_hour  = h_now;   x.out_min   = min_now;
                            x.minutes   = (uint16_t)((mins > 65535u) ? 65535u : mins);
                            x.price     = (uint16_t)((price > 65535u) ? 65535u : price);

                            if (exitlog_append(&x) != HAL_OK){
                                LOGGER_LOG("EEPROM egresos: LLENA/ERROR\r\n");
                            }

                            vehicles[idx].occupied = false;
                        }
                    } else {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1); displayStringWrite("No encontrado");
                        exit_display_ticks = DISPLAY_DELAY_TICKS;
                        LOGGER_LOG("Patente %s no encontrada\r\n", plate_temp);
                    }

                    exit_type_selection_in_progress = false;
                    exit_in_progress = false;
                }
                return;
            }

            /* ======== Swap mode ======== */
            if (key == 'A') {
                if (current_mode == NORMAL_MODE) {
                    current_mode = SETUP_MODE;
                    setup_menu_active = true;
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tarifas:1 Caja:2");
                    displayCharPositionWrite(0, 1); displayStringWrite("Lista:3   Hora:4");
                } else {
                    current_mode = NORMAL_MODE;
                    setup_menu_active = false;
                }
            }
            else if (current_mode == NORMAL_MODE) {

                if (key == '#') {
                    exit_in_progress = true;
                    exit_plate_index = 0;
                    exit_plate_buffer[0] = '\0';
                    displayCharPositionWrite(0, 1); displayStringWrite("Egreso:      ");
                }
                else if (exit_in_progress) {
                    if (key >= '0' && key <= '9') {
                        if (exit_plate_index < 3) {
                            exit_plate_buffer[exit_plate_index++] = key;
                            exit_plate_buffer[exit_plate_index]   = '\0';
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            displayStringWrite("Egreso: ");
                            displayStringWrite(exit_plate_buffer);
                        }
                        if (exit_plate_index == 3) {
                            strcpy(plate_temp, exit_plate_buffer);
                            exit_type_selection_in_progress = true;
                            exit_vehicle_type_page = false;
                            displayClearFull();
                            displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                            displayCharPositionWrite(0, 1); displayStringWrite("1:Bici  2:Moto");
                        }
                    }
                    else if (key == 'C') {
                        if (exit_plate_index > 0) {
                            exit_plate_index--;
                            exit_plate_buffer[exit_plate_index] = '\0';
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            displayStringWrite("Egreso: ");
                            displayStringWrite(exit_plate_buffer);
                        }
                    }
                }
                else {
                    if (key >= '0' && key <= '9') {
                        if (plate_index < 3) {
                            plate_buffer[plate_index++] = key;
                            plate_buffer[plate_index]   = '\0';
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            displayStringWrite("Ingreso: ");
                            displayStringWrite(plate_buffer);
                        }
                        if (plate_index == 3) {
                            strcpy(plate_temp, plate_buffer);
                            type_selection_in_progress = true;
                            vehicle_type_page = false;

                            displayClearFull();
                            displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                            displayCharPositionWrite(0, 1); displayStringWrite("1:Bici  2:Moto");

                            plate_index = 0; plate_buffer[0] = '\0';
                        }
                    }
                    else if (key == 'C') {
                        if (plate_index > 0) {
                            plate_index--;
                            plate_buffer[plate_index] = '\0';
                            displayRowClear(1);
                            displayCharPositionWrite(0, 1);
                            displayStringWrite("Ingreso: ");
                            displayStringWrite(plate_buffer);
                        }
                    }
                }
            }
            else if (current_mode == SETUP_MODE) {
                if (setup_menu_active) {
                    if (key == '1') {
                        LOGGER_LOG("Opcion: Cambio tarifas\r\n");
                        password_entry_in_progress = true;
                        password_index = 0; password_buffer[0] = '\0';
                        displayClearFull();
                        displayCharPositionWrite(0, 0); displayStringWrite("Ingrese clave:");
                        displayCharPositionWrite(0, 1);
                    }
                    else if (key == '2') {
                        LOGGER_LOG("Opcion: Caja\r\n");
                        char msg[16];
                        snprintf(msg, sizeof(msg), "Caja: $%lu", total_collected);
                        displayClearFull();
                        displayCharPositionWrite(0, 0); displayStringWrite("Recaudado total:");
                        displayCharPositionWrite(0, 1); displayStringWrite(msg);
                        funds_display_ticks = 6;
                    }
                    else if (key == '3') {
                        LOGGER_LOG("Opcion: Listado\r\n");
                        display_list_in_progress = true;
                        current_list_index = 0;
                        while (current_list_index < MAX_VEHICLES && !vehicles[current_list_index].occupied){
                            current_list_index++;
                        }
                        showVehicleIndex(current_list_index);
                    }
                    else if (key == '4') {
                        rtc_get_datetime(&ed_day,&ed_month,&ed_year,&ed_hour,&ed_minute);
                        dt_edit_in_progress = true;
                        dt_step = 0; dt_idx = 0; dt_buf[0] = '\0';
                        setup_menu_active = false;

                        displayClearFull();
                        displayCharPositionWrite(0, 0); displayStringWrite("Ajuste Fecha/Hr");
                        displayCharPositionWrite(0, 1); displayStringWrite("DD:__");
                    }
                }
            }
        } 

        if (DEL_MEN_XX_MIN < p_task_menu_dta->tick){
            p_task_menu_dta->tick--;
        }
        else{
            p_task_menu_dta->tick = DEL_MEN_XX_MAX;
            uint8_t d,m,y,h,min;
            rtc_get_datetime(&d,&m,&y,&h,&min);

            char fechaStr[12];
            char hourStr[8];
            snprintf(fechaStr, sizeof(fechaStr), "%02u/%02u/%02u", d, m, y);
            snprintf(hourStr,  sizeof(hourStr),  "%02u:%02u", h, min);

            if (!display_list_in_progress){
                displayRowClear(0);
                displayCharPositionWrite(0, 0); displayStringWrite(fechaStr);
                displayCharPositionWrite(11,0); displayStringWrite(hourStr);

                if (type_selection_in_progress) {
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                    displayCharPositionWrite(0, 1);
                    displayStringWrite(!vehicle_type_page ? "1:Bici  2:Moto"
                                                          : "3:Auto 4:Pick-Up");
                }
                else if (exit_type_selection_in_progress) {
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Tipo Vehiculo:");
                    displayCharPositionWrite(0, 1);
                    displayStringWrite(!exit_vehicle_type_page ? "1:Bici  2:Moto"
                                                               : "3:Auto 4:Pick-Up");
                }
                else if (password_entry_in_progress) {
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Ingrese clave:");
                    displayCharPositionWrite(0, 1);
                    for (uint8_t i = 0; i < password_index; i++) displayStringWrite("*");
                }
                else if (rate_change_in_progress) {
                    displayClearFull();
                    displayCharPositionWrite(0, 0); displayStringWrite("Nueva tarifa:");
                    displayCharPositionWrite(0, 1);
                    if (current_rate_idx == 0)      displayStringWrite("Bicicleta: ");
                    else if (current_rate_idx == 1) displayStringWrite("Moto: ");
                    else if (current_rate_idx == 2) displayStringWrite("Auto: ");
                    else if (current_rate_idx == 3) displayStringWrite("Camioneta: ");
                    displayStringWrite(rate_buffer);
                }
                else if (dt_edit_in_progress) {
                    displayClearFull();
                    displayCharPositionWrite(0, 0); 
                    displayStringWrite("Ajuste Fecha/Hr");
                    
                    displayCharPositionWrite(0, 1);
                    switch (dt_step) {
                        case 0: displayStringWrite("DD:"); break;
                        case 1: displayStringWrite("MM:"); break;
                        case 2: displayStringWrite("YY:"); break;
                        case 3: displayStringWrite("HH:"); break;
                        case 4: displayStringWrite("mm:"); break;
                    }
                    displayStringWrite(dt_buf);  
                }
                else if (dt_msg_ticks > 0) {
                    dt_msg_ticks--;
                }
                else if (exit_display_ticks > 0) {
                    exit_display_ticks--;
                    if (exit_display_ticks == 0 && price_display_ticks > 0) {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        displayStringWrite(price_msg);
                    }
                }
                else if (price_display_ticks > 0) {
                    price_display_ticks--;
                }
                else if (funds_display_ticks > 0) {
                    funds_display_ticks--;
                }
                else if (plate_index == 0 && plate_display_ticks == 0 && exit_display_ticks == 0) {
                    if (error_display_ticks > 0) {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        displayStringWrite("No hay mas lugar");
                    }
                    else if (exit_in_progress && exit_plate_index < 3) {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        displayStringWrite("Egreso: ");
                        displayStringWrite(exit_plate_buffer);
                    }
                    else {
                        displayRowClear(1);
                        displayCharPositionWrite(0, 1);
                        if (current_mode == NORMAL_MODE) {
                            char msg[16];
                            snprintf(msg, sizeof(msg), "En playa: %u", countVehicles());
                            displayStringWrite(msg);
                        }
                        else if (current_mode == SETUP_MODE && setup_menu_active) {
                            displayClearFull();
                            displayCharPositionWrite(0, 0); displayStringWrite("Tarifas:1 Caja:2");
                            displayCharPositionWrite(0, 1); displayStringWrite("Lista:3   Hora:4");
                        }
                    }
                }
            }

            if (true == any_event_task_menu()){
                p_task_menu_dta->flag = true;
                p_task_menu_dta->event = get_event_task_menu();
            }

            if (plate_display_ticks > 0) plate_display_ticks--;
            if (error_display_ticks > 0) error_display_ticks--;

            switch (p_task_menu_dta->state){
                case ST_MEN_XX_IDLE:
                    if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_ACTIVE == p_task_menu_dta->event)){
                        p_task_menu_dta->flag = false;
                        p_task_menu_dta->state = ST_MEN_XX_ACTIVE;
                    }
                    break;
                case ST_MEN_XX_ACTIVE:
                    if ((true == p_task_menu_dta->flag) && (EV_MEN_ENT_IDLE == p_task_menu_dta->event)){
                        p_task_menu_dta->flag = false;
                        p_task_menu_dta->state = ST_MEN_XX_IDLE;
                    }
                    break;
                default:
                    p_task_menu_dta->tick  = DEL_MEN_XX_MIN;
                    p_task_menu_dta->state = ST_MEN_XX_IDLE;
                    p_task_menu_dta->event = EV_MEN_ENT_IDLE;
                    p_task_menu_dta->flag  = false;
                    break;
            }
        } 
    } 
    
    uint32_t elapsed_cycles = cycle_counter_get() - start_cycles;
    uint32_t elapsed_us = elapsed_cycles / (SystemCoreClock / 1000000U);

    if (elapsed_us > task_menu_dta.wcet_us) {
        task_menu_dta.wcet_us = elapsed_us;
    }
}

/********************** end of file ******************************************/
