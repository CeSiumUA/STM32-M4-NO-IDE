#include "stm32f4xx.h"

#define PIN5          (1U<<5)
#define LED_PIN       PIN5


int main(void){
    RCC -> AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

    GPIOA -> MODER |= (1U<<10);
    GPIOA -> MODER &=~ (1U<11);

    while(1){
        GPIOA -> ODR ^= LED_PIN;
        for(int i = 0; i < 1000000; i++){
            
        }
    }
}
