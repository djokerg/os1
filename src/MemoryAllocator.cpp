//
// Created by os on 5/10/22.
//

#include "../h/MemoryAllocator.hpp"

MemoryAllocator* MemoryAllocator:: instance = nullptr;

void MemoryAllocator::initialize() {
    if(instance == nullptr) {
        instance = (MemoryAllocator*) HEAP_START_ADDR;
        instance->free_mem_head = (BlockHeader *) ((char *) HEAP_START_ADDR + sizeof(MemoryAllocator));//initially
        instance->free_mem_head->size =
                (char *) HEAP_END_ADDR - (char *) (instance->free_mem_head) - sizeof(BlockHeader);
        instance->free_mem_head->prev = instance->free_mem_head->next = nullptr;
    }
}

void* MemoryAllocator::kmem_alloc(size_t size) {
    size_t realSz = ((size + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE)*MEM_BLOCK_SIZE;
    if(!realSz || !instance->free_mem_head) return nullptr;
    BlockHeader* tmp = instance->free_mem_head;
    //iterating trough list and finding enough big segment;
    while(tmp && tmp->size < realSz){
        tmp = tmp->next;
    }
    if(!tmp) return nullptr;
    if(tmp->size - realSz <= sizeof(BlockHeader) + MEM_BLOCK_SIZE){
        //allocate whole segment
        if(tmp->prev) tmp->prev->next = tmp->next;
        else instance->free_mem_head = tmp->next;
        if(tmp->next) tmp->next->prev = tmp->prev;
    } else{
        //insert remainder in list, fragment remains
        size_t offset = sizeof(BlockHeader) + realSz;
        BlockHeader* newSegment = (BlockHeader*)((char*)tmp + offset);
        if(tmp->prev) tmp->prev->next = newSegment;
        else instance->free_mem_head = newSegment;
        if(tmp->next) tmp->next->prev = newSegment;
        newSegment->prev = tmp->prev;
        newSegment->next = tmp->next;
        newSegment->size = tmp->size - realSz - sizeof(BlockHeader);
        tmp->size= realSz;
    }
    return (char*)tmp + sizeof(BlockHeader);
}

int MemoryAllocator::kmem_free(void *address) {
    char* newAdr = (char*)address - sizeof(BlockHeader);
    if(!address || !instance->free_mem_head) return -1;
    //find where to insert free segment
    BlockHeader *tmp = nullptr;
    if (instance->free_mem_head && newAdr >= (char *) (instance->free_mem_head))
        for (tmp = instance->free_mem_head; tmp->next && newAdr > (char *) (tmp->next); tmp = tmp->next);
    //insert the new segment after tmp
    BlockHeader *newSegment = (BlockHeader *) newAdr;
    newSegment->prev = tmp;
    if (tmp) newSegment->next = tmp->next;
    else newSegment->next = instance->free_mem_head;
    if (newSegment->next) newSegment->next->prev = newSegment;
    if (tmp) tmp->next = newSegment;
    else instance->free_mem_head = newSegment;

    //joinSegments with the previous and next segment, this function return -1 if joining is unsucessful but it is irelevant in this case
    joinSegments(newSegment);
    joinSegments(tmp);
    return 0;

}
//helper function which join this and next segment
int MemoryAllocator::joinSegments(MemoryAllocator::BlockHeader *tmp) {
    if(!tmp) return -1;
    if(tmp->next && (char*)tmp + tmp->size + sizeof(BlockHeader)== (char*)(tmp->next)){
        //tmp will take tmp->next segment size
        tmp->next->size += sizeof(BlockHeader);
        tmp->size += tmp->next->size;
        tmp->next= tmp->next->next;
        if(tmp->next) tmp->next->prev = tmp;
        return 0;
    }else
    return -1;
}
