# PowerShell install script for cc-switch

$script = Join-Path (Get-Location) "cc_switch.py"
$targetDir = "$env:USERPROFILE\bin"
$target = Join-Path $targetDir "ccswitch.ps1"

if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

# Always overwrite
"#!/usr/bin/env python3" | Out-File -Encoding utf8 $target
Get-Content $script | Out-File -Encoding utf8 -Append $target

# Add user bin to PATH if not already
$profilePath = $PROFILE
$pathLine = "`$env:PATH = `"$env:USERPROFILE\bin;`$env:PATH`""
if (!(Get-Content $profilePath | Select-String -Pattern $pathLine)) {
    Add-Content -Path $profilePath -Value $pathLine
    Write-Host "Added $targetDir to PATH in $profilePath"
}

Write-Host "ccswitch command installed at $targetDir."
Write-Host "Usage examples:"
Write-Host "  ccswitch.ps1 --type kimi --token sk-xxx"
Write-Host "  ccswitch.ps1 --type custom --token sk-xxx --base_url https://your-url.com"
Write-Host "  ccswitch.ps1 --reset"
Write-Host "  ccswitch.ps1   # interactive mode"
Write-Host "If you just installed, restart PowerShell or run: . $PROFILE"
