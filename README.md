# Laptop Power Screen Optimizer

Laptop Power Screen Optimizer automatically adjusts your screen’s refresh rate based on your laptop’s power source.  
It switches to a **high refresh rate when plugged in** and **lowers it on battery** to extend battery life.  
Includes easy setup scripts, Task Scheduler integration, and optional autostart.

---

## ✨ Features
- 🔌 Detects AC adapter connection and adjusts refresh rate automatically
- ⚡ Saves battery life by lowering refresh rate on battery
- 🖥️ Uses [`ScreenResChanger.exe`](https://github.com/Crtque/screen_resolution_changer) — a lightweight utility **also developed by me**
- 📂 Simple `.bat` scripts for install, remove, and autostart
- 🛠️ No external dependencies — works with built-in Windows tools

---

## 🧩 About ScreenResChanger

This project relies on my other open-source project:  
🔗 [**screen_resolution_changer**](https://github.com/Crtque/screen_resolution_changer)  

`ScreenResChanger.exe` is built from that repository.  
You are welcome to **compile it yourself** for transparency and customization.  

---

## 📦 Project Structure
LaptopPowerScreenOptimizer/
├── ScreenResChange.exe # Built from screen_resolution_changer
├── task_template.xml # Task Scheduler template
├── enable_screenrefresher.bat # Creates AC on/off tasks
├── check_power_and_set_refresh.bat # Checks power status at startup
└── disable_screenrefresher.bat # Deletes all scheduled tasks

---

## 🚀 Setup

### 1. Clone or Download
```bash
git clone https://github.com/crtque/auto-screen-hz-switcher.git
cd auto-screen-hz-switcher
```
### 2. Install Scheduled Tasks

Run:
```bash
enable_screenrefresher.bat
```

Creates two Windows Task Scheduler tasks:
* AC On: Sets refresh rate to 144Hz
* AC Off: Sets refresh rate to 60Hz
