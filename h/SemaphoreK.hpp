//
// Created by os on 5/22/22.
//

#ifndef PROJECT_BASE_V1_0_SEMAPHORE_HPP
#define PROJECT_BASE_V1_0_SEMAPHORE_HPP

#include "../h/ThreadK.hpp"

class SemaphoreK {
public:
    SemaphoreK(int val = 1): value(val){}
    virtual ~SemaphoreK();
    int getValue() const{
        return value;
    }
    virtual int wait();
    virtual int signal();
    static void* operator new(size_t);
    static void operator delete(void*p);
    static void* operator new[](size_t);
    static void operator delete[](void*p);
    SemaphoreK(const SemaphoreK&) = delete;
    SemaphoreK& operator= (const SemaphoreK&) = delete;
protected:
    int value;
    void block();
    void deblock();
private:
    ThreadK* headBlocked = nullptr, *tailBlocked = nullptr;
};




#endif //PROJECT_BASE_V1_0_SEMAPHORE_HPP
