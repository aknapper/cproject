#include <stdlib.h>
#include "dummy/dummy.h"

uint8_t dummy_random(void){
    return rand() % 256;
}