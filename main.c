#include <stdio.h>
#include <unistd.h>  // For the sleep function
#include "include/dummy/dummy.h"

int main(void){
    while(1){
        printf("random uint8: %u\n", dummy_random());
        sleep(1);
    }
    return 0;
}