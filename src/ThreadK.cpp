//
// Created by os on 5/17/22.
//
#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))
#include "../h/ThreadK.hpp"
#include "../h/Riscv.hpp"

ThreadK* ThreadK::running = nullptr;
ThreadK* ThreadK::sleepHead = nullptr;
ThreadK* ThreadK::finishedHead = nullptr;
ThreadK* ThreadK::finishedTail = nullptr;
uint64 ThreadK::timeSliceCounter = 0;

void ThreadK::yield() {
    uint64 volatile sepc = Riscv::r_sepc() + 4;
    uint64 volatile sstatus = Riscv::r_sstatus();
    ThreadK::timeSliceCounter = 0;
    ThreadK::dispatch();
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
}

void ThreadK::dispatch() {
    ThreadK* old = running;
    if(!old->isFinished() && !old->onSleep && old->blockedOnWait == 0){
        Scheduler::put(old);
    }
    running = Scheduler::get();

    contextSwitch(&old->context, &running->context);
}

ThreadK *ThreadK::createThread(Body body, void *arg, uint64 *userStck, bool sysThread, bool createOnly) {
    return new ThreadK(body, arg, userStck, DEFAULT_TIME_SLICE, sysThread, createOnly);
}

void *ThreadK::operator new(size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}


void ThreadK::operator delete(void *p) {
    MemoryAllocator::kmem_free(p);
}

void *ThreadK::operator new[](size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}


void ThreadK::operator delete[](void *p) {
    MemoryAllocator::kmem_free(p);
}

void ThreadK::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->arguments);
    thread_exit();
}

void ThreadK::putToSleep(uint64 time) {
    running->onSleep = true;
    if(!sleepHead){
        running->sleepTime = time;
        running->prevThread = nullptr;
        running->nextThread = nullptr;
        sleepHead = running;
    }
    else{
        //slozeno umetanje u listu prema vremenu budjenja
        uint64 firstST = sleepHead->sleepTime;
        //insert first in list
        if(time < firstST){
            running->sleepTime = time;
            sleepHead->sleepTime = sleepHead->sleepTime - time;
            running->nextThread = sleepHead;
            running->prevThread = nullptr;
            sleepHead->prevThread = running;
            sleepHead = running;
        }
        else {
            ThreadK* tmp = sleepHead;
            uint64 timeOfSleepTmp = sleepHead->sleepTime;
            while (tmp->nextThread && tmp->nextThread->sleepTime + timeOfSleepTmp <= time) {
                tmp = tmp->nextThread;
                timeOfSleepTmp += tmp->sleepTime;
            }
            //posle tmp ulancavam moju nit sa svojim sleepTIme
            running->nextThread = tmp->nextThread;
            if(running->nextThread) running->nextThread->prevThread = running;
            tmp->nextThread = running;
            running->prevThread = tmp;
            running->sleepTime = time - timeOfSleepTmp;
        }
    }
    //after this i got dispatch
}
void ThreadK::awake() {
    ThreadK* tmp = sleepHead;
    while(tmp && tmp->sleepTime == 0){
        ThreadK* tmp2 = tmp->nextThread;
        if(tmp->nextThread) tmp->nextThread->prevThread = nullptr;
        sleepHead = tmp->nextThread;
        tmp->prevThread = nullptr;
        tmp->nextThread = nullptr;
        tmp->onSleep = false;
        Scheduler::put(tmp);
        tmp = tmp2;
    }
}

uint64 ThreadK ::userStackASM = OFFSETOF(ThreadK, userStack);
uint64 ThreadK ::kernelStackASM = OFFSETOF(ThreadK, kernelStack);

int ThreadK::join() {
    return this->thread_sem->wait();
}

ThreadK::ThreadK(ThreadK::Body b, void *arg, uint64 *userStck, uint64 tSlice, bool sysThread, bool createOnly) {
    body = b;
    begKernel = kernelStack = (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64));
    begUser = userStck;
    kernelStack = &kernelStack[DEFAULT_STACK_SIZE];
    userStack = (b != nullptr) ? &userStck[DEFAULT_STACK_SIZE] : 0;
    context = {
            (uint64)&threadWrapper,
            userStack != nullptr ? (uint64)userStack : 0
    };
    timeSlice = (body==Scheduler::idle)?1:tSlice;
    arguments = arg;
    finished = false;
    nextThread = nullptr;
    prevThread = nullptr;
    systemThread = sysThread;
    thread_sem = new SemaphoreK(0);
    if(b != nullptr && !createOnly) Scheduler::put(this);
}

ThreadK::~ThreadK() {
    if(body){
        delete begUser;
    }
    delete begKernel;
    delete thread_sem;
}

void ThreadK::deleteThreads() {
    while (finishedHead) {
        ThreadK *tmp = finishedHead;
        ThreadK::finishedHead = finishedHead->nextThread;
        tmp->nextThread = nullptr;
        delete tmp;
    }
}

void ThreadK::kill() {
    this->setFinished(true);
    if(this->thread_sem->getValue() < 0)
        this->thread_sem->signal();
    if(ThreadK::finishedHead){
        ThreadK::finishedTail = ThreadK::finishedTail->nextThread = this;
    }
    else{
        ThreadK::finishedHead = ThreadK::finishedTail = this;
    }
}




