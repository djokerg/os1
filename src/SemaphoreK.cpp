//
// Created by os on 5/22/22.
//

#include "../h/SemaphoreK.hpp"
#include "../h/Riscv.hpp"

int SemaphoreK::wait() {
    if(--value<0){
        block();
    }
    if(ThreadK::running->goodDeblock) {
        return 0;
    }
    else{
        return -1;
    }
}

int SemaphoreK::signal() {
    if(value++<0) {
        deblock();
    }
    return 0;
}

void SemaphoreK::block() {
    ThreadK* old = ThreadK::running;
    if(tailBlocked){
        tailBlocked->nextThread = old;
        old->prevThread = tailBlocked;
        tailBlocked = tailBlocked->nextThread;
    }
    else{
        headBlocked = tailBlocked = old;
    }
    old->blockedOnWait = true;
    uint64 volatile sepc = Riscv::r_sepc() + 4;
    uint64 volatile sstatus = Riscv::r_sstatus();
    ThreadK::timeSliceCounter = 0;
    ThreadK::dispatch();
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
    old->blockedOnWait = false;
}

void SemaphoreK::deblock() {
    ThreadK* tmp = headBlocked;
    headBlocked = headBlocked->nextThread;
    if(headBlocked) headBlocked->prevThread = nullptr;
    else tailBlocked = nullptr;
    tmp->nextThread = nullptr;
    tmp->prevThread = nullptr;
    tmp->goodDeblock = true;
    Scheduler::put(tmp);
}

SemaphoreK::~SemaphoreK() {
    while(headBlocked != nullptr){
        ThreadK* tmp = headBlocked;
        headBlocked = headBlocked->nextThread;
        if(headBlocked) headBlocked->prevThread = nullptr;
        else tailBlocked = nullptr;
        tmp->nextThread = nullptr;
        tmp->prevThread = nullptr;
        tmp->goodDeblock = false;
        Scheduler::put(tmp);
    }
}

void *SemaphoreK::operator new(size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}

void SemaphoreK::operator delete(void *p) {
    MemoryAllocator::kmem_free(p);
}

void *SemaphoreK::operator new[](size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}

void SemaphoreK::operator delete[](void *p) {
    MemoryAllocator::kmem_free(p);
}
