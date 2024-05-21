# Raspberry Pi Pico

## Overview

Raspberry Pi Pico has been designed to be a low cost yet flexible development platform for RP2040.

## Pinout

![Pico Pin-Out](./Pico-R3-SDK11-Pinout.svg "Pico Pin-Out")

| Pin | Function                        |
|-----|---------------------------------|
|  1  | UART0 TX/I2C0 SDA/SPI0 RX/GP0   |
|  2  | UART0 RX/I2C0 SCL/SPI0 CSn/GP1  |
|  3  | GND                             |
|  4  | I2C1 SDA/SPI0 CSK/GP2           |
|  5  | I2C1 SCL/SPI0 TX/GP3            |
|  6  | UART1 TX/I2C0 SDA/SPI0 RX/GP4   |
|  7  | UART1 RX/I2C0 SCL/SPI0 CSn/GP5  |
|  8  | GND                             |
|  9  | I2C1 SDA/SPI0 SCK/GP6           |
| 10  | I2C1 SCL/SPI0 TX/GP7            |
| 11  | UART1 TX/I2C0 SDA/SPI1 RX/GP8   |
| 12  | UART1 RX/I2C0 SCL/SPI1 CSn/GP9  |
| 13  | GND                             |
| 14  | I2C1 SDA/SPI1 SCK/GP10          |
| 15  | I2C1 SCL/SPI1 TX/GP11           |
| 16  | UART0 TX/I2C0 SDA/SPI1 RX/GP12  |
| 17  | UART0 RX/I2C0 SCL/SPI1 CSn/GP13 |
| 18  | GND                             |
| 19  | I2C1 SDA/SPI1 SCK/GP14          |
| 20  | I2C1 SCL/SPI1 TX/GP15           |
| 21  | UART0 TX/I2C0 SDA/SPI0 RX/GP16  |
| 22  | UART0 RX/I2C0 SCL/SPI0 CSn/GP17 |
| 23  | GND                             |
| 24  | I2C1 SDA/SPI0 SCK/GP18          |
| 25  | I2C1 SCL/SPI0 TX/GP19           |
| 26  | I2C0 SDA/GP20                   |
| 27  | I2C0 SCL/GP21                   |
| 28  | GND                             |
| 29  | GP22                            |
| 30  | RUN                             |
| 31  | I2C1 SDA/ADC0/GP26              |
| 32  | I2C1 SCL/ADC1/GP27              |
| 33  | GND/AGND                        |
| 34  | ADC2/GP28                       |
| 35  | ADC_VREF                        |
| 36  | 3V3(OUT)                        |
| 37  | 3V3_EN                          |
| 38  | GND                             |
| 39  | VSYS                            |
| 40  | VBUS                            |

## Schematics

- [Pico schematic](https://datasheets.raspberrypi.com/pico/RPi-Pico-R3-PUBLIC-20200119.zip)

## Debugprobe Firmware

See [this GitHub repository](https://github.com/raspberrypi/debugprobe) for details of how to use a second Pico as a debug adapter, with the debugprobe firmware
