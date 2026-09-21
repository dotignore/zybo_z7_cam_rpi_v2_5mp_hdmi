@echo off
setlocal
cd /d "%~dp0.."

REM Windows 260-char path limit kills v_demosaic HLS. Map a short drive.
REM Refresh the short path after this project is moved to another folder.
subst V: /d >nul 2>&1
subst V: "%cd%"
if not exist V:\scripts\add_hdmi_and_build.tcl (
  echo subst V: failed - cannot shorten project path
  exit /b 1
)
V:
cd \

set VIVADO=C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat
set XSCT=C:\AMDDesignTools\2025.2\Vitis\bin\xsct.bat
set XSDB=C:\AMDDesignTools\2025.2\Vitis\bin\xsdb.bat

echo === 1/3 Vivado bitstream from V:\ (10-40 min) ===
call "%VIVADO%" -mode batch -nojournal -log V:\scripts\vivado_hdmi.log -source V:\scripts\add_hdmi_and_build.tcl
if errorlevel 1 (
  echo VIVADO FAILED ? see scripts\vivado_hdmi.log
  exit /b 1
)

echo === 2/3 Update BSP from the new XSA ===
del /q scripts\.bsp_status 2>nul
call "%XSCT%" scripts\rebuild_bsp.tcl
findstr /B /C:"OK" scripts\.bsp_status >nul 2>&1
if errorlevel 1 (
  echo VITIS BUILD FAILED ? see XSCT output, scripts\.bsp_status
  exit /b 1
)

echo === 3/3 JTAG program Zybo ===
call flash.cmd
if errorlevel 1 (
  echo PROGRAM FAILED ? check USB JTAG, jumper JP5=JTAG
  exit /b 1
)

echo DONE. Monitor on HDMI OUT, UART COM4 115200.
exit /b 0
