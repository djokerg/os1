//
// Created by os on 5/17/22.
//

#include "../h/Scheduler.hpp"
#include "../h/ThreadK.hpp"

Scheduler *Scheduler::instance = nullptr;

ThreadK *Scheduler::get() {
    ThreadK *tmp = instance->listHead;
    if(tmp->body == idle){
        tmp = tmp->nextThread;
        bool flag = false;
        while(tmp){
            if(!tmp->systemThread){
                flag = true;
                break;
            }
            else{
                tmp = tmp->nextThread;
            }
        }
        //ima korisnickih niti pa ne treba da vratim idle nego da je samo stavim na kraj
        if(flag){
            ThreadK* tmp1 = instance->listHead;
            instance->listHead = instance->listHead->nextThread;
            tmp1->nextThread = nullptr;
            if(!instance->listHead) instance->listHead = instance->listTail = tmp1;
            else instance->listTail = instance->listTail->nextThread = tmp1;
        }
        tmp = instance->listHead;
    }
    instance->listHead = instance->listHead->nextThread;
    if (!instance->listHead) instance->listTail = nullptr;
    tmp->nextThread = nullptr;
    return tmp;
}

void Scheduler::put(ThreadK *thread) {
    if (instance->listTail) {
        instance->listTail->nextThread = thread;
        instance->listTail = instance->listTail->nextThread;
    } else {
        instance->listHead = instance->listTail = thread;
    }
}

Scheduler *Scheduler::initialize() {
    if (instance == nullptr) {
        instance = (Scheduler *) MemoryAllocator::kmem_alloc(sizeof(Scheduler));
        instance->listHead = nullptr;
        instance->listTail = nullptr;
        instance->idleThread = ThreadK::createThread((ThreadK::Body) &Scheduler::idle, nullptr,
                                                     (uint64 *) MemoryAllocator::kmem_alloc(
                                                             DEFAULT_STACK_SIZE * sizeof(uint64)), false, false);
    }
    return instance;
}

void Scheduler::idle(void *arg) {
    while (true) {}
}

int Scheduler::deInitialize() {
    delete instance->idleThread;
    return MemoryAllocator::kmem_free(instance);

}
