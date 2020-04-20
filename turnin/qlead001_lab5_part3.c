/*	Author: Quinn Leader qlead001@ucr.edu
 *  Partner(s) Name: NA
 *	Lab Section: 026
 *	Assignment: Lab 5  Exercise 3
 *	Exercise Description: Festive lights display
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

enum States {
    Start,
    Press,
    Release,
} state;

unsigned char indexPatterns;
const unsigned char lenPatterns = 15;
const unsigned char patterns[] = {1,2,4,8,16,32,16,8,4,2,1,21,42,0x3F,0};

void Tick() {
    switch(state) { // Transitions
        case Start:
            state = Press;
            indexPatterns = 0;
            break;
        case Press:
            if (PINA&0x01) {
                state = Release;
		indexPatterns = (indexPatterns+1)%lenPatterns;
            }
            break;
        case Release:
            if (!(PINA&0x01)) state = Press;
            break;
        default:
            state = Start;
            break;
    } // Transitions

    switch(state) { // State Actions
        case Start:
            break;
        default:
            break;
    } // State Actions

    PORTB = patterns[indexPatterns];
}

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0xFF;
    DDRB = 0xFF; PORTB = 0x00;
    /* Insert your solution below */
    state = Start;
    while (1) {
        Tick();
    }
    return 1;
}
