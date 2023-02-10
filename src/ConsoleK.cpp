//
// Created by os on 6/1/22.
//

#include "../h/ConsoleK.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../lib/hw.h"

ConsoleK *ConsoleK::instance = nullptr;

ConsoleK *ConsoleK::initialize() {
    if (instance == nullptr) {
        instance = (ConsoleK *) MemoryAllocator::kmem_alloc(sizeof(ConsoleK));
        instance->bufferIn = new BoundedBuffer();
        instance->bufferOut = new BoundedBuffer();
        instance->semGetC = new Event();
        instance->semPutC = new Event();
    }
    return instance;
}

void ConsoleK::kputc(char c) {
    //putc stavlja dati znak u izlazni bafer
    instance->bufferOut->append(c);
}

char ConsoleK::kgetc() {
    char c = instance->bufferIn->take();
    return c;
}

void ConsoleK::consumer(void *arg) {
    //it takes from bb and transfer to controler
    while (true) {
        instance->semPutC->wait();
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) {
            char c = instance->bufferOut->take();
            *((volatile char *) CONSOLE_TX_DATA) = c;
        }
    }
}

void ConsoleK::producer(void *arg) {
    //it takes from controler and transfer to bb
    while (true) {
        instance->semGetC->wait();
        while (*((volatile char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
            char c = *((volatile char *) (CONSOLE_RX_DATA));
            instance->bufferIn->append(c);
        }
    }
}

void ConsoleK::k_console_handler() {
    int num = plic_claim();
    if (num == 0x0a) {
        if (*((volatile char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT) {
            instance->semGetC->signal();
        }
        if (*((volatile char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) {
            instance->semPutC->signal();
        }
        plic_complete(CONSOLE_IRQ);
        return;
    }
    plic_complete(num);
}

bool ConsoleK::finished() {
    return instance->bufferOut->occ == 0;
}
