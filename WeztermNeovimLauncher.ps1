# Usage:
#   Open nvim with a specific file
#   .\WeztermNvimLauncher.ps1 "myfile.txt"
param(
    [string]$FilePath
)

function Test-CommandExists {
    param([string]$Command)

    try {
        Get-Command $Command -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

Write-Debug "Checking required applications..."
$errors = @()
# Check for nvim
if (Test-CommandExists "nvim") {
    Write-Debug "✓ Neovim (nvim) found"
} else {
    Write-Debug "✗ Neovim (nvim) not found"
    $errors += "nvim"
}

# Check for wezterm
if (Test-CommandExists "wezterm") {
    Write-Debug "✓ WezTerm found"
} else {
    Write-Debug "✗ WezTerm not found"
    $errors += "wezterm"
}

# Error out if anything is missing
if ($errors.Count -gt 0) {
    $errorMsg = "Error: Missing required applications: $($errors -join ', ')`nPlease install the missing applications and try again."
    Write-Host $errorMsg -ForegroundColor Yellow
    exit 1
}

if ($FilePath) {
    & wezterm start --always-new-process --no-auto-connect nvim "$FilePath"
} else {
    & wezterm start --always-new-process --no-auto-connect nvim
}
