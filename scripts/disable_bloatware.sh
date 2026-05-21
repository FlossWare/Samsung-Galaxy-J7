#!/bin/bash
# Safe bloatware removal for Samsung Galaxy J7 (Verizon)
# This script disables apps that won't affect camera functionality

echo "🔧 Disabling Verizon bloatware..."

# Verizon Apps
adb shell pm disable-user --user 0 com.verizon.mips.services
adb shell pm disable-user --user 0 com.vzw.apnlib
adb shell pm disable-user --user 0 com.verizon.obdm
adb shell pm disable-user --user 0 com.verizon.obdm_permissions
adb shell pm disable-user --user 0 com.verizon.llkagent
adb shell pm disable-user --user 0 com.qualcomm.ltebc_vzw
adb shell pm disable-user --user 0 qualcomm.com.vzw_msdc_api

echo "🎨 Disabling extra Samsung fonts..."

# Samsung Fonts (keep default)
adb shell pm disable-user --user 0 com.monotype.android.font.rosemary
adb shell pm disable-user --user 0 com.monotype.android.font.chococooky
adb shell pm disable-user --user 0 com.monotype.android.font.cooljazz

echo "🧹 Disabling Samsung bloatware..."

# Samsung Services/Apps you likely don't use
adb shell pm disable-user --user 0 com.samsung.android.smartmirroring
adb shell pm disable-user --user 0 com.hancom.office.viewer
adb shell pm disable-user --user 0 com.sec.android.app.soundalive
adb shell pm disable-user --user 0 com.enhance.gameservice
adb shell pm disable-user --user 0 com.sec.android.app.magnifier
adb shell pm disable-user --user 0 com.sec.android.widgetapp.easymodecontactswidget
adb shell pm disable-user --user 0 com.sec.android.easyonehand
adb shell pm disable-user --user 0 com.samsung.android.sdk.professionalaudio.utility.jammonitor
adb shell pm disable-user --user 0 com.samsung.android.sdk.professionalaudio.app.audioconnectionservice

echo "✅ Done! Testing camera functionality..."
echo "Please test your camera now to ensure it works properly."
echo ""
echo "To undo any change, use: adb shell pm enable PACKAGE_NAME"
