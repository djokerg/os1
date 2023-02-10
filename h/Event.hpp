//
// Created by os on 6/19/22.
//

#ifndef PROJECT_FINAL_EVENT_HPP
#define PROJECT_FINAL_EVENT_HPP
#include "../h/SemaphoreK.hpp"

class Event: public SemaphoreK {
public:
    Event();
    int wait() override;
    int signal() override;
};


#endif //PROJECT_FINAL_EVENT_HPP
