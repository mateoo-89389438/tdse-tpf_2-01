//=====[#include guards - begin]===============================================

#ifndef _DISPLAY_H_
#define _DISPLAY_H_

#include <stdint.h>

//=====[Declaration of public defines]=========================================

//=====[Declaration of public data types]======================================

typedef enum {
     DISPLAY_CONNECTION_GPIO_4BITS,
     DISPLAY_CONNECTION_GPIO_8BITS,
} displayConnection_t;

typedef struct {
   displayConnection_t connection;
} display_t;

extern uint32_t wcet_display_cycles;
extern uint32_t wcet_display_us;

//=====[Declarations (prototypes) of public functions]=========================

void displayInit( displayConnection_t connection );

void displayCharPositionWrite( uint8_t charPositionX, uint8_t charPositionY );

void displayStringWrite( const char * str );

void displayRowClear( char x );

void displayClearFull( void );

//=====[#include guards - end]=================================================

#endif // _DISPLAY_H_
