//
// Created by os on 5/10/22.
//

#ifndef PROJECT_BASE_V1_0_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_0_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"
class MemoryAllocator {
public:
    static void initialize();
    static void* kmem_alloc(size_t realSz);//realSz is parameter in bytes
    static int kmem_free(void * address);
    static int deInitialize(){
        instance->free_mem_head = nullptr;
        instance = nullptr;
        return 0;
    }
    MemoryAllocator (const MemoryAllocator&) = delete;
    MemoryAllocator& operator= (const MemoryAllocator&) = delete;
private:
    MemoryAllocator();
    struct BlockHeader{
        BlockHeader* next;
        BlockHeader* prev;
        size_t size;//size in bytes
    };
    BlockHeader* free_mem_head;
    static MemoryAllocator* instance;
    static int joinSegments(BlockHeader* tmp);
};


#endif //PROJECT_BASE_V1_0_MEMORYALLOCATOR_HPP
