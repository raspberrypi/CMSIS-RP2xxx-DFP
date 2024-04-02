# RP2040 Device Family Pack (v0.9.0)

This is an exemplary CMSIS-Pack with device support for the Raspberry Pi RP2040. [Pico-SDK(v1.5.1)](https://github.com/raspberrypi/pico-sdk/releases/tag/1.5.1) has been integrated using submodule.

The repository uses the [gen-pack library]() to check the PDSC file and create the pack. Make sure that all required [prerequisites](https://github.com/Open-CMSIS-Pack/gen-pack#prerequisites) are met.

An [flash programming files (FLM)](https://open-cmsis-pack.github.io/Open-CMSIS-Pack-Spec/main/html/flashAlgorithm.html) for the external flash of Pico has been added, which is donated by the author of [this repo](https://github.com/Aladdin-Wang/RP2040_Flash_Algorithm).



## Current pack status

The following scenarios have been tested so far with above workaround for the CMSIS debug description flow.

### uVision

| Debug Unit | w/o Atomic Blocks | w/ Atomic Blocks | Notes|
|------------|-------------------|------------------|------|
| Picoprobe (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | Should be fixed as of v1.1|
| ULINKplus (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | |
| ULINKpro | :x: | :white_check_mark: | ULINKpro requires atomic blocks due to continuous SWCLK clocking between SWJ_Sequence calls. This breaks the expected SWDIO bit stream. |

### Keil Studio VS Code Extensions

| Debug Unit | w/o Atomic Blocks | w/ Atomic Blocks | Notes|
|------------|-------------------|------------------|------|
| Picoprobe (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | :warning: No atomic support in KSC/VS Code extension with KSC engine => all commands executed non-atomically => works for non-continuously clocking probes |
| ULINKplus (CMSIS-DAPv2 based) | :white_check_mark: | :white_check_mark: | :warning: No atomic support in KSC/VS Code extension with KSC engine => all commands executed non-atomically => works for non-continuously clocking probes |
| ULINKpro | N/A | N/A | ULINKpro not supported with KSC |

### Known Issues with Picoprobe

Picoprobe currently doesn't manage response buffers as expected. It at the moment implements 2 x 64 Byte buffers.
This causes problems for large debugger operations utilizing more than one CMSIS-DAP command buffer. For example when a memory window reads large memory blocks.
This problem also affects atomic sequence execution. Additionally, we learnt from RPI that atomic commands in the CMSIS-DAP FW are in fact not fully implemented.
RPI are now aware of these being relevant problems and plan to look into them.

Due to those problems, we don't make debug sequence blocks atomic in the provided prototype. This however would be required for debug units with continuous clocking (e.g. ULINKpro). And effectively disables support for such units.
To enable ULINKpro with the prototype debug description, occurrences of "atomic=false" have to be manually replaced with "atomic=true" in the PDSC file of the installed pack. As soon as the Picoprobe issues are fixed, those atomic attribute changes should directly go into the pack.

## Open items

- Fix issues with Picoprobe
