adb uninstall com.android.gallery 
adb install -g .\out\ANXGallery.apk
adb shell pm grant com.android.gallery android.permission.PACKAGE_USAGE_STATS