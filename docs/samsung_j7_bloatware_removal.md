# Samsung Galaxy J7 (Verizon) - Safe App Removal Guide

## ⚠️ CRITICAL - DO NOT DISABLE OR UNINSTALL (Camera Dependencies)
These packages are REQUIRED for the camera to function:
- `com.samsung.cmh` - **Samsung Camera Mode Handler (CRITICAL - camera will crash without this!)**
- `com.sec.android.app.camera` - Main camera app
- `com.sec.android.gallery3d` - Gallery (to view photos taken)
- `com.samsung.android.provider.shootingmodeprovider` - Camera shooting modes
- `com.sec.factory.camera` - Camera factory components
- `com.samsung.android.providers.context` - Samsung context provider (required by camera)
- `com.sec.android.daemonapp` - Samsung system daemon

## ✅ SAFE TO DISABLE - Verizon Bloatware
These are Verizon carrier apps that can be safely disabled:
```bash
# Verizon Apps
com.verizon.mips.services         # Verizon App Manager
com.vzw.apnlib                    # Verizon APN settings
com.vcast.mediamanager            # Verizon Cloud/Media Manager
com.customermobile.preload.vzw    # Verizon Preload
com.verizon.obdm                  # Verizon Device Management
com.verizon.obdm_permissions      # Verizon Device Management Permissions
com.verizon.llkagent              # Verizon Lookup Kit
com.LogiaGroup.LogiaDeck          # Verizon Messages+ (if you don't use it)
```

## ✅ SAFE TO DISABLE - Samsung Bloatware
These Samsung apps can be disabled if you don't use them:
```bash
# Samsung Services
com.sec.android.app.shealth       # Samsung Health
com.samsung.android.mobileservice # Samsung Account services (may break Samsung apps)
com.samsung.advancedcalling       # Advanced Calling/Video Calling
com.osp.app.signin                # Samsung Sign-in
com.samsung.android.smartmirroring # Smart View/Screen Mirroring

# Samsung Apps
com.hancom.office.viewer          # Hancom Office Viewer
com.sec.android.app.soundalive    # Sound Alive equalizer
com.enhance.gameservice           # Game Tools/Game Launcher
com.sec.android.app.magnifier     # Magnifier app
com.sec.hearingadjust             # Hearing adjustments

# Samsung Fonts
com.monotype.android.font.rosemary
com.monotype.android.font.foundation
com.monotype.android.font.chococooky
com.monotype.android.font.cooljazz

# Easy Mode
com.sec.android.widgetapp.easymodecontactswidget
com.sec.android.easyonehand
com.sec.android.emergencymode.service
com.sec.android.emergencylauncher
```

## ⚠️ DISABLE WITH CAUTION
These might affect some functionality:
```bash
# Google Apps (disable if you don't use them)
com.google.android.apps.photos    # Google Photos (alternative to Gallery)
com.google.android.gm             # Gmail
com.google.android.tts            # Text-to-Speech (needed for accessibility)
com.google.android.marvin.talkback # TalkBack (accessibility feature)

# Samsung Features
com.samsung.android.app.assistantmenu # Accessibility menu
com.sec.android.app.personalization   # Theme customization
com.sec.android.mimage.photoretouching # Photo editor (may affect Gallery)
com.samsung.clipboardsaveservice   # Clipboard history
com.samsung.android.clipboarduiservice # Clipboard UI
```

## 🛑 DO NOT DISABLE - Core System Components
Never disable these or your phone may malfunction:
```bash
# Core Android
android
com.android.systemui
com.android.settings
com.sec.android.app.launcher      # Samsung launcher (unless using another launcher)
com.android.phone                 # Phone app
com.sec.phone                     # Samsung Phone services
com.android.mms.service           # Text messaging
com.android.providers.*           # All provider packages
com.google.android.gms            # Google Play Services
com.google.android.gsf            # Google Services Framework
com.android.vending               # Google Play Store

# Camera Related (already listed above)
# IMS/VoLTE (needed for calls on 4G)
com.sec.ims
com.sec.imsservice
com.sec.sve

# Security & Knox
com.sec.enterprise.*
com.knox.*
com.samsung.android.securitylogagent
```

## How to Disable Apps

### Method 1: ADB Disable (Recommended - Reversible)
```bash
# Disable an app (reversible)
adb shell pm disable-user --user 0 PACKAGE_NAME

# Re-enable an app if needed
adb shell pm enable PACKAGE_NAME

# Check if an app is disabled
adb shell pm list packages -d
```

### Method 2: ADB Uninstall for Current User (Most Effective)
```bash
# Uninstall for current user (app remains in system, easily reversible)
adb shell pm uninstall -k --user 0 PACKAGE_NAME

# Reinstall if needed
adb shell cmd package install-existing PACKAGE_NAME
```

## Example Commands to Get Started

### Disable Verizon Bloatware:
```bash
adb shell pm disable-user --user 0 com.verizon.mips.services
adb shell pm disable-user --user 0 com.vcast.mediamanager
adb shell pm disable-user --user 0 com.verizon.obdm
adb shell pm disable-user --user 0 com.LogiaGroup.LogiaDeck
```

### Disable Samsung Fonts:
```bash
adb shell pm disable-user --user 0 com.monotype.android.font.rosemary
adb shell pm disable-user --user 0 com.monotype.android.font.chococooky
adb shell pm disable-user --user 0 com.monotype.android.font.cooljazz
```

## Testing After Disabling
1. **Test the camera immediately** after disabling apps
2. Test photo viewing in Gallery
3. Test taking photos in different modes
4. If camera breaks, re-enable the last disabled app

## Backup Your Package List
```bash
# List all enabled packages (before changes)
adb shell pm list packages -e > packages_enabled_before.txt

# List disabled packages (check after changes)
adb shell pm list packages -d > packages_disabled.txt
```
