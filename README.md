# STM32 M4 Template No IDE
___
## Table of Contents
1. [Project Structure](#project-structure)
2. [To Debug in VSCode](#to-debug-in-vscode)
3. [Building and Flashing Steps](#building-and-flashing-steps)
4. [How to use from WSL](#how-to-use-from-wsl)
## PROJECT STRUCTURE:

* GPIO: Includes a simple program that demonstrates how to blink LED on Nucleo F411RE
* shared: required to build a project
* To create a new project from template, run: 
```
  $ tools/new_project.sh
```

## TO DEBUG IN VSCODE:

* Install toolchain and openocd:
```
  $ sudo apt install gcc-arm-none-eabi gdb-multiarch openocd
```

* Install VSCode extensions: [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug) and [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

* Create ```launch.json```:
```        
{
  "version": "0.2.0",
  "configurations": [
      {
          "cwd": "${workspaceRoot}",
          "executable": "./output/output_fmw.elf",
          "name": "Debug with OpenOCD",
          "request": "launch",
          "type": "cortex-debug",
          "servertype": "openocd",
          "configFiles": [
              "/usr/share/openocd/scripts/board/st_nucleo_f4.cfg"
          ],
          "searchDir": [],
          "runToEntryPoint": "main",
          "showDevDebugOutput": "none"
      }
  ]
}
```
* Create ```settings.json```:
```
{
    "cortex-debug.armToolchainPath": "/usr/bin",
    "cortex-debug.openocdPath": "/usr/bin/openocd",
    "cortex-debug.variableUseNaturalFormat": false
}
```
* Create ```c_cpp_properties.json```:
```
{
    "configurations": [
        {
            "name": "vscode_stm32_c_cpp_properties",
            "compilerPath": "/usr/bin/arm-none-eabi-gcc",
            "includePath": [
                "${workspaceRoot}/include/include/",
                "${workspaceRoot}/include/cmsis/include/",
                "${workspaceRoot}/include/drivers/inc"
            ],
            "defines": [
                "STM32F429xx"
            ],
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-x64",
            "configurationProvider": "ms-vscode.makefile-tools"
        }
    ],
    "version": 4
}
```

## Building and Flashing Steps: 

  
* COMPILE THE DEMO CODE (src/main.c) :
```
  $ make 
```
* FLASH :
```
  $ make flash
```
or
```
  $ stlink_flash.sh
```
or
```
  $ st-flash --reset write output/output_fmw.bin 0x8000000
```
or
```
  $ openocd -f /usr/share/openocd/scripts/board/st_nucleo_f4.cfg -c "program output/output_fmw.elf verify reset exit"
```
* CLEAN BINARIES (OPTIONAL) :
```
  $ make clean
```
* ERASE THE CHIP'S CONTENT (OPTIONAL) :
```
  $ make erase
```
* START THE DEBUGGING SESSION :
```
  $ make debug
```
* OPEN ANOTHER TERMINAL WINDOW, AND LET THE FUN BEGIN :
```
  $ make gdb
```

## How to use from WSL:

- On Windows side: 
```
 $ usbipd wsl list
```
following by:
```
 $ usbipd wsl attach --busid <busid>
```
- On Linux side (just to check):
```
 $ lsusb
```

Source: [WSL + USB = ❤️](https://docs.microsoft.com/en-us/windows/wsl/connect-usb)

