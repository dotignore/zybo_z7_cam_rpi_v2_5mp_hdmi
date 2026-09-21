$ErrorActionPreference = 'Stop'
$out = Join-Path $PSScriptRoot 'uart_capture.txt'
try {
    $p = New-Object System.IO.Ports.SerialPort COM4,115200,None,8,One
    $p.Open()
} catch {
    "COM4_BUSY: $_" | Set-Content -Path $out -Encoding utf8
    exit 1
}
$d = New-Object System.Text.StringBuilder
$end = (Get-Date).AddSeconds(150)
while ((Get-Date) -lt $end) {
    if ($p.BytesToRead -gt 0) {
        [void]$d.Append($p.ReadExisting())
    }
    Start-Sleep -Milliseconds 80
}
$p.Close()
$t = $d.ToString()
if ($t.Length -eq 0) {
    'NO UART' | Set-Content -Path $out -Encoding utf8
} else {
    $t.Substring(0, [Math]::Min(60000, $t.Length)) | Set-Content -Path $out -Encoding utf8
}
Write-Output ("UART_BYTES=" + $t.Length)
