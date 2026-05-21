#!/bin/bash
# AGGRESSIVE Debloat - Turn Samsung J7 into a mini computer
# Removes all non-essential bloatware while keeping camera and core Android

echo "🚀 AGGRESSIVE DEBLOAT MODE"
echo ""
echo "This will transform your phone into a minimal Android computer."
echo ""
echo "WILL BE DISABLED:"
echo "  - All Samsung account/cloud services"
echo "  - Samsung themes and customization"
echo "  - Most Google apps (keeping Play Store/Services)"
echo "  - Accessibility features"
echo "  - Samsung Smart features"
echo "  - Print services"
echo "  - VPN and enterprise features"
echo ""
echo "WILL BE KEPT:"
echo "  - Camera and Gallery"
echo "  - Phone and SMS"
echo "  - Core Android system"
echo "  - Google Play Store/Services"
echo "  - Settings and Launcher"
echo ""

read -p "Continue with aggressive debloat? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo ""
echo "🗑️  Phase 1: Samsung Account & Cloud Services"

adb shell pm disable-user --user 0 com.samsung.android.mobileservice
adb shell pm disable-user --user 0 com.osp.app.signin
adb shell pm disable-user --user 0 com.samsung.android.scloud
adb shell pm disable-user --user 0 com.samsung.android.samsungpass

echo "🗑️  Phase 2: Samsung Smart Features"

adb shell pm disable-user --user 0 com.samsung.android.smartmirroring
adb shell pm disable-user --user 0 com.samsung.advancedcalling
adb shell pm disable-user --user 0 com.samsung.advp.imssettings
adb shell pm disable-user --user 0 com.samsung.android.da.daagent
adb shell pm disable-user --user 0 com.samsung.SMT

echo "🗑️  Phase 3: Samsung UI & Customization"

adb shell pm disable-user --user 0 com.samsung.android.themestore
adb shell pm disable-user --user 0 com.sec.android.app.personalization
adb shell pm disable-user --user 0 com.android.wallpapercropper
adb shell pm disable-user --user 0 com.sec.android.wallpapercropper2
adb shell pm disable-user --user 0 com.android.wallpaper.livepicker
adb shell pm disable-user --user 0 com.android.dreams.basic
adb shell pm disable-user --user 0 com.android.dreams.phototable

echo "🗑️  Phase 4: Accessibility Features (if you don't use them)"

adb shell pm disable-user --user 0 com.samsung.android.app.assistantmenu
adb shell pm disable-user --user 0 com.google.android.marvin.talkback
adb shell pm disable-user --user 0 com.samsung.android.app.accesscontrol
adb shell pm disable-user --user 0 com.sec.hearingadjust

echo "🗑️  Phase 5: Google Apps (keeping essentials)"

adb shell pm disable-user --user 0 com.google.android.gm  # Gmail
adb shell pm disable-user --user 0 com.google.android.tts  # Text-to-speech
adb shell pm disable-user --user 0 com.google.android.apps.photos  # Google Photos
adb shell pm disable-user --user 0 com.google.android.googlequicksearchbox  # Google search
adb shell pm disable-user --user 0 com.google.android.feedback
adb shell pm disable-user --user 0 com.google.android.printservice.recommendation
adb shell pm disable-user --user 0 com.google.android.setupwizard
adb shell pm disable-user --user 0 com.google.android.partnersetup
adb shell pm disable-user --user 0 com.google.android.syncadapters.contacts
adb shell pm disable-user --user 0 com.google.android.syncadapters.calendar
adb shell pm disable-user --user 0 com.google.android.backuptransport

echo "🗑️  Phase 6: Print & Document Services"

adb shell pm disable-user --user 0 com.android.printspooler
adb shell pm disable-user --user 0 com.android.bips
adb shell pm disable-user --user 0 com.android.documentsui

echo "🗑️  Phase 7: Samsung System Services (non-critical)"

adb shell pm disable-user --user 0 com.samsung.android.app.soundpicker
adb shell pm disable-user --user 0 com.sec.android.app.soundalive
adb shell pm disable-user --user 0 com.samsung.android.location  # Warning: may affect GPS
adb shell pm disable-user --user 0 com.samsung.networkui
adb shell pm disable-user --user 0 com.samsung.android.timezone.autoupdate_O
adb shell pm disable-user --user 0 com.samsung.unifiedsettingservice

echo "🗑️  Phase 8: VPN & Enterprise"

adb shell pm disable-user --user 0 com.android.vpndialogs
adb shell pm disable-user --user 0 com.knox.vpn.proxyhandler
adb shell pm disable-user --user 0 com.sec.enterprise.mdm.vpn
adb shell pm disable-user --user 0 com.android.managedprovisioning

echo "🗑️  Phase 9: Miscellaneous Bloat"

adb shell pm disable-user --user 0 com.android.egg  # Easter egg
adb shell pm disable-user --user 0 com.sec.android.easyMover.Agent
adb shell pm disable-user --user 0 com.sec.android.app.setupwizard
adb shell pm disable-user --user 0 com.samsung.huxextension
adb shell pm disable-user --user 0 com.sec.android.app.DataCreate
adb shell pm disable-user --user 0 com.sec.android.emergencymode.service
adb shell pm disable-user --user 0 com.sec.android.provider.emergencymode

echo "🗑️  Phase 10: Photo/Image Extras"

adb shell pm disable-user --user 0 com.sec.android.mimage.photoretouching

echo ""
echo "✅ AGGRESSIVE DEBLOAT COMPLETE!"
echo ""
echo "Testing camera..."
adb shell am start -n com.sec.android.app.camera/.Camera

sleep 3

echo ""
echo "📊 Statistics:"
echo -n "Total disabled packages: "
adb shell pm list packages -d | wc -l
echo -n "Total enabled packages: "
adb shell pm list packages -e | wc -l
echo ""
echo "⚠️  CRITICAL: TEST EVERYTHING NOW!"
echo "   - Camera (photo/video)"
echo "   - Phone calls"
echo "   - Text messages"
echo "   - WiFi/Data"
echo "   - Play Store"
echo ""
echo "If anything critical is broken, re-enable with:"
echo "  adb shell pm enable PACKAGE_NAME"
