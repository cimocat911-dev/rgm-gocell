# Rgm Gocell — paket build APK, AAB, EXE, HTML

Isi folder:
- `www/index.html` — aplikasi lengkap (sama dengan versi HTML). Bisa langsung dibuka di Chrome.
- `.github/workflows/build.yml` — build otomatis gratis di GitHub: APK + AAB (Android) dan EXE (Windows).
- `build-windows.bat` — build EXE di komputer Windows sendiri.
- `build-android.bat` — build APK/AAB di komputer yang sudah ada Android Studio.

## Cara 1 (paling mudah): build otomatis di GitHub, tanpa memasang apa pun
1. Buat akun di github.com, lalu klik **New repository** → beri nama `rgm-gocell` → **Private** → Create.
2. Klik **uploading an existing file**, seret SEMUA isi folder ini (termasuk folder `.github`). Klik **Commit changes**.
   - Jika folder `.github` tidak ikut terunggah, klik **Add file → Create new file**, ketik nama `.github/workflows/build.yml`, lalu tempel isi file build.yml.
3. Buka tab **Actions**. Build berjalan sendiri ±10 menit.
4. Setelah centang hijau, klik build tersebut → bagian **Artifacts** → unduh:
   - `Rgm-Gocell-Android-APK-AAB` → `Rgm-Gocell.apk` (pasang di HP), `Rgm-Gocell.aab` (untuk Play Store), `rgmc-keystore.jks`
   - `Rgm-Gocell-Windows-EXE` → `Rgm-Gocell-Setup-1.0.0.exe` (installer) dan `...Portable...exe` (tanpa instal)
   - `Rgm-Gocell-HTML` → `index.html`

**Penting tentang kunci (keystore):** build pertama membuat kunci baru (`rgmc-keystore.jks`, sandi `rgmc123456`). Simpan file itu. Agar update berikutnya bisa dipasang menimpa versi lama, masukkan kunci tersebut ke GitHub: Settings → Secrets → Actions → `KEYSTORE_BASE64` (isi base64 dari file .jks) dan `KEYSTORE_PASSWORD`.

## Memasang di Android
Salin `Rgm-Gocell.apk` ke HP → buka → izinkan "Pasang dari sumber tidak dikenal" → Pasang. Saat pertama dibuka, izinkan lokasi, mikrofon, dan notifikasi.

## Memasang di Windows
Jalankan `Rgm-Gocell-Setup-1.0.0.exe`. Jika muncul SmartScreen "Windows protected your PC", klik **More info → Run anyway** (aplikasi belum memakai sertifikat berbayar).

## Catatan fitur di APK/EXE
- Data tersimpan di perangkat masing-masing. Gunakan Pengaturan → Cadangan untuk memindahkan data.
- Peta, nama desa/kecamatan, dan pencarian tempat butuh internet.
- Ubah suara ke teks berjalan di Chrome dan versi Windows. Di APK, rekam suara berjalan; suara ke teks akan memakai pengenal suara Android pada versi berikutnya.
- Transfer file antarperangkat dan downloader masih tahap berikutnya.
