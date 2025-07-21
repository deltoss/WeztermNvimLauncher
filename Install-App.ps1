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

ps2exe "$PSScriptRoot/WeztermNeovimLauncher.ps1" "$PSScriptRoot/output/WeztermNeovimLauncher.exe" -noConsole -iconFile "$PSScriptRoot/assets/Icon.ico" -longPaths `
  -title "Wezterm Neovim Launcher" -description "An executable that opens files in Neovim within a WezTerm terminal instance."

git clone https://github.com/deltoss/PsInstallTools.git "$PSScriptRoot/temp/PsInstallTools"
Import-Module -Verbose "$PSScriptRoot/temp/PsInstallTools"
Install-FromFolder "$PSScriptRoot/output/" "WeztermNeovimLauncher"
Remove-Module -Verbose "$PSScriptRoot/temp/PsInstallTools"
Remove-Item -Path "$PSScriptRoot/temp" -Recurse -Force

