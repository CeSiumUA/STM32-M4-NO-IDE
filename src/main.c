#include "stm32f4xx.h"

int main(void){
    RCC -> AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

    GPIOA -> MODER |= GPIO_MODER_MODER5_0;
    GPIOA -> MODER &=~GPIO_MODER_MODER5_1;

    while(1){
        GPIOA -> ODR ^= GPIO_ODR_ODR_5;
        for(int i = 0; i < 1000000; i++){
            
        }
    }
}
