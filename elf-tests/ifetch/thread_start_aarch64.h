// thread start

// __inline__ int thread_start( void (* fp )(int) );

/*
If successful, this will start a new thread running the function 
pointed to by fp, and it will return the new thread id.  The 
argument fp should be a pointer to a void function that takes an int
argument, which will also be set to the thread id of the new thread 
(in which it is running).


If unsuccessful, i.e. if there are no unused threads, thread_start will return -1.
*/

// implementation of ppcmem thread_start() function for POWER

// We adapt a POWER system call instruction, sc 60, to signal a thread start to the POWER
// model.  This adapted instruction reads and writes registers; on entry:
//
// r4 should be the start address of the new thread
// r5 should be the associated TOC pointer
//
// and on exit
//
// r3 holds the thread id of the new thread, or -1 if thread start failed.
//
// In the POWER ABI C a function pointer is actually a pointer to a function
// descriptor (from the OPD segment of the ELF file) that contains that start 
// address and TOC pointer; we read those in this C code to avoid the model
// having to synthesise memory reads for them. 

static inline int thread_start( void (* fp )(int) ) {
  register long int argument       __asm__ ("r0") = (long int)fp;
  register long int result __asm__ ("r3");                                     // return new tid or -1
  __asm__ volatile (
    ".word 0xd50bb003" // ImplementationDefinedThreadStart
    : "=r" (result)
    : "r" (argument)
  );
  return result;
}
