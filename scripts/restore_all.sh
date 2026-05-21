#!/bin/bash
# Re-enable all disabled packages to restore camera functionality

echo "Re-enabling all previously disabled packages..."

adb shell pm enable com.monotype.android.font.rosemary
adb shell pm enable com.vzw.apnlib
adb shell pm enable com.google.android.googlequicksearchbox
adb shell pm enable com.verizon.mips.services
adb shell pm enable com.qualcomm.ltebc_vzw
adb shell pm enable com.sec.android.easyonehand
adb shell pm enable com.verizon.obdm_permissions
adb shell pm enable com.cequint.ecid
adb shell pm enable com.sec.android.widgetapp.easymodecontactswidget
adb shell pm enable com.vcast.mediamanager
adb shell pm enable com.sec.android.app.soundalive
adb shell pm enable com.samsung.android.sdk.professionalaudio.utility.jammonitor
adb shell pm enable com.sec.android.app.clockpackage
adb shell pm enable com.google.android.syncadapters.contacts
adb shell pm enable com.android.chrome
adb shell pm enable com.google.android.partnersetup
adb shell pm enable com.customermobile.preload.vzw
adb shell pm enable com.google.android.feedback
adb shell pm enable com.google.android.apps.photos
adb shell pm enable com.google.android.syncadapters.calendar
adb shell pm enable com.hancom.office.viewer
adb shell pm enable com.monotype.android.font.chococooky
adb shell pm enable com.sec.android.app.shealth
adb shell pm enable com.google.android.backuptransport
adb shell pm enable com.LogiaGroup.LogiaDeck
adb shell pm enable com.sec.android.emergencylauncher
adb shell pm enable com.verizon.obdm
adb shell pm enable com.samsung.android.dlp.service
adb shell pm enable com.samsung.android.sdk.professionalaudio.app.audioconnectionservice
adb shell pm enable com.enhance.gameservice
adb shell pm enable com.monotype.android.font.cooljazz
adb shell pm enable qualcomm.com.vzw_msdc_api
adb shell pm enable com.sec.android.app.magnifier
adb shell pm enable com.samsung.upsmtheme
adb shell pm enable com.verizon.llkagent

echo "✅ All packages re-enabled"
echo "Testing camera..."
adb shell pm clear com.sec.android.app.camera
adb shell am start -n com.sec.android.app.camera/.Camera
