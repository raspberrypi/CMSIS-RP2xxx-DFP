# RP2040 Device Family Pack (v0.9.0)

This is an exemplary CMSIS-Pack with device support for the Raspberry Pi RP2040. [Pico-SDK(v1.5.1)](https://github.com/raspberrypi/pico-sdk/releases/tag/1.5.1) has been integrated using submodule.

The repository uses the [gen-pack library]() to check the PDSC file and create the pack. Make sure that all required [prerequisites](https://github.com/Open-CMSIS-Pack/gen-pack#prerequisites) are met.

An [flash programming files (FLM)](https://open-cmsis-pack.github.io/Open-CMSIS-Pack-Spec/main/html/flashAlgorithm.html) for the external flash of Pico has been added, which is donated by the author of [this repo](https://github.com/Aladdin-Wang/RP2040_Flash_Algorithm).

## Current pack status

The following scenarios have been tested so far.

### uVision

| Debug Unit | w/o Atomic Blocks | w/ Atomic Blocks | Notes|
|------------|-------------------|------------------|------|
| RPi Debug Probe (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | Atomic Blocks work as of v1.1|
| ULINKplus (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | |
| ULINKpro | :x: | :white_check_mark: | ULINKpro requires atomic blocks due to continuous SWCLK clocking between SWJ_Sequence calls. This breaks the expected SWDIO bit stream. |

### Keil Studio VS Code Extensions

| Debug Unit | w/o Atomic Blocks | w/ Atomic Blocks | Notes|
|------------|-------------------|------------------|------|
| RPi Debug Probe (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | :warning: No atomic support in KSC/VS Code extension with KSC engine => all commands executed non-atomically => works for non-continuously clocking probes |
| ULINKplus (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | :warning: No atomic support in KSC/VS Code extension with KSC engine => all commands executed non-atomically => works for non-continuously clocking probes |
| ULINKpro | N/A | N/A | ULINKpro not supported with KSC |
