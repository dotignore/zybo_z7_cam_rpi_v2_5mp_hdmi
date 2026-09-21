# Capture COM4 after flash. Close any other COM4 session first.
$ErrorActionPreference = 'Stop'
try {
    $p = New-Object System.IO.Ports.SerialPort COM4,115200,None,8,One
    $p.ReadTimeout = 500
    $p.Open()
} catch {
    Write-Output "COM4_BUSY: $_"
    exit 1
}
$deadline = (Get-Date).AddSeconds(90)
$data = New-Object System.Text.StringBuilder
while ((Get-Date) -lt $deadline) {
    if ($p.BytesToRead -gt 0) {
        [void]$data.Append($p.ReadExisting())
    }
    Start-Sleep -Milliseconds 100
}
$p.Close()
$text = $data.ToString()
if ($text.Length -eq 0) {
    Write-Output 'NO UART'
} else {
    $n = [Math]::Min(30000, $text.Length)
    Write-Output $text.Substring(0, $n)
}
