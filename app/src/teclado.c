//=====[Libraries]=============================================================

#include "teclado.h"
#include "main.h"
#include <string.h>

//=====[Declaration of private defines]========================================
#define COL1_GPIO_Port  D13_GPIO_Port
#define COL1_Pin        D13_Pin      // PB9
#define COL2_GPIO_Port  D12_GPIO_Port
#define COL2_Pin        D12_Pin      // PA6
#define COL3_GPIO_Port  D11_GPIO_Port
#define COL3_Pin        D11_Pin      // PA7
#define COL4_GPIO_Port  D10_GPIO_Port
#define COL4_Pin        D10_Pin      // PB6

#define ROW1_GPIO_Port  A3_GPIO_Port  // PB0
#define ROW1_Pin        A3_Pin

#define ROW2_GPIO_Port  A4_GPIO_Port  // PA4
#define ROW2_Pin        A4_Pin

#define ROW3_GPIO_Port  A1_GPIO_Port  // PA1
#define ROW3_Pin        A1_Pin

#define ROW4_GPIO_Port  A0_GPIO_Port  // PA0
#define ROW4_Pin        A0_Pin

//=====[Declaration of external public global variables]=======================

//=====[Declaration and initialization of private global variables]============
static const char keypad_map[4][4] = {
    {'1', '2', '3', 'A'},
    {'4', '5', '6', 'B'},
    {'7', '8', '9', 'C'},
    {'*', '0', '#', 'D'}
};

//=====[Declarations (prototypes) of private functions]========================
static GPIO_TypeDef *col_ports[4] = {COL1_GPIO_Port, COL2_GPIO_Port, COL3_GPIO_Port, COL4_GPIO_Port};
static uint16_t      col_pins[4]  = {COL1_Pin,       COL2_Pin,       COL3_Pin,       COL4_Pin};

static GPIO_TypeDef *row_ports[4] = {ROW1_GPIO_Port, ROW2_GPIO_Port, ROW3_GPIO_Port, ROW4_GPIO_Port};
static uint16_t      row_pins[4]  = {ROW1_Pin,       ROW2_Pin,       ROW3_Pin,       ROW4_Pin};

static char detectedKey = 0;
static bool keyAvailable = false;

//=====[Implementations of private functions]==================================

//=====[Implementations of public functions]===================================
void keypadUpdate(void){
    if (keyAvailable){
        return;  // Wait until previous key is processed
    }

    for (int col = 0; col < 4; col++){
        // Set current column low, others high
        for (int i = 0; i < 4; i++) {
            HAL_GPIO_WritePin(col_ports[i], col_pins[i], GPIO_PIN_SET);  // Inactive
        }
        HAL_GPIO_WritePin(col_ports[col], col_pins[col], GPIO_PIN_RESET); // Active

        for (volatile int d = 0; d < 1000; d++);

        // Read rows
        for (int row = 0; row < 4; row++){
            if (HAL_GPIO_ReadPin(row_ports[row], row_pins[row]) == GPIO_PIN_RESET){
                detectedKey = keypad_map[row][col];
                keyAvailable = true;

                // Debounce
                while (HAL_GPIO_ReadPin(row_ports[row], row_pins[row]) == GPIO_PIN_RESET);
                return;
            }
        }
    }
}

bool keypadKeyAvailable(void){
    return keyAvailable;
}

char keypadReadKey(void){
    keyAvailable = false;
    return detectedKey;
}



/********************** end of file ******************************************/
