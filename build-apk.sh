#!/bin/bash

# ===================================================
# MP4 Finder Android APK Build Script
# ===================================================
#
# This script prepares your web app for Android APK generation and
# provides instructions on how to complete the build process.
#
# Prerequisites:
# - Android Studio installed (https://developer.android.com/studio)
# - Android SDK configured
# - Java Development Kit (JDK) 11+ installed
#
# ===================================================

echo "📱 MP4 Finder APK Build Process"
echo "==============================="

# Build the React app
echo "🔨 Step 1: Building React application..."
npm run build

# Initialize Capacitor if not already done
if [ ! -d "android" ]; then
  echo "🔧 Step 2: Initializing Capacitor..."
  npx cap init MP4Finder com.mp4finder.app --web-dir=dist
  
  echo "➕ Step 3: Adding Android platform..."
  npx cap add android
else
  echo "✓ Android platform already exists."
fi

# Sync the web code to the native Android project
echo "🔄 Step 4: Syncing web code with Android platform..."
npx cap sync

# Fix asset paths for Android
echo "🔧 Step 5: Fixing asset paths for Android compatibility..."
if [ -f "android/app/src/main/assets/public/index.html" ]; then
  # Replace absolute paths with relative paths
  sed -i 's|src="/assets/|src="assets/|g' android/app/src/main/assets/public/index.html
  sed -i 's|href="/assets/|href="assets/|g' android/app/src/main/assets/public/index.html
  echo "✓ Fixed asset paths in Android index.html"
fi

echo
echo "✅ Preparation complete!"
echo
echo "📋 Instructions to generate the APK:"
echo "--------------------------------"
echo "1. Open Android Studio: npx cap open android"
echo "2. Once Android Studio opens, wait for it to finish syncing"
echo "3. From the top menu, select: Build > Build Bundle(s) / APK(s) > Build APK(s)"
echo "4. When the build completes, click on the 'locate' link in the notification"
echo "5. The APK file will be located at: android/app/build/outputs/apk/debug/app-debug.apk"
echo
echo "📱 To install on your Android device:"
echo "--------------------------------"
echo "1. Enable developer options and USB debugging on your device"
echo "2. Connect your device to the computer via USB"
echo "3. In Android Studio, click on 'Run' (green play button)"
echo "4. Select your device from the list and click OK"
echo
echo "🔍 MP4 Finder will be installed on your device."
echo "You can now scan websites for MP4 links directly from your Android phone!"