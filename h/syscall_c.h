//
// Created by os on 5/15/22.
//

#ifndef PROJECT_BASE_V1_0_SYSCALL_C_H
#define PROJECT_BASE_V1_0_SYSCALL_C_H

#include "../lib/hw.h"
#include "../h/ThreadK.hpp"
#include "../h/SemaphoreK.hpp"
typedef struct SemaphoreK SemaphoreK;
typedef struct ThreadK ThreadK;

typedef SemaphoreK* sem_t;
typedef ThreadK* thread_t;

void* mem_alloc (size_t size);

int mem_free (void*);

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);

void thread_dispatch ();

void thread_exit();

int sem_open(
        sem_t *handle,
        unsigned init
);

int sem_close (sem_t handle);

int sem_wait (sem_t id);

int sem_signal (sem_t id);

typedef unsigned long time_t;

int time_sleep (time_t time);

const int EOF = -1;
char getc ();

void putc (char);

//aditional system calls

int thread_create_only(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);

int thread_start(thread_t handle);

#endif //PROJECT_BASE_V1_0_SYSCALL_C_H
