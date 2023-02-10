//
// Created by os on 6/1/22.
//

#ifndef PROJECT_BASE_V1_0_BOUNDEDBUFFER_HPP
#define PROJECT_BASE_V1_0_BOUNDEDBUFFER_HPP
#include "../h/SemaphoreK.hpp"

class BoundedBuffer {
public:
    BoundedBuffer();
    ~BoundedBuffer(){
        delete mutex;
        delete spaceAvailable;
        delete itemAvailable;
        delete buffer;
    }
    void append(char);
    char take();
    static void* operator new(size_t);
    static void operator delete(void*p);
    static void* operator new[](size_t);
    static void operator delete[](void*p);
    BoundedBuffer(const BoundedBuffer&) = delete;
    BoundedBuffer& operator= (const BoundedBuffer&) = delete;
    uint64 occ;
private:
    static constexpr uint64 N = 1<<10;
    SemaphoreK* mutex, *spaceAvailable, *itemAvailable;
    char* buffer;
    int head, tail;
};


#endif //PROJECT_BASE_V1_0_BOUNDEDBUFFER_HPP
