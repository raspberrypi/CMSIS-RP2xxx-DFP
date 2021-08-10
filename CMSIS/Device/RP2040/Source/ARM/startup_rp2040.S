/******************************************************************************
 * @file     startup_rp2040.c
 * @brief    CMSIS-Core(M) Device Startup File for
 *           Raspberry Pi RP2040
 * @version  V1.0.0
 * @date     10. August 2021
 ******************************************************************************/
/*
 * Copyright (c) 2021 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

                .syntax  unified
                .arch    armv6-m

                #define __INITIAL_SP     Image$$ARM_LIB_STACK$$ZI$$Limit

                .section RESET
                .align   2
                .globl   __Vectors
                .globl   __Vectors_End
                .globl   __Vectors_Size
__Vectors:
                .long    __INITIAL_SP                       /*     Initial Stack Pointer */
                .long    Reset_Handler                      /*     Reset Handler */
                .long    NMI_Handler                        /* -14 NMI Handler */
                .long    HardFault_Handler                  /* -13 Hard Fault Handler */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    SVC_Handler                        /*  -5 SVCall Handler */
                .long    0                                  /*     Reserved */
                .long    0                                  /*     Reserved */
                .long    PendSV_Handler                     /*  -2 PendSV Handler */
                .long    SysTick_Handler                    /*  -1 SysTick Handler */

                /* Interrupts */
                .long    TIMER_IRQ_0_Handler                /*   0 TIMER_IRQ_0 */
                .long    TIMER_IRQ_1_Handler                /*   1 TIMER_IRQ_1 */
                .long    TIMER_IRQ_2_Handler                /*   2 TIMER_IRQ_2 */
                .long    TIMER_IRQ_3_Handler                /*   3 TIMER_IRQ_3 */
                .long    PWM_IRQ_WRAP_Handler               /*   4 PWM_IRQ_WRAP */
                .long    USBCTRL_IRQ_Handler                /*   5 USBCTRL_IRQ */
                .long    XIP_IRQ_Handler                    /*   6 XIP_IRQ */
                .long    PIO0_IRQ_0_Handler                 /*   7 PIO0_IRQ_0 */
                .long    PIO0_IRQ_1_Handler                 /*   8 PIO0_IRQ_1 */
                .long    PIO1_IRQ_0_Handler                 /*   9 PIO1_IRQ_0 */
                .long    PIO1_IRQ_1_Handler                 /*  10 PIO1_IRQ_1 */
                .long    DMA_IRQ_0_Handler                  /*  11 DMA_IRQ_0 */
                .long    DMA_IRQ_1_Handler                  /*  12 DMA_IRQ_1 */
                .long    IO_IRQ_BANK0_Handler               /*  13 IO_IRQ_BANK0 */
                .long    IO_IRQ_QSPI_Handler                /*  14 IO_IRQ_QSPI */
                .long    SIO_IRQ_PROC0_Handler              /*  15 SIO_IRQ_PROC0 */
                .long    SIO_IRQ_PROC1_Handler              /*  16 SIO_IRQ_PROC1 */
                .long    CLOCKS_IRQ_Handler                 /*  17 CLOCKS_IRQ */
                .long    SPI0_IRQ_Handler                   /*  18 SPI0_IRQ */
                .long    SPI1_IRQ_Handler                   /*  19 SPI1_IRQ */
                .long    UART0_IRQ_Handler                  /*  20 UART0_IRQ */
                .long    UART1_IRQ_Handler                  /*  21 UART1_IRQ */
                .long    ADC_IRQ_FIFO_Handler               /*  22 ADC_IRQ_FIFO */
                .long    I2C0_IRQ_Handler                   /*  23 I2C0_IRQ */
                .long    I2C1_IRQ_Handler                   /*  24 I2C1_IRQ */
                .long    RTC_IRQ_Handler                    /*  25 RTC_IRQ */
__Vectors_End:
                .equ     __Vectors_Size, __Vectors_End - __Vectors
                .size    __Vectors, . - __Vectors


                .thumb
                .section .text
                .align   2

                .thumb_func
                .type    Reset_Handler, %function
                .globl   Reset_Handler
                .fnstart
Reset_Handler:
                bl       SystemInit

                bl       __main

                .fnend
                .size    Reset_Handler, . - Reset_Handler


/* The default macro is not used for HardFault_Handler
 * because this results in a poor debug illusion.
 */
                .thumb_func
                .type    HardFault_Handler, %function
                .weak    HardFault_Handler
                .fnstart
HardFault_Handler:
                b        .
                .fnend
                .size    HardFault_Handler, . - HardFault_Handler

                .thumb_func
                .type    Default_Handler, %function
                .weak    Default_Handler
                .fnstart
Default_Handler:
                b        .
                .fnend
                .size    Default_Handler, . - Default_Handler

/* Macro to define default exception/interrupt handlers.
 * Default handler are weak symbols with an endless loop.
 * They can be overwritten by real handlers.
 */
                .macro   Set_Default_Handler  Handler_Name
                .weak    \Handler_Name
                .set     \Handler_Name, Default_Handler
                .endm


/* Default exception/interrupt handler */

                Set_Default_Handler  NMI_Handler
                Set_Default_Handler  SVC_Handler
                Set_Default_Handler  PendSV_Handler
                Set_Default_Handler  SysTick_Handler

                Set_Default_Handler  TIMER_IRQ_0_Handler
                Set_Default_Handler  TIMER_IRQ_1_Handler
                Set_Default_Handler  TIMER_IRQ_2_Handler
                Set_Default_Handler  TIMER_IRQ_3_Handler
                Set_Default_Handler  PWM_IRQ_WRAP_Handler
                Set_Default_Handler  USBCTRL_IRQ_Handler
                Set_Default_Handler  XIP_IRQ_Handler
                Set_Default_Handler  PIO0_IRQ_0_Handler
                Set_Default_Handler  PIO0_IRQ_1_Handler
                Set_Default_Handler  PIO1_IRQ_0_Handler
                Set_Default_Handler  PIO1_IRQ_1_Handler
                Set_Default_Handler  DMA_IRQ_0_Handler
                Set_Default_Handler  DMA_IRQ_1_Handler
                Set_Default_Handler  IO_IRQ_BANK0_Handler
                Set_Default_Handler  IO_IRQ_QSPI_Handler
                Set_Default_Handler  SIO_IRQ_PROC0_Handler
                Set_Default_Handler  SIO_IRQ_PROC1_Handler
                Set_Default_Handler  CLOCKS_IRQ_Handler
                Set_Default_Handler  SPI0_IRQ_Handler
                Set_Default_Handler  SPI1_IRQ_Handler
                Set_Default_Handler  UART0_IRQ_Handler
                Set_Default_Handler  UART1_IRQ_Handler
                Set_Default_Handler  ADC_IRQ_FIFO_Handler
                Set_Default_Handler  I2C0_IRQ_Handler
                Set_Default_Handler  I2C1_IRQ_Handler
                Set_Default_Handler  RTC_IRQ_Handler

                .end
