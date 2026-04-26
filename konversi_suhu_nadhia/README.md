# Laporan Praktikum Konversi Suhu

Aplikasi ini merupakan aplikasi Flutter sederhana yang digunakan untuk mengonversi suhu dari satu satuan ke satuan lainnya, yaitu **Celsius, Fahrenheit, Kelvin, dan Reamur**.

Pada praktikum ini, aplikasi tidak hanya dibuat agar berjalan, tetapi juga dilakukan perbaikan struktur kode dengan menerapkan **State Management Provider**. Tujuannya agar kode lebih terorganisir, mudah dipahami, serta lebih mudah dikembangkan di kemudian hari.

---

# Tujuan Praktikum

* Membuat aplikasi konversi suhu menggunakan Flutter
* Memahami konsep dasar state management
* Menerapkan Provider dalam pengelolaan state
* Memisahkan antara logika program dan tampilan (UI)

---

# Fitur 

* Input suhu menggunakan `TextField`
* Pemilihan satuan input menggunakan `DropdownButtonFormField`
* Konversi suhu ke semua satuan sekaligus (Celsius, Fahrenheit, Kelvin, Reamur)
* Validasi sederhana (tidak memproses jika input kosong)
* Tampilan hasil menggunakan `Card` agar lebih rapi dan mudah dibaca
* Menggunakan **Provider** sebagai state management

---

# Struktur Proyek (Provider)

Struktur aplikasi dibuat sederhana dengan pemisahan antara tampilan dan logika:

```
lib/
├── main.dart
├── home_page.dart
└── temperature_provider.dart
```

---

# Penjelasan Struktur

## main.dart

File ini merupakan **entry point** dari aplikasi.

Fungsinya:

* Menjalankan aplikasi Flutter
* Mendaftarkan Provider menggunakan `ChangeNotifierProvider`
* Mengatur tema aplikasi

Dengan adanya `ChangeNotifierProvider`, data dari provider dapat diakses oleh seluruh widget di dalam aplikasi.

---

## temperature_provider.dart

File ini berisi **logika utama aplikasi (business logic)**.

Tanggung jawabnya:

* Menyimpan nilai suhu (state)
* Menyimpan satuan input
* Melakukan perhitungan konversi suhu
* Memberi notifikasi ke UI menggunakan `notifyListeners()`

Semua proses perhitungan dilakukan di file ini, sehingga UI tidak perlu menangani logika.

---

## home_page.dart

File ini berisi **tampilan utama aplikasi (UI)**.

Fungsinya:

* Menampilkan form input suhu
* Menampilkan dropdown pilihan satuan
* Menyediakan tombol konversi
* Mengirim data ke provider
* Menampilkan hasil konversi dari provider

File ini tidak melakukan perhitungan, hanya berfungsi sebagai penghubung antara user dan provider.

---

# Alur Kerja Aplikasi

1. User memasukkan nilai suhu pada `TextField`
2. User memilih satuan suhu dari dropdown
3. User menekan tombol **Konversi**
4. Data dikirim ke `TemperatureProvider`
5. Provider melakukan perhitungan konversi
6. `notifyListeners()` dipanggil
7. UI otomatis diperbarui dengan hasil terbaru

---

# Logika Konversi

Semua perhitungan menggunakan **Celsius sebagai acuan utama**.

## Konversi ke Celsius:

* Fahrenheit → `(F - 32) × 5 / 9`
* Kelvin → `K - 273.15`
* Reamur → `R × 5 / 4`

## Konversi dari Celsius:

* Fahrenheit → `(C × 9 / 5) + 32`
* Kelvin → `C + 273.15`
* Reamur → `C × 4 / 5`

Dengan pendekatan ini, proses perhitungan menjadi lebih sederhana dan terstruktur.

---

# Alasan Menggunakan Provider

Penggunaan Provider pada aplikasi ini didasarkan pada beberapa pertimbangan:

* Memisahkan antara logika dan tampilan
* Menghindari penggunaan `setState` secara berlebihan
* Membuat kode lebih rapi dan mudah dipahami
* Memudahkan pengembangan fitur di masa depan

---

# Perbandingan State Management

## setState vs Provider

* `setState`: mudah digunakan, tetapi logic dan UI tercampur
* Provider: lebih terstruktur karena memisahkan logic dan UI

## Provider vs BLoC

* Provider: sederhana dan cocok untuk aplikasi kecil
* BLoC: lebih kompleks dan cocok untuk aplikasi besar

Pada kasus ini, Provider dipilih karena lebih sesuai dengan kebutuhan aplikasi yang masih sederhana.

---

# Langkah Implementasi

1. Membuat struktur awal project Flutter

2. Membuat file `home_page.dart` sebagai tampilan utama aplikasi (UI), yang berisi:

   * Input suhu menggunakan TextField
   * Dropdown untuk memilih satuan
   * Tombol konversi
   * Tampilan hasil konversi

3. Menambahkan dependency `provider` pada `pubspec.yaml`

4. Membuat file `temperature_provider.dart` untuk menangani:

   * Penyimpanan state (nilai suhu)
   * Logika perhitungan konversi
   * Pengelolaan perubahan data

5. Memindahkan seluruh logika konversi dari UI ke dalam provider

6. Mendaftarkan provider di `main.dart` menggunakan `ChangeNotifierProvider`

7. Menghubungkan `home_page.dart` dengan provider menggunakan:

   * `Provider.of<TemperatureProvider>(context)`
   * Memanggil fungsi konversi dari provider

8. Menampilkan hasil konversi dari provider ke dalam UI

9. Menggunakan `notifyListeners()` agar UI otomatis update ketika data berubah

---

# Tampilan Aplikasi

Aplikasi menggunakan:

* Material Design 3 (`useMaterial3: true`)
* ColorScheme untuk pengaturan warna
* Warna utama pink
* Card untuk menampilkan hasil konversi

---

# Hasil Tampilan Aplikasi

Berikut merupakan hasil tampilan aplikasi:

## Input Celsius

*(Tambahkan screenshot di sini)*

## Input Fahrenheit

*(Tambahkan screenshot di sini)*

## Input Kelvin

*(Tambahkan screenshot di sini)*

## Input Reamur

*(Tambahkan screenshot di sini)*

---

# Cara Menjalankan Aplikasi

```bash
flutter pub get
flutter run
```

---

# Kesimpulan

Dari praktikum ini dapat disimpulkan bahwa penggunaan Provider membantu meningkatkan kualitas struktur kode aplikasi.

Dengan memisahkan antara logika dan tampilan:

* kode menjadi lebih rapi
* lebih mudah dipahami
* lebih mudah dikembangkan

Untuk aplikasi sederhana seperti konversi suhu, Provider sudah menjadi solusi yang tepat tanpa perlu menggunakan arsitektur yang lebih kompleks seperti BLoC.

---
