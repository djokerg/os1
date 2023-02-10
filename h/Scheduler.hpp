//
// Created by os on 5/17/22.
//

#ifndef PROJECT_BASE_V1_0_SCHEDULER_HPP
#define PROJECT_BASE_V1_0_SCHEDULER_HPP
#include "../h/MemoryAllocator.hpp"

class ThreadK;
class Scheduler {
public:
    static Scheduler* initialize();
    static int deInitialize();
    static ThreadK* get();
    static void put(ThreadK*);
    static void idle(void* arg);
    Scheduler (const Scheduler&) = delete;
    Scheduler& operator= (const Scheduler&) = delete;
private:
    Scheduler();
    static Scheduler* instance;
    ThreadK* idleThread;
    ThreadK* listHead;
    ThreadK* listTail;
};


#endif //PROJECT_BASE_V1_0_SCHEDULER_HPP
