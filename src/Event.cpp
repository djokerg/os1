//
// Created by os on 6/19/22.
//

#include "../h/Event.hpp"

Event::Event() {
    SemaphoreK(0);
}

int Event::wait() {
    if(--value < 0){
        block();
    }
    return 0;
}

int Event::signal() {
    if(++value<=0){
        deblock();
    }else{
        value = 1;
    }
    return 0;
}
