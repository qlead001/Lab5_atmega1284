/*	Author: Quinn Leader qlead001@ucr.edu
 *  Partner(s) Name: NA
 *	Lab Section: 026
 *	Assignment: Lab 5  Exercise 1
 *	Exercise Description: Lab 3 Exercise 2
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0xFF;
    DDRC = 0xFF; PORTC = 0x00;
    /* Insert your solution below */
    unsigned char tempA = 0x00;
    unsigned char out = 0x00;
    while (1) {
        tempA = (~PINA)&0x0F;
        out = ((tempA<5)<<6) + ((tempA>0)<<5) + ((tempA>2)<<4) +
        ((tempA>4)<<3) + ((tempA>6)<<2) + ((tempA>9)<<1) + (tempA>12);
        PORTC = out;
    }
    return 1;
}
