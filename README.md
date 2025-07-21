# Wezterm Nvim Launcher

## About

A lightweight Windows executable that opens files in Neovim within a WezTerm terminal instance.

**The Problem:**

When you set Neovim (nvim.exe) as the default program for text files (or other files) on Windows, it launches in whatever terminal is configured as your system default - typically PowerShell or Windows Terminal. Unfortunately, Windows doesn't currently allow you to change this system-wide default terminal setting to WezTerm.

**The Solution:**

This launcher acts as a bridge between Windows file associations and your preferred terminal. Instead of associating files directly with nvim.exe, you associate them with this launcher, which then opens the file in Neovim running inside a new WezTerm window.

## Prerequisites

- nvim
- wezterm

## Publish Command

```powershell
./Install-App.ps1
```

# How to Change Default Apps on Windows

1. Open **Settings** (`Win + I`)
2. Navigate to **Apps** → **Default apps**
4. Find `Notepad`
5. Click on a file type you want associated.
6. Scroll down on the bottom and click **"Choose an app on your PC"**
7. Navigate to `/publish/WeztermNvimLauncher.exe`
8. Click on **"Set default"**
9. Repeat step 5-8 for each file association.

