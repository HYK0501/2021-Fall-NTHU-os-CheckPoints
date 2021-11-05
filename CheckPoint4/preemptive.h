#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__
typedef char ThreadId;
typedef void (*FunctionPtr)(void);
ThreadId ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
#define CNAME(s) _ ## s
#define LABELNAME(label) label ## $
#define SemaphoreSignal(s){\
	__asm\
		INC CNAME(s)\
	__endasm;\
}
#define SemaphoreWaitBody(s,label) {\
	__asm\
		LABELNAME(label): SETB IE.7\
			CLR IE.7\
			MOV ACC,CNAME(s)\
			JZ  LABELNAME(label)\
			DEC CNAME(s)\
	__endasm;\
}
#define SemaphoreWait(s){\
	SemaphoreWaitBody(s,__COUNTER__);\
	__asm\
				SETB IE.7\
	__endasm;\
}
#endif
