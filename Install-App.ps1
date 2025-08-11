$scriptDir = $PSScriptRoot

# Check if ps2exe module is installed
if (Get-Module -ListAvailable -Name ps2exe) {
  Write-Host "ps2exe module is already installed." -ForegroundColor Green
} else {
  Write-Host "ps2exe module not found. Installing..." -ForegroundColor Yellow
  try {
    Install-Module -Name ps2exe -Force
    Write-Host "ps2exe module installed successfully!" -ForegroundColor Green
  } catch {
    Write-Error "Failed to install ps2exe module: $_"
  }
}

New-Item -Path "$scriptDir/output" -ItemType Directory -Force
ps2exe "$scriptDir/WeztermNeovimLauncher.ps1" "$scriptDir/output/WeztermNeovimLauncher.exe" -noConsole -iconFile "$scriptDir/assets/Icon.ico" -longPaths `
  -title "Wezterm Neovim Launcher" -description "An executable that opens files in Neovim within a WezTerm terminal instance."

# See https://github.com/deltoss/PsInstallTools
$targetTempPath = "$Env:TEMP/PsInstallTools"
if (Test-Path $targetTempPath) {
    Remove-Item -Path $targetTempPath -Recurse -Force
}
git clone https://github.com/deltoss/PsInstallTools.git $targetTempPath
Import-Module -Verbose $targetTempPath
Install-FromFolder "$scriptDir/output/" "WeztermNeovimLauncher"
Remove-Module -Verbose PsInstallTools
Remove-Item -Path $targetTempPath -Recurse -Force
