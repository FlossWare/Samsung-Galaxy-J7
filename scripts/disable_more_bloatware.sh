#!/bin/bash
# Additional bloatware removal - Phase 2
# Conservative removal of clearly unnecessary apps

echo "🔧 Additional Bloatware Removal - Phase 2"
echo ""
echo "This will disable:"
echo "  - 3 additional Verizon packages"
echo "  - 7 Samsung non-essential services"
echo ""
echo "Camera-critical packages are protected and will NOT be disabled."
echo ""

read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "🗑️  Disabling remaining Verizon bloatware..."

adb shell pm disable-user --user 0 com.vzw.apnlib
adb shell pm disable-user --user 0 com.qualcomm.ltebc_vzw
adb shell pm disable-user --user 0 qualcomm.com.vzw_msdc_api

echo "📱 Disabling Samsung non-essential services..."

# Clipboard services
adb shell pm disable-user --user 0 com.samsung.clipboardsaveservice
adb shell pm disable-user --user 0 com.samsung.android.clipboarduiservice

# Other non-essential
adb shell pm disable-user --user 0 com.samsung.android.easysetup
adb shell pm disable-user --user 0 com.samsung.carrier.logcollector
adb shell pm disable-user --user 0 com.samsung.InputEventApp
adb shell pm disable-user --user 0 com.samsung.android.app.soundpicker

# Face service (if you don't use face unlock)
adb shell pm disable-user --user 0 com.samsung.faceservice

echo ""
echo "✅ Phase 2 complete!"
echo ""
echo "Testing camera..."
adb shell am start -n com.sec.android.app.camera/.Camera

sleep 3

echo ""
echo "📊 Total packages now disabled:"
adb shell pm list packages -d | wc -l
echo ""
echo "⚠️  TEST YOUR CAMERA NOW!"
echo "If camera works, you've successfully removed more bloatware."
echo ""
echo "To undo: adb shell pm enable PACKAGE_NAME"
