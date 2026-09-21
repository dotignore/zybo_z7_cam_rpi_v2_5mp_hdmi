@echo off
setlocal
cd /d "%~dp0"

REM One-shot debug cycle: rebuild ALL sw/src/*.c, then JTAG the Zybo.
REM Does NOT rebuild the FPGA bitstream (that is scripts\flash_hdmi.cmd).

REM Refresh the short path after this project is moved to another folder.
subst V: /d >nul 2>&1
subst V: "%cd%"
if not exist V:\flash.cmd (
  echo Cannot map V: to this project
  exit /b 1
)
if exist V:\flash.cmd (
  V:
  cd \
)

echo === compile software ===
call scripts\compile_elf.cmd
if errorlevel 1 (
  echo COMPILE FAILED
  exit /b 1
)

python scripts\verify_build.py
if errorlevel 1 exit /b 1

echo === JTAG program FPGA bitstream into PL, then CPU image ===
echo Open COM4 115200 FIRST. JP5 must be JTAG, not QSPI.
echo If UART says "Zybo Z7-20 Rev. B Demo Image" that is factory flash, not cam_hdmi.
del /q scripts\.program_board_status 2>nul
call C:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat scripts\program_board.tcl
REM xsdb.bat often returns 0 even on Tcl FATAL — trust status file.
findstr /B /C:"OK" scripts\.program_board_status >nul 2>&1
if errorlevel 1 (
  echo PROGRAM FAILED. Close HW Manager/other XSDB, JP5=JTAG, power-cycle, retry.
  if exist scripts\.program_board_status type scripts\.program_board_status
  exit /b 1
)

echo DONE. Expect UART: GBR test 2s then camera stream
echo If you see Demo Image: move JP5 to JTAG, power-cycle, flash again.
exit /b 0
