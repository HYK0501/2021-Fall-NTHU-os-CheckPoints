/* 
 * file: testcoop.c 
 */
#include <8051.h>
#include "preemptive.h"



/* 
 * @@@ [2pt] 
 * declare your global variables here, for the shared buffer 
 * between the producer and consumer.  
 * Hint: you may want to manually designate the location for the 
 * variable.  you can use
 *        __data __at (0x30) type var; 
 * to declare a variable var of the type
 */ 
__data __at(0x3C) char sharedBuffer[3] = {' ', ' ', ' '};
__data __at(0x2E) char mutex;
__data __at(0x3A) char full;
__data __at(0x3B) char empty;
__data __at(0x3F) char produce;
__data __at(0x2F) char comsume;
__data __at(0x32) char nextChar;
/* [8 pts] for this function
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */

void SemaphoreCreate(char *s, char n) {
   EA=0;
   *s = n;
   EA= 1;
   return;
}
void Producer(void) {
        /*
         * @@@ [2 pt]
         * initialize producer data structure, and then enter
         * an infinite loop (does not return)
         */
        __asm
        MOV 0X32,#0X40
        __endasm;
        while(1){
        	SemaphoreWait(empty);//number 0f empty block
        	SemaphoreWait(mutex);
        	nextChar +=1;
        	sharedBuffer[produce] = nextChar;
        	produce+=1;
        	if(nextChar >  'Z'){
        		nextChar = 'A';
         	}
        	if(produce==3){
        		produce = 0 ;
        	}
		SemaphoreSignal(mutex);
   		SemaphoreSignal(full);
        }
       
}


/* [10 pts for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void) {
        /* @@@ [2 pt] initialize Tx for polling */
        __asm
        ORL 0X89 , #0X20
        __endasm;
        TH1 = (char)-6;
        SCON = 0x50;
        TR1 = 1;
        TI = 1;
        while (1) {
                /* @@@ [2 pt] wait for new data from producer
                 * @@@ [6 pt] write data to serial port Tx, 
                 * poll for Tx to finish writing (TI),
                 * then clear the flag
                 */
                 SemaphoreWait(full);
                 SemaphoreWait(mutex);
                 while(!TI){}              	
                 SBUF = sharedBuffer[comsume];
                 comsume +=1;
                 if(comsume==3)comsume = 0;
                 TI = 0 ;
                 SemaphoreSignal(mutex);
                 SemaphoreSignal(empty);
        }
}

/* [5 pts for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void) {
	
          /* 
           * @@@ [1 pt] initialize globals 
           * @@@ [4 pt] set up Producer and Consumer.
           * Because both are infinite loops, there is no loop
           * in this function and no return.
           */
           SemaphoreCreate(&mutex, 1);
           SemaphoreCreate(&full, 0);
           SemaphoreCreate(&empty, 3);
           produce = 0;
           comsume = 0;
           ThreadCreate(Producer);
           __asm
           	MOV SP,0x34
           __endasm;
           Consumer();         
}

void _sdcc_gsinit_startup(void) {
        __asm
                ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
                ljmp _myTimer0Handler
        __endasm;
}



