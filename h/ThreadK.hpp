//
// Created by os on 5/17/22.
//

#ifndef PROJECT_BASE_V1_0_THREAD_HPP
#define PROJECT_BASE_V1_0_THREAD_HPP

#include "../lib/hw.h"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/SemaphoreK.hpp"

class ThreadK {
public:
    friend class Scheduler;
    friend class Riscv;
    friend class SemaphoreK;
    using Body = void (*)(void*);
    ~ThreadK();
    static ThreadK *createThread(Body body, void *arg, uint64 *userStck, bool sysThread, bool createOnly);

    bool isFinished() const {
        return finished;
    }

    void setFinished(bool finished) {
        ThreadK::finished = finished;
    }

    uint64 getTimeSlice() const {
        return timeSlice;
    }

    static void putToSleep(uint64 time);
    static void awake();
    static void yield();

    int join();

    void kill();

    static ThreadK* running;

    static void* operator new(size_t);
    static void operator delete(void*p);
    static void* operator new[](size_t);
    static void operator delete[](void*p);

    ThreadK(const ThreadK&) = delete;
    ThreadK& operator= (const ThreadK&) = delete;

    static void deleteThreads();
private:
    ThreadK(Body b, void* arg, uint64* userStck, uint64 tSlice, bool sysThread, bool createOnly);
    struct Context
    {
        uint64 ra;
        uint64 sp;
    };
    Body body;
    Context context;
    bool finished;
    static void dispatch();
    static void contextSwitch(Context* oldContext, Context* runningContext);
    ThreadK* nextThread;
    ThreadK* prevThread;
    uint64 timeSlice;
    void* arguments;
    static uint64 timeSliceCounter;
    static void threadWrapper();
    uint64* kernelStack;
    uint64* userStack;
    uint64* begKernel;
    uint64* begUser;
    bool goodDeblock = false;
    static ThreadK* sleepHead;
    uint64 sleepTime = 0;
    bool blockedOnWait = false;
    bool systemThread;
    bool onSleep = false;
    static uint64 userStackASM;
    static uint64 kernelStackASM;

    static ThreadK* finishedHead;
    static ThreadK* finishedTail;

    SemaphoreK* thread_sem;
};


#endif //PROJECT_BASE_V1_0_THREAD_HPP
