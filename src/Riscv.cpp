//
// Created by os on 5/15/22.
//

#include "../h/Riscv.hpp"
//#include "../h/MemoryAllocator.hpp"
//#include "../h/ThreadK.hpp"
#include "../h/ConsoleK.hpp"

void Riscv::handleTrap(int code, void *args) {
    uint64 *realargs = (uint64 *) args;
    void *retval = nullptr;
    uint64 volatile scause = Riscv::r_scause();
    if (scause == 0x09 || scause == 0x08) {
        uint64 volatile sepc = Riscv::r_sepc();
        Riscv::w_sepc(sepc + 4);
        //razgranati skok na sistemske pozive
        switch (code) {
            case 0x12: {
                ThreadK::running->kill();
            }
            case 0x13: {
                uint64 volatile sepc = r_sepc() + 4;
                uint64 volatile sstatus = r_sstatus();
                ThreadK::timeSliceCounter = 0;
                ThreadK::dispatch();
                w_sstatus(sstatus);
                w_sepc(sepc);
                break;
            }
            case 0x01: {
                size_t realValue = (size_t) (realargs[0]) * MEM_BLOCK_SIZE; // u bajtovima
                retval = MemoryAllocator::kmem_alloc(realValue);
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x02: {
                retval = (void *) (uint64) MemoryAllocator::kmem_free((void *) realargs[0]);
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x14:
            case 0x11: {
                ThreadK **handle = (ThreadK **) realargs[0];
                ThreadK::Body start_routine = (ThreadK::Body) realargs[1];
                void *arg = (void *) realargs[2];
                uint64 *stack = (uint64 *) realargs[3];
                if(code == 0x11)
                    *handle = ThreadK::createThread(start_routine, arg, stack, false, false);
                if(code == 0x14)
                    *handle = ThreadK::createThread(start_routine, arg, stack, false, true);
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x15:{
                ThreadK *handle = (ThreadK *) realargs[0];
                //put it to scheduler
                if(!handle) {
                    retval = (void *) (uint64) -1;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
                Scheduler::put(handle);
                retval = 0;
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }

            case 0x21:{
                SemaphoreK** handle = (SemaphoreK**) realargs[0];
                int init = realargs[1];
                *handle = new SemaphoreK(init);
                retval = (*handle ? (void *) (uint64) 0 : (void *) (uint64) -1);
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x22:{
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
                if(!handle) {
                    retval = (void *) (uint64) -1;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
                handle->~SemaphoreK();
                retval = 0;
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x23:{
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
                if(!handle) {
                    retval = (void *) (uint64) -1;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
                handle->wait();
                retval = 0;
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x24:{
                SemaphoreK* handle = (SemaphoreK*) realargs[0];
                if(!handle) {
                    retval = (void *) (uint64) -1;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
                handle->signal();
                retval = 0;
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x31:{
                uint64 time = realargs[0];
                if(time == 0){
                    retval = 0;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
                else{
                    ThreadK::putToSleep(time);
                    uint64 volatile sepc = r_sepc() + 4;
                    uint64 volatile sstatus = r_sstatus();
                    ThreadK::timeSliceCounter = 0;
                    ThreadK::dispatch();
                    w_sstatus(sstatus);
                    w_sepc(sepc);
                    retval = 0;
                    __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                    break;
                }
            }
            case 0x41: {
                uint64 volatile sepc = r_sepc() + 4;
                uint64 volatile sstatus = r_sstatus();
                char c = ConsoleK::kgetc();
                w_sstatus(sstatus);
                w_sepc(sepc);
                retval = (void*)((uint64)c);
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
            case 0x42:{
                char c = (char)realargs[0];
                uint64 volatile sepc = r_sepc() + 4;
                uint64 volatile sstatus = r_sstatus();
                ConsoleK::kputc(c);
                w_sstatus(sstatus);
                w_sepc(sepc);
                retval = 0;
                __asm__ volatile("sd %[retval], 10 * 8(s0)" : : [retval] "r"(retval));
                break;
            }
        }

    } else if (scause == 0x8000000000000001UL) {
        ThreadK::timeSliceCounter++;
        //budjenje niti
        if(ThreadK::sleepHead) {
            ThreadK::sleepHead->sleepTime--;
            ThreadK::awake();
        }
        if (ThreadK::timeSliceCounter >= ThreadK::running->timeSlice) {
            uint64 volatile sepc = r_sepc();
            uint64 volatile sstatus = r_sstatus();
            ThreadK::timeSliceCounter = 0;
            ThreadK::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
        mc_sip(SIP_SEIP);
    } else if (scause == 0x8000000000000009UL) {
        ConsoleK::k_console_handler();
    } else {
        printString("unexpected exception\n");
        printInt(scause);
    }
    //potvrda obrade prekida
    mc_sip(SIP_SSIP);
}

void Riscv::popSppSpie() {
    uint64 volatile sstatus;
    sstatus = r_sstatus();
    if(ThreadK::running->systemThread){
        sstatus &= ~SSTATUS_SPIE;
        sstatus |= SSTATUS_SPP;
    }
    else{
        sstatus |= SSTATUS_SPIE;
        sstatus &= ~SSTATUS_SPP;
    }
    w_sstatus(sstatus);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

