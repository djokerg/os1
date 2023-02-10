//
// Created by os on 6/1/22.
//

#ifndef PROJECT_BASE_V1_0_CONSOLE_HPP
#define PROJECT_BASE_V1_0_CONSOLE_HPP

#include "../h/BoundedBuffer.hpp"
#include "../h/Event.hpp"

class ConsoleK {
public:
    static ConsoleK* initialize();
    static int deInitialize(){
        delete instance->bufferIn;
        delete instance->bufferOut;
        delete instance->semPutC;
        delete instance->semGetC;
        return MemoryAllocator::kmem_free(instance);
    }
    static void kputc(char c);
    static char kgetc();
    static void k_console_handler();
    static void consumer(void* arg);
    static void producer(void* arg);
    ConsoleK(const ConsoleK&) = delete;
    ConsoleK& operator= (const ConsoleK&) = delete;
    static bool finished();
private:
    static ConsoleK* instance;
    Event* semGetC, *semPutC;
    BoundedBuffer* bufferIn;
    BoundedBuffer* bufferOut;

};


#endif //PROJECT_BASE_V1_0_CONSOLE_HPP
