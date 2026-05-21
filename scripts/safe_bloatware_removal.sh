#!/bin/bash
# SAFE bloatware removal for Samsung Galaxy J7 (Verizon)
# This script only disables apps that have been verified safe

echo "🔧 Starting SAFE bloatware removal..."
echo ""
echo "⚠️  CRITICAL: The following packages are REQUIRED for camera and will NOT be disabled:"
echo "  - com.samsung.cmh (Camera Mode Handler)"
echo "  - com.sec.android.app.camera (Camera app)"
echo "  - com.samsung.android.provider.shootingmodeprovider (Camera modes)"
echo "  - com.sec.factory.camera (Camera factory)"
echo "  - com.sec.android.gallery3d (Gallery)"
echo "  - com.samsung.android.providers.context (System context provider)"
echo "  - com.sec.android.daemonapp (System daemon)"
echo ""

read -p "Continue with safe bloatware removal? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "🗑️  Disabling Verizon bloatware (safe)..."

# Verizon Apps - SAFE to disable
adb shell pm disable-user --user 0 com.verizon.mips.services
adb shell pm disable-user --user 0 com.verizon.obdm
adb shell pm disable-user --user 0 com.verizon.llkagent
adb shell pm disable-user --user 0 com.LogiaGroup.LogiaDeck  # Verizon Messages

echo "🎨 Disabling extra fonts (safe)..."

# Extra Fonts - SAFE to disable
adb shell pm disable-user --user 0 com.monotype.android.font.rosemary
adb shell pm disable-user --user 0 com.monotype.android.font.chococooky
adb shell pm disable-user --user 0 com.monotype.android.font.cooljazz

echo "📱 Disabling Samsung bloatware (safe)..."

# Samsung Apps - SAFE if you don't use them
adb shell pm disable-user --user 0 com.sec.android.app.shealth  # Samsung Health
adb shell pm disable-user --user 0 com.hancom.office.viewer     # Office Viewer
adb shell pm disable-user --user 0 com.enhance.gameservice      # Game Tools

echo ""
echo "✅ Done! Safe bloatware removal complete."
echo ""
echo "Testing camera..."
adb shell am start -n com.sec.android.app.camera/.Camera

echo ""
echo "📊 Total packages disabled:"
adb shell pm list packages -d | wc -l
echo ""
echo "ℹ️  To undo: adb shell pm enable PACKAGE_NAME"
