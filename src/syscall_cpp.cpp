//
// Created by os on 6/21/22.
//
#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create_only(&myHandle, body, arg);
}

Thread::~Thread() {
    delete myHandle;
}

int Thread::start() {
    return thread_start(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    thread_create_only(&myHandle, helperWrapper, this);
}

void Thread::helperWrapper(void *arg) {
    Thread *t = (Thread *) arg;
    t->run();
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

struct periodicStruct {
    PeriodicThread *per;
    time_t t;

    periodicStruct(PeriodicThread *pt, time_t time) {
        per = pt;
        t = time;
    }
};

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicWrapper, new periodicStruct(this, period)) {

}

void PeriodicThread::periodicWrapper(void *arg) {
    periodicStruct *ps = (periodicStruct *) arg;
    while (true) {
        ps->per->periodicActivation();
        sleep(ps->t);
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}

void *operator new(size_t size) {
    return mem_alloc(size);
}

void operator delete(void *p) {
    mem_free(p);
}
