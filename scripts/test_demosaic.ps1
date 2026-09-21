$ErrorActionPreference='Stop'
$root=(Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$vb='C:/AMDDesignTools/2025.2/Vivado/bin'
$hdl=Join-Path $root 'zybo_z7_imx219/zybo_z7_imx219.gen/sources_1/bd/design_1/ip/design_1_v_demosaic_0_0/hdl/verilog'
$top=Get-Content (Join-Path $hdl 'design_1_v_demosaic_0_0_v_demosaic.v') -Raw
if($top -notmatch 'input\s+\[9:0\]\s+s_axis_video_TDATA') {throw 'Wait for generated 10-bit demosaic HDL'}
$out=Join-Path $root 'sw/test/demosaic_sim'
New-Item -ItemType Directory -Path $out -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $root 'src/isp_srgb.mem') -Destination $out -Force
Get-ChildItem $hdl -Filter '*.dat' | Copy-Item -Destination $out -Force
Push-Location $out
try {
  $files=@(Get-ChildItem $hdl -Filter '*.v' | ForEach-Object FullName)
  & "$vb/xvlog.bat" @files
  if($LASTEXITCODE -ne 0) {throw 'xvlog demosaic failed'}
  & "$vb/xvlog.bat" --sv (Join-Path $root 'src/axis_isp.v') (Join-Path $root 'sw/test/tb_demosaic.sv')
  if($LASTEXITCODE -ne 0) {throw 'xvlog testbench failed'}
  & "$vb/xelab.bat" tb_demosaic -s demosaic_test --timescale 1ns/1ps
  if($LASTEXITCODE -ne 0) {throw 'xelab failed'}
  & "$vb/xsim.bat" demosaic_test -runall
  $log=Get-Content xsim.log -Raw
  if($LASTEXITCODE -ne 0 -or $log -match 'Fatal:' -or ([regex]::Matches($log,'PASS demosaic field').Count -ne 5)) {throw 'Demosaic simulation failed'}
} finally {Pop-Location}
