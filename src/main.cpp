
#include "../h/Riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/ThreadK.hpp"
#include "../h/ConsoleK.hpp"

void main() {
    extern void userMain();
    Riscv::w_stvec((uint64)&Riscv::supervisorTrap);
    MemoryAllocator::initialize();
    Scheduler::initialize();
    ConsoleK::initialize();
    thread_t threads[4];
    //main create
    threads[0] = ThreadK::createThread(nullptr, nullptr, nullptr, true, false);
    //userMain thread create
    threads[1] = ThreadK::createThread(reinterpret_cast<void (*)(void *)>(userMain), nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), false, false);
    //console threads create
    threads[2] = ThreadK::createThread(ConsoleK::producer, nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), true,false);
    threads[3] = ThreadK::createThread(ConsoleK::consumer, nullptr, (uint64*) MemoryAllocator::kmem_alloc(DEFAULT_STACK_SIZE*sizeof(uint64)), true, false);
    ThreadK::running = threads[0];

    threads[1]->join();

    while (!ConsoleK::finished()) {
        ThreadK::yield();
    }
    //bezopasno je ovde raditi kill jer nece doci do promena konteksta pa nece zabagovati scheduler
    //NAPOMENA: ne smeju se ubijati niti koje su u scheduleru sa funkcijom kill, mogu biti uspavane ili running
    for(auto t: threads){
        t->kill();
    }

    ThreadK::deleteThreads();

    Scheduler::deInitialize();
    ConsoleK::deInitialize();
    MemoryAllocator::deInitialize();

}