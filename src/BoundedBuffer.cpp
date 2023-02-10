//
// Created by os on 6/1/22.
//

#include "../h/BoundedBuffer.hpp"

BoundedBuffer::BoundedBuffer() {
    mutex = new SemaphoreK(1);
    spaceAvailable = new SemaphoreK(N);
    itemAvailable = new SemaphoreK(0);
    head = tail =  0;
    occ =0;
    buffer = (char*) MemoryAllocator::kmem_alloc(N * sizeof(char));
}

void BoundedBuffer::append(char c) {
    spaceAvailable->wait();
    mutex->wait();
    if(occ < N) {
        buffer[tail] = c;
        tail = (tail + 1) % N;
        occ++;
    }
    mutex->signal();
    if(occ < N) {
        itemAvailable->signal();
    }
}

char BoundedBuffer::take() {
    itemAvailable->wait();
    mutex->wait();
    char c = buffer[head];
    head = (head+1)%N;
    occ--;
    mutex->signal();
    spaceAvailable->signal();
    return c;
}
void *BoundedBuffer::operator new(size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}


void BoundedBuffer::operator delete(void *p) {
    MemoryAllocator::kmem_free(p);
}

void *BoundedBuffer::operator new[](size_t size) {
    return MemoryAllocator::kmem_alloc(size);
}


void BoundedBuffer::operator delete[](void *p) {
    MemoryAllocator::kmem_free(p);
}