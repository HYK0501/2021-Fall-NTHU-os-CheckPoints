#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__
typedef char ThreadId;
typedef void (*FunctionPtr)(void);
ThreadId ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
#endif
