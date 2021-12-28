#include <8051.h>

#include "preemptive.h"

/*
 * @@@ [2 pts] declare the static globals here using 
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread; 
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */
 __data __at(0x3B) char empty;
__data __at(0x0E) char delaySetPark;
__data __at(0x10) char ThreadIds[6];
__data __at(0x16) char index = 0;
__data __at(0x30) ThreadId createdThreadId;
__data __at(0x31) ThreadId currentThreadId;
__data __at(0x33) int bitmap;
__data __at(0x34) int Thread0SP;
__data __at(0x35) int Thread1SP;
__data __at(0x36) int Thread2SP;
__data __at(0x37) int Thread3SP;
__data __at(0x38) int TempSP;
__data __at(0x2F) int LastProducerId;
__data __at(0x2A) char time;
__data __at(0x20) char enter[5];
__data __at(0x25) char leave[5] ;
__data __at(0x3C) char delay[5] ;
__data __at(0x3A) char i;
__data __at(0x2B) char spot[2];
/*
 * @@@ [8 pts]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly, 
 *     while 2) can be written in either assembly or C
 */
 
#define SAVESTATE \
        {\
          __asm\
          PUSH ACC\
          PUSH B\
          PUSH DPL\
          PUSH DPH\
          PUSH PSW\
          __endasm;\
          switch (currentThreadId) { \
      		case 0 : \
         	 __asm \
                	MOV 0x34, SP \
                	__endasm; \
                	break; \
                case 1: \
         		__asm \
            		MOV 0x35, SP \
         		__endasm; \
         		break; \
      		case 2: \
        		 __asm \
            		MOV 0x36, SP \
         		__endasm; \
         		break; \
      		case 3: \
        		 __asm \
            		MOV 0x37, SP \
         		__endasm; \
         		break; \
      		default: \
         	break; \
          }\
        } 

/*
 * @@@ [8 pts]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE \
         { \
           switch (currentThreadId) { \
      		case 0 : \
         	 __asm \
                	MOV SP, 0x34 \
                	__endasm; \
                	break; \
                case 1: \
         		__asm \
            		MOV SP, 0x35 \
         		__endasm; \
         		break; \
      		case 2: \
        		 __asm \
            		MOV SP, 0x36 \
         		__endasm; \
         		break; \
      		case 3: \
        		 __asm \
            		MOV SP, 0x37 \
         		__endasm; \
         		break; \
      		default: \
         		break; \
         	}\
           __asm\
           POP PSW\
           POP DPH\
           POP DPL\
           POP B\
           POP ACC\
           __endasm;\
         }


 /* 
  * we declare main() as an extern so we can reference its symbol
  * when creating a thread for it.
  */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void setDelay(char delayNum){
   for(i=0 ; i<6 ;i++){
      if(ThreadIds[i]==currentThreadID){
         delaySetPark = i;
      }
   }
   delay[delaySetPark] = delayNum;
}
void Bootstrap(void) {
      /*
       * @@@ [2 pts] 
       * initialize data structures for threads (e.g., mask)
       *
       * optional: move the stack pointer to some known location
       * only during bootstrapping. by default, SP is 0x07.
       *
       * @@@ [2 pts]
       *     create a thread for main; be sure current thread is
       *     set to this thread ID, and restore its context,
       *     so that it starts running main().
       */
      for (i=0; i<2; i++) {
         spot[i] = '_';
      }
      for (i=0; i<5; i++) {
         enter[i] = '_';
         leave[i] = '_';
      }
       TMOD = 0;  // timer 0 mode 0
       IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
                // EA  -  ET2  ES  ET1  EX1  ET0  EX0
       TR0 = 1; // set bit TR0 to start running timer 0
       bitmap = 0x00;
       numOfThreads = 1;
       currentThreadId = ThreadCreate(main);
       RESTORESTATE;
}


/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadId ThreadCreate(FunctionPtr fp) {
        /*
         * @@@ [2 pts] 
         * check to see we have not reached the max #threads.
         * if so, return -1, which is not a valid thread ID.
         */
        /*
         * @@@ [5 pts]
         *     otherwise, find a thread ID that is not in use,
         *     and grab it. (can check the bit mask for threads),
         *
         * @@@ [18 pts] below
         * a. update the bit mask 
             (and increment thread count, if you use a thread count, 
              but it is optional)
           b. calculate the starting stack location for new thread
           c. save the current SP in a temporary
              set SP to the starting location for the new thread
           d. push the return address fp (2-byte parameter to
              ThreadCreate) onto stack so it can be the return
              address to resume the thread. Note that in SDCC
              convention, 2-byte ptr is passed in DPTR.  but
              push instruction can only push it as two separate
              registers, DPL and DPH.
           e. we want to initialize the registers to 0, so we
              assign a register to 0 and push it four times
              for ACC, B, DPL, DPH.  Note: push #0 will not work
              because push takes only direct address as its operand,
              but it does not take an immediate (literal) operand.
           f. finally, we need to push PSW (processor status word)
              register, which consist of bits
               CY AC F0 RS1 RS0 OV UD P
              all bits can be initialized to zero, except <RS1:RS0>
              which selects the register bank.  
              Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
              Setting the bits to 00B, 01B, 10B, 11B will select 
              the register bank so no need to push/pop registers
              R0-R7.  So, set PSW to 
              00000000B for thread 0, 00001000B for thread 1,
              00010000B for thread 2, 00011000B for thread 3.
           g. write the current stack pointer to the saved stack
              pointer array for this newly created thread ID
           h. set SP to the saved SP in step c.
           i. finally, return the newly created thread ID.
         */
         EA = 0;
         if((bitmap & 0xFF)==0xFF){
         	return -1;
         }
         numOfThreads++;
         TempSP = SP; 
         if((bitmap & 0x01) == 0x00){
         	__asm
         	MOV 0x34 , #0x3F
         	ORL 0X33 ,#0X01
         	__endasm;
         	createdThreadId = 0;
         	SP = Thread0SP;
         }
         else if((bitmap & 0x02) ==0x00){
         	__asm
         	MOV 0x35 , #0x4F
         	ORL 0X33 ,#0X02
         	__endasm;
         	createdThreadId = 1;
         	SP = Thread1SP;
         }
         else if((bitmap & 0x04) ==0x00){
         	__asm
         	MOV 0x36 , #0x5F
         	ORL 0X33 ,#0X04
         	__endasm;
         	createdThreadId = 2;
         	SP = Thread2SP;
         }
         else if((bitmap & 0x08) ==0x00){
         	__asm
         	MOV 0x37 , #0x6F
         	ORL 0X33 ,#0X08
         	__endasm;
         	createdThreadId = 3;
         	SP = Thread3SP ;
         }
         __asm
         PUSH DPL
         PUSH DPH
         MOV A , 0X00
         PUSH ACC// initialize ACC
         PUSH ACC// initialize B
         PUSH ACC// initialize DPL
         PUSH ACC// initialize DPH
         __endasm;
         switch(createdThreadId ){
          case 0:
         	__asm
         	MOV PSW ,#0X00
         	PUSH PSW
         	__endasm;
         	Thread0SP=SP; 	
         	break;
         case 1:
         	__asm
         	MOV PSW ,#0X08
         	PUSH PSW
         	__endasm;
         	Thread1SP=SP; 	
         	break;
          case 2:
         	__asm
         	MOV PSW ,#0X10
         	PUSH PSW
         	__endasm;
         	Thread2SP=SP; 	
         	break;
          case 3:
         	__asm
         	MOV PSW ,#0X18
         	PUSH PSW
         	__endasm;
         	Thread3SP=SP;
         	break; 
           default:
           	break;	
         }
         SP = TempSP;
         ThreadIds[index] = createdThreadId; //紀錄 每個 park所佔據的 threadId
         index++;
         EA=1;
         return createdThreadId;
         
}



/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */
unsigned char now(void) {
      /* return the current time stamp */
      return time;
}
void myTimer0Handler(void){
       EA = 0;
       SAVESTATE;
       time ++;
       for(i=0;i<5;i++){
          if(delay[i]>0){
             delay[i]--;
          }
       } if (empty == 0) {
         // no spots available, switch to a car to leave
         if ((leave[0] == '_') && (delay[0] == 0)) currentThreadID = ThreadIds[1];
         else if ((leave[1] == '_') && (delay[1] == 0)) currentThreadID = ThreadIds[2];
         else if ((leave[2] == '_') && (delay[2] == 0)) currentThreadID = ThreadIds[3];
         else if ((leave[3] == '_') && (delay[3] == 0)) currentThreadID = ThreadIds[4];
         else if ((leave[4] == '_') && (delay[4] == 0)) currentThreadID =  ThreadIds[5];
      } else {
         // some spots available, switch to a car to enter
         if (enter[0] == '_') currentThreadID = ThreadIds[1];
         else if (enter[1] == '_') currentThreadID = ThreadIds[2];
         else if (enter[2] == '_') currentThreadID = ThreadIds[3];
         else if (enter[3] == '_') currentThreadID = ThreadIds[4];;
         else if (enter[4] == '_') currentThreadID = ThreadIds[5];
      }
       
       RESTORESTATE;
       EA = 1;//after restore psw set ea=1
       __asm
       RETI
       __endasm;       
}
void ThreadYield(void) {
      SAVESTATE;
      if (empty == 0) {//兩邊都要 mutex 可能會在為切 time 時 溢滿
         // no spots available, switch to a car to leave
         if ((leave[0] == '_') && (delay[0] == 0)) currentThreadID = ThreadIds[1];
         else if ((leave[1] == '_') && (delay[1] == 0)) currentThreadID = ThreadIds[2];
         else if ((leave[2] == '_') && (delay[2] == 0)) currentThreadID = ThreadIds[3];
         else if ((leave[3] == '_') && (delay[3] == 0)) currentThreadID = ThreadIds[4];
         else if ((leave[4] == '_') && (delay[4] == 0)) currentThreadID =  ThreadIds[5];
      } else {
         // some spots available, switch to a car to enter
         if (enter[0] == '_') currentThreadID = ThreadIds[1];
         else if (enter[1] == '_') currentThreadID = ThreadIds[2];
         else if (enter[2] == '_') currentThreadID = ThreadIds[3];
         else if (enter[3] == '_') currentThreadID = ThreadIds[4];;
         else if (enter[4] == '_') currentThreadID = ThreadIds[5];
      }
      RESTORESTATE;
}


/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void) {
        /*
         * clear the bit for the current thread from the
         * bit mask, decrement thread count (if any),
         * and set current thread to another valid ID.
         * Q: What happens if there are no more valid threads?
         */
      numOfThreads --;
      switch (currentThreadID) {
         case 0:
            __asm
               ANL 0x33, #0xFE
            __endasm;
            break;
         case 1:
            __asm
               ANL 0x33, #0xFD
            __endasm;          
            break;
         case 2:
            __asm
               ANL 0x33, #0xFB
            __endasm;           
            break;
         case 3:
            __asm
               ANL 0x33, #0xF7
            __endasm;          
            break;
      }
      if (currentThreadID == 0) {
         // main component exits, print out parking information
         EA = 0;
         PrintParkingResult();
         while (1) {}  // infinite loop
      } 
      currentThreadID = 0;
      RESTORESTATE;
}

