@echo off
title Build Rgm Gocell (APK/AAB)
echo Butuh: Node.js 20, Android Studio (Android SDK) dan JDK 17.
call npm install --no-audit --no-fund || goto err
if not exist android call npx cap add android || goto err
call npx cap sync android || goto err
cd android
if not exist ..\rgmc.jks keytool -genkeypair -keystore ..\rgmc.jks -alias rgmc -keyalg RSA -keysize 2048 -validity 10000 -storepass rgmc123456 -keypass rgmc123456 -dname "CN=RGMC, O=RGMC, C=ID"
call gradlew.bat assembleRelease bundleRelease -Pandroid.injected.signing.store.file=%cd%\..\rgmc.jks -Pandroid.injected.signing.store.password=rgmc123456 -Pandroid.injected.signing.key.alias=rgmc -Pandroid.injected.signing.key.password=rgmc123456 || goto err
cd ..
echo SELESAI:
echo  APK : android\app\build\outputs\apk\release\
echo  AAB : android\app\build\outputs\bundle\release\
echo SIMPAN file rgmc.jks baik-baik. Update aplikasi wajib memakai kunci yang sama.
pause & exit /b 0
:err
echo Build gagal. Periksa Node.js, Android Studio, dan JDK 17.
pause
