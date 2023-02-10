//
// Created by os on 5/16/22.
//
#include "../h/syscall_c.h"

void* abiCaller(int code, uint64* args){//kad udjem ovde, u a1 mi se nalazi odgovarajuci argument
    __asm__ volatile ("ecall");
    void* retval;
    __asm__ volatile ("mv a0, %[ret]" : [ret] "=r" (retval));
    return retval;
}
void* mem_alloc (size_t size){
    int code = 0x01;
    size_t inBlocks = (size+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    //stavljanje parametara u registre i zvanje ecall
    uint64 args[] = {inBlocks};
    return abiCaller(code, args);
}

int mem_free (void* data){
    if(!data) return -1;
    int code = 0x02;
    uint64 args[] = {(uint64)data};
    void* returnval = abiCaller(code, args);
    return (returnval? -1:0);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg){
    int code = 0x11;
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE*8);
    if(!stack || start_routine == nullptr){
        return -1;
    }
    uint64 args[] = {(uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack};
    void* returnval = abiCaller(code, args);
    return (returnval? -1: 0);
}
void thread_dispatch (){
    int code = 0x13;
    uint64* args = 0;
    abiCaller(code, args);
}

void thread_exit(){
    int code = 0x12;
    uint64* args = 0;
    abiCaller(code, args);
}

int sem_open(sem_t *handle, unsigned init){
    int code = 0x21;
    uint64 args[] = {(uint64) handle, (uint64) init};
    void* retval = abiCaller(code, args);
    return (retval? -1: 0);
}

int sem_close (sem_t handle){
    if(handle  == nullptr) return -1;
    int code = 0x22;
    uint64 args[] = {(uint64) handle};
    void* retval = abiCaller(code, args);
    return (retval? -1: 0);
}

int sem_wait (sem_t id){
    if(id  == nullptr) return -1;
    int code = 0x23;
    uint64 args[] = {(uint64) id};
    void* retval = abiCaller(code, args);
    return (retval? -1: 0);
}

int sem_signal (sem_t id){
    if(id  == nullptr) return -1;
    int code = 0x24;
    uint64 args[] = {(uint64) id};
    void* retval = abiCaller(code, args);
    return (retval? -1: 0);
}

int time_sleep (time_t time){
    int code = 0x31;
    uint64 args[] = {(uint64)time};
    void* retval = abiCaller(code, args);
    return (retval? -1: 0);
}

char getc (){
    int code = 0x41;
    uint64* args = 0;
    void* retval = abiCaller(code, args);
    return (char)((uint64)retval);
}

void putc (char c){
    int code = 0x42;
    uint64 args[] = {(uint64)c};
    abiCaller(code, args);
}

int thread_create_only(thread_t *handle, void (*start_routine)(void *), void *arg) {
    int code = 0x14;
    uint64* stack = (uint64*)mem_alloc(DEFAULT_STACK_SIZE*8);
    if(!stack){
        return -1;
    }
    uint64 args[] = {(uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack};
    void* returnval = abiCaller(code, args);
    return (returnval? -1: 0);
}

int thread_start(thread_t handle) {
    int code = 0x15;
    uint64 args[] = {(uint64)handle};
    void* returnval = abiCaller(code, args);
    return (returnval? -1: 0);
}
