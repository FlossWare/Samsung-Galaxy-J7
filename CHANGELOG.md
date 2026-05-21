# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.0.0] - 2026-05-21

### Added
- Initial release of Galaxy J7 Mini Computer conversion project
- Aggressive debloat script removing 70 bloatware packages
- Safe debloat scripts (phase 1 and phase 2)
- Emergency restore script
- Comprehensive Termux setup script
- F-Droid and Termux APK installers
- Three demo projects:
  - Python web server (demo_hello_world.py)
  - File organizer (demo_file_organizer.py)
  - System monitor (demo_system_monitor.sh)
- Complete documentation:
  - README.md
  - TERMUX_QUICK_START.md
  - mini_computer_setup_guide.md
  - mini_computer_conversion_summary.md
  - samsung_j7_bloatware_removal.md
  - storage_and_bloatware_report.md
  - DEBLOAT_SUMMARY.txt
  - FINAL_SETUP_COMPLETE.txt

### Fixed
- Camera crash issue by reinstalling com.samsung.cmh package
- Protected critical camera dependencies from removal
- Verified camera saves photos to SD card

### Changed
- Reduced total packages from 235 to 165 (30% reduction)
- Removed all Verizon bloatware (9 packages)
- Removed 35+ Samsung bloatware packages
- Removed 11 unnecessary Google apps
- Optimized for performance and battery life

### Security
- Added camera package protection to prevent breakage
- Created emergency restore functionality
- Documented all safe-to-disable packages

## [Unreleased]

### Planned
- Support for other Samsung Galaxy J models
- Automated testing scripts
- Performance benchmarking tools
- Battery life comparison data
- More demo projects
- Video tutorial
