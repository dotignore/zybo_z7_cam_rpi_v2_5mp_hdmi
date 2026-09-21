@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0.."
if exist V:\scripts\compile_elf.cmd cd /d V:\

set GCC=C:\AMDDesignTools\2025.2\Vitis\gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-gcc.exe
set OBJCOPY=C:\AMDDesignTools\2025.2\Vitis\gnu\aarch32\nt\gcc-arm-none-eabi\bin\arm-none-eabi-objcopy.exe
set BSP=vitis_hdmi_ws\zybo_hdmi_plat\ps7_cortexa9_0\standalone_domain\bsp\ps7_cortexa9_0
set SRC=sw\src
set OUT=vitis_hdmi_ws\cam_hdmi\Debug

if not exist "%GCC%" (
  echo ARM GCC not found: %GCC%
  exit /b 1
)
if not exist "%BSP%\lib\libxil.a" (
  echo BSP missing: %BSP%
  exit /b 1
)
if not exist "%OUT%" mkdir "%OUT%"

set CFLAGS=-mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -O2 -g -ffunction-sections -fdata-sections -mno-unaligned-access -Wall -I%BSP%\include
set OBJS=

for %%f in (%SRC%\*.c) do (
  echo CC %%~nxf
  "%GCC%" %CFLAGS% -c "%%f" -o "%OUT%\%%~nf.o"
  if errorlevel 1 exit /b 1
  set OBJS=!OBJS! %OUT%\%%~nf.o
)

echo LD cam_hdmi.elf
"%GCC%" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -nostartfiles ^
  -Wl,-T,scripts\lscript.ld -Wl,-build-id=none -Wl,--gc-sections ^
  -L%BSP%\lib -o %OUT%\cam_hdmi.elf !OBJS! ^
  -Wl,--start-group -lxil -lgcc -lc -lm -Wl,--end-group
if errorlevel 1 exit /b 1
"%OBJCOPY%" -O binary %OUT%\cam_hdmi.elf %OUT%\cam_hdmi.bin
if errorlevel 1 exit /b 1
echo ELF %CD%\%OUT%\cam_hdmi.elf
exit /b 0
