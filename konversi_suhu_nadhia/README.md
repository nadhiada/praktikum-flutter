# Laporan Praktikum Flutter

# Aplikasi Konversi Suhu + Firebase Authentication

Aplikasi ini merupakan aplikasi Flutter sederhana yang digunakan untuk melakukan konversi suhu antara beberapa satuan, yaitu Celsius, Fahrenheit, Kelvin, dan Reamur.

Pada pengembangan kali ini, aplikasi tidak hanya dibuat untuk melakukan konversi suhu, tetapi juga ditambahkan fitur **Login Authentication menggunakan Firebase** serta menerapkan **Provider State Management** agar struktur kode lebih rapi dan mudah dikembangkan.

---
# 📸 Screenshot Aplikasi

### Login Gagal
<img src="https://github.com/user-attachments/assets/dde091f5-1c26-48ee-912f-f84baa1151fb" width="200"/>

### Login Berhasil
<img src="https://github.com/user-attachments/assets/5fab08f4-d077-4617-81b4-fdc0a008e465" width="200"/>
<img src="https://github.com/user-attachments/assets/99fdc786-cdf2-4558-8c1e-47f98698e1c5"  width="200"/>

### Halaman Konversi Suhu
<img src="https://github.com/user-attachments/assets/e21a422c-853b-4c3f-99b2-cdba9075d467" width="200"/>

---

# Fitur Aplikasi

Beberapa fitur yang terdapat pada aplikasi ini:

* Login menggunakan Firebase Authentication
* Konversi suhu ke:
  * Celsius
  * Fahrenheit
  * Kelvin
  * Reamur
* Menggunakan `Provider` sebagai state management
---

# Struktur Project
```text
lib/
├── main.dart
├── home_page.dart
├── login_page.dart
├── auth_service.dart
├── temperature_provider.dart
└── firebase_options.dart
```
---

# Penjelasan Tiap File

## 1. `main.dart`

File utama aplikasi atau entry point Flutter.

Fungsi:

* Menjalankan aplikasi Flutter
* Inisialisasi Firebase
* Mendaftarkan Provider menggunakan `ChangeNotifierProvider`
* Mengatur tema aplikasi
* Menentukan halaman awal aplikasi (`LoginPage`)

Pada file ini juga digunakan:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

yang berfungsi untuk menghubungkan Flutter dengan Firebase.

---

## 2. `login_page.dart`

Berisi tampilan halaman login.

Fungsi:

* Input email
* Input password
* Tombol login
* Validasi login Firebase
* Navigasi ke `HomePage` setelah login berhasil

User melakukan login menggunakan akun yang telah dibuat pada Firebase Authentication.

---

## 3. `auth_service.dart`

Berisi seluruh proses authentication Firebase.

Fungsi:

* Login menggunakan:

```dart
signInWithEmailAndPassword()
```

* Logout menggunakan:

```dart
signOut()
```

File ini dibuat terpisah agar logic authentication tidak bercampur dengan UI.

---

## 4. `temperature_provider.dart`

Berisi seluruh state dan logic konversi suhu.

Fungsi:

* Menyimpan data suhu
* Menyimpan satuan input
* Mengelola proses konversi
* Mengirim perubahan data ke UI menggunakan:

```dart
notifyListeners()
```

Provider digunakan agar tampilan dapat otomatis berubah tanpa perlu menggunakan `setState`.

---

## 5. `home_page.dart`

Berisi tampilan utama aplikasi konversi suhu.

Fungsi:

* Input nilai suhu
* Dropdown pilihan satuan
* Tombol konversi
* Menampilkan hasil konversi
* Tombol logout

Pada file ini tidak terdapat perhitungan suhu karena seluruh logic dipindahkan ke Provider.

---

## 6. `firebase_options.dart`

File otomatis hasil generate dari FlutterFire CLI.

Fungsi:

* Menyimpan konfigurasi Firebase untuk:

  * Android
  * Web

File ini digunakan saat proses:

```dart
Firebase.initializeApp()
```

---

# Alur Kerja Aplikasi

## Proses Login

1. User membuka aplikasi
2. Halaman login muncul
3. User memasukkan email dan password
4. Data dikirim ke Firebase Authentication
5. Jika berhasil:

   * masuk ke halaman konversi suhu
6. Jika gagal:

   * muncul pesan login gagal

---

## Proses Konversi Suhu

1. User memasukkan nilai suhu
2. User memilih satuan suhu
3. User menekan tombol konversi
4. Data dikirim ke `TemperatureProvider`
5. Provider melakukan perhitungan
6. `notifyListeners()` dipanggil
7. UI otomatis diperbarui

---

# Logika Konversi Suhu

Semua proses konversi menggunakan Celsius sebagai titik acuan utama.

## Konversi ke Celsius

* Fahrenheit → `(F - 32) * 5 / 9`
* Kelvin → `K - 273.15`
* Reamur → `R * 5 / 4`

## Konversi dari Celsius

* Fahrenheit → `(C * 9 / 5) + 32`
* Kelvin → `C + 273.15`
* Reamur → `C * 4 / 5`

Dengan metode ini, proses perhitungan menjadi lebih sederhana dan mudah dikelola.

---

# Alasan Menggunakan Provider

Provider dipilih karena:

* Lebih sederhana dibanding BLoC
* Mudah dipahami untuk project kecil
* Memisahkan logic dan UI
* Mengurangi penggunaan `setState`
* Membuat kode lebih rapi
* Mudah dikembangkan kembali

---

# 🔥 Firebase Authentication

Firebase Authentication digunakan sebagai sistem login aplikasi.

Metode login yang digunakan:

```text
Email & Password Authentication
```

Firebase dipilih karena:

* Mudah diintegrasikan dengan Flutter
* Aman
* Cepat digunakan
* Mendukung banyak platform

---

# 🛠️ Langkah Implementasi

## 1. Membuat project Flutter

```bash
flutter create konversi_suhu_nadhia
```

---

## 2. Menambahkan dependency

```bash
flutter pub add provider
flutter pub add firebase_core
flutter pub add firebase_auth
```

---

## 3. Membuat Firebase Project

* Membuat project di Firebase Console
* Menambahkan Android App
* Menambahkan Web App

---

## 4. Menghubungkan Firebase ke Flutter

Menggunakan FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
```

```bash
dart pub global run flutterfire_cli:flutterfire configure
```

---

## 5. Membuat halaman Login

Membuat:

* `login_page.dart`
* `auth_service.dart`

---

## 6. Membuat Provider

Membuat:

* `temperature_provider.dart`

---

## 7. Menghubungkan UI dengan Provider

Menggunakan:

```dart
ChangeNotifierProvider
```

dan

```dart
Provider.of<TemperatureProvider>(context)
```

---

## 8. Menambahkan Logout

Logout dilakukan menggunakan:

```dart
FirebaseAuth.instance.signOut()
```

---

# ▶️ Cara Menjalankan Aplikasi

## Install dependency

```bash
flutter pub get
```

---

## Menjalankan aplikasi Web

```bash
flutter run -d chrome
```

---

## Menjalankan aplikasi Android

```bash
flutter run
```

---

# 🧩 Kesimpulan

Dari praktikum ini dapat disimpulkan bahwa penggunaan Provider membantu membuat struktur aplikasi menjadi lebih rapi karena logic dan tampilan dipisahkan.

Selain itu, integrasi Firebase Authentication membuat aplikasi menjadi lebih aman karena hanya user yang memiliki akun yang dapat mengakses aplikasi.
