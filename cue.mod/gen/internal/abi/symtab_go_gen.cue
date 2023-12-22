// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go internal/abi

package abi

// A FuncFlag records bits about a function, passed to the runtime.
#FuncFlag: uint8 // #enumFuncFlag

#enumFuncFlag:
	#FuncFlagTopFrame |
	#FuncFlagSPWrite |
	#FuncFlagAsm

#values_FuncFlag: {
	FuncFlagTopFrame: #FuncFlagTopFrame
	FuncFlagSPWrite:  #FuncFlagSPWrite
	FuncFlagAsm:      #FuncFlagAsm
}

// FuncFlagTopFrame indicates a function that appears at the top of its stack.
// The traceback routine stop at such a function and consider that a
// successful, complete traversal of the stack.
// Examples of TopFrame functions include goexit, which appears
// at the top of a user goroutine stack, and mstart, which appears
// at the top of a system goroutine stack.
#FuncFlagTopFrame: #FuncFlag & 1

// FuncFlagSPWrite indicates a function that writes an arbitrary value to SP
// (any write other than adding or subtracting a constant amount).
// The traceback routines cannot encode such changes into the
// pcsp tables, so the function traceback cannot safely unwind past
// SPWrite functions. Stopping at an SPWrite function is considered
// to be an incomplete unwinding of the stack. In certain contexts
// (in particular garbage collector stack scans) that is a fatal error.
#FuncFlagSPWrite: #FuncFlag & 2

// FuncFlagAsm indicates that a function was implemented in assembly.
#FuncFlagAsm: #FuncFlag & 4

// A FuncID identifies particular functions that need to be treated
// specially by the runtime.
// Note that in some situations involving plugins, there may be multiple
// copies of a particular special runtime function.
#FuncID: uint8 // #enumFuncID

#enumFuncID:
	#FuncIDNormal |
	#FuncID_abort |
	#FuncID_asmcgocall |
	#FuncID_asyncPreempt |
	#FuncID_cgocallback |
	#FuncID_debugCallV2 |
	#FuncID_gcBgMarkWorker |
	#FuncID_goexit |
	#FuncID_gogo |
	#FuncID_gopanic |
	#FuncID_handleAsyncEvent |
	#FuncID_mcall |
	#FuncID_morestack |
	#FuncID_mstart |
	#FuncID_panicwrap |
	#FuncID_rt0_go |
	#FuncID_runfinq |
	#FuncID_runtime_main |
	#FuncID_sigpanic |
	#FuncID_systemstack |
	#FuncID_systemstack_switch |
	#FuncIDWrapper

#values_FuncID: {
	FuncIDNormal:              #FuncIDNormal
	FuncID_abort:              #FuncID_abort
	FuncID_asmcgocall:         #FuncID_asmcgocall
	FuncID_asyncPreempt:       #FuncID_asyncPreempt
	FuncID_cgocallback:        #FuncID_cgocallback
	FuncID_debugCallV2:        #FuncID_debugCallV2
	FuncID_gcBgMarkWorker:     #FuncID_gcBgMarkWorker
	FuncID_goexit:             #FuncID_goexit
	FuncID_gogo:               #FuncID_gogo
	FuncID_gopanic:            #FuncID_gopanic
	FuncID_handleAsyncEvent:   #FuncID_handleAsyncEvent
	FuncID_mcall:              #FuncID_mcall
	FuncID_morestack:          #FuncID_morestack
	FuncID_mstart:             #FuncID_mstart
	FuncID_panicwrap:          #FuncID_panicwrap
	FuncID_rt0_go:             #FuncID_rt0_go
	FuncID_runfinq:            #FuncID_runfinq
	FuncID_runtime_main:       #FuncID_runtime_main
	FuncID_sigpanic:           #FuncID_sigpanic
	FuncID_systemstack:        #FuncID_systemstack
	FuncID_systemstack_switch: #FuncID_systemstack_switch
	FuncIDWrapper:             #FuncIDWrapper
}

#FuncIDNormal:              #FuncID & 0
#FuncID_abort:              #FuncID & 1
#FuncID_asmcgocall:         #FuncID & 2
#FuncID_asyncPreempt:       #FuncID & 3
#FuncID_cgocallback:        #FuncID & 4
#FuncID_debugCallV2:        #FuncID & 5
#FuncID_gcBgMarkWorker:     #FuncID & 6
#FuncID_goexit:             #FuncID & 7
#FuncID_gogo:               #FuncID & 8
#FuncID_gopanic:            #FuncID & 9
#FuncID_handleAsyncEvent:   #FuncID & 10
#FuncID_mcall:              #FuncID & 11
#FuncID_morestack:          #FuncID & 12
#FuncID_mstart:             #FuncID & 13
#FuncID_panicwrap:          #FuncID & 14
#FuncID_rt0_go:             #FuncID & 15
#FuncID_runfinq:            #FuncID & 16
#FuncID_runtime_main:       #FuncID & 17
#FuncID_sigpanic:           #FuncID & 18
#FuncID_systemstack:        #FuncID & 19
#FuncID_systemstack_switch: #FuncID & 20
#FuncIDWrapper:             #FuncID & 21

#ArgsSizeUnknown: -2147483648

#PCDATA_UnsafePoint:          0
#PCDATA_StackMapIndex:        1
#PCDATA_InlTreeIndex:         2
#PCDATA_ArgLiveIndex:         3
#FUNCDATA_ArgsPointerMaps:    0
#FUNCDATA_LocalsPointerMaps:  1
#FUNCDATA_StackObjects:       2
#FUNCDATA_InlTree:            3
#FUNCDATA_OpenCodedDeferInfo: 4
#FUNCDATA_ArgInfo:            5
#FUNCDATA_ArgLiveInfo:        6
#FUNCDATA_WrapInfo:           7

#UnsafePointSafe:   -1
#UnsafePointUnsafe: -2

// UnsafePointRestart1(2) apply on a sequence of instructions, within
// which if an async preemption happens, we should back off the PC
// to the start of the sequence when resuming.
// We need two so we can distinguish the start/end of the sequence
// in case that two sequences are next to each other.
#UnsafePointRestart1: -3
#UnsafePointRestart2: -4

// Like UnsafePointRestart1, but back to function entry if async preempted.
#UnsafePointRestartAtEntry: -5
