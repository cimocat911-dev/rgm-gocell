@echo off
title Build Rgm Gocell (EXE)
echo Memasang bahan build... (butuh Node.js 20: https://nodejs.org)
call npm install --no-audit --no-fund || goto err
echo Membuat file EXE...
call npx electron-builder --win nsis portable --x64 --publish never || goto err
echo.
echo SELESAI. File ada di folder "dist":
dir /b dist\*.exe
pause & exit /b 0
:err
echo Build gagal. Pastikan Node.js 20 sudah terpasang dan internet aktif.
pause
