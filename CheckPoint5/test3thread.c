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
__data __at(0x00) char delay[5] ;
__data __at(0x2E) char mutex;
__data __at(0x3A) char i;
__data __at(0x3B) char empty;
__data __at(0x2B) char spot[2];
__data __at(0x32) char numOfThreads;
__data __at(0x2A) char time;
__data __at(0x20) char enter[5];
__data __at(0x25) char leave[5] ;
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
void Parking1(void) {
        /*
         * @@@ [2 pt]
         * initialize producer data structure, and then enter
         * an infinite loop (does not return)
         */
        while(1){
                while (delay[0]!=0) {ThreadYield();}
                for(i=0 ; i<2 ; i++){
                        if(((spot[i]==1) && (delay[0] == 0)) ){
                                leave[0] = now();
                                spot[i] = '_';
                                SemaphoreSignal(empty);
                                ThreadExit();
                        }
                        if((spot[i]=='_')){
                                SemaphoreWait(empty);
                                enter[0] = now();
                                spot[i] = 1;
                                setDelay(8);
                                break;
                        }
                }

              
        }
       
}

void Parking2(void){

	while(1){
        	while (delay[1]!=0) {ThreadYield();}
                for(i=0 ; i<2 ; i++){
                        if(((spot[i]==2) && (delay[1] == 0)) ){
                                leave[1] = now();
                                spot[i] = '_';
                                SemaphoreSignal(empty);
                                ThreadExit();
                        }
                        if((spot[i]=='_')&&(enter[1]=='_')){
                                SemaphoreWait(empty);
                                enter[1] = now();
                                spot[i] = 2;
                                setDelay(2);
                                break;
                        }
                }

        }
}


void Parking3(void){

	while(1){
        	while (delay[2]!=0) {ThreadYield();}
                for(i=0 ; i<2 ; i++){
                        if(((spot[i]==3) && (delay[2] == 0)) ){
                                leave[2] = now();
                                spot[i] = '_';
                                SemaphoreSignal(empty);
                                ThreadExit();
                        }
                        if((spot[i]=='_')){
                                SemaphoreWait(empty);
                                enter[2] = now();
                                spot[i] = 3;
                                setDelay(4);
                                break;
                        }
                }

        }
}


void Parking4(void){

	while(1){
        	while (delay[3]!=0) {ThreadYield();}
                for(i=0 ; i<2 ; i++){
                        if(((spot[i]==4) && (delay[3] == 0)) ){
                                leave[3] = now();
                                spot[i] = '_';
                                SemaphoreSignal(empty);
                                ThreadExit();
                        }
                        if((spot[i]=='_')){
                                SemaphoreWait(empty);
                                enter[3] = now();
                                spot[i] = 4;
                                setDelay(2);
                                break;
                        }
                }

        }
}
void Parking5(void){

	while(1){
        	while (delay[4]!=0) {ThreadYield();}
                for(i=0 ; i<2 ; i++){
                        if(((spot[i]==5) && (delay[4] == 0)) ){
                                leave[4] = now();
                                spot[i] = '_';
                                SemaphoreSignal(empty);
                                ThreadExit();
                        }
                        if((spot[i]=='_')){
                                SemaphoreWait(empty);
                                enter[4] = now();
                                spot[i] = 5;
                                setDelay(2);
                                break;
                        }
                }

        }
}
/* [10 pts for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */


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
        SemaphoreCreate(&empty, 2);   
        ThreadCreate(Parking1);
        ThreadCreate(Parking2);
        ThreadCreate(Parking3);

        TMOD |= 0x20;
        TH1 = (char)-6;
        SCON = 0x50;
        TR1 = 1;
        TI = 1;
        
        ThreadYield();  // start parking

        while (numOfThreads >= 4) {ThreadYield();}
        ThreadCreate(Parking4);  // have available thread, create a new one for car 4

        while (numOfThreads >= 4) {ThreadYield();}
        ThreadCreate(Parking5);  // have available thread, create a new one for car 5
        
        while (numOfThreads != 1) {ThreadYield();}
        
        ThreadExit();  // all parking finished, exit this example
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



