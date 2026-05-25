= Modul Praktikum Jaringan Komputer
== Quality Of Services

=== Overview
- QoS (Quality of Service) pada Mikrotik adalah metode manajemen bandwidth untuk mengatur, memprioritaskan, dan melimitasi lalu lintas data. 
- Tujuannya adalah mencegah koneksi lambat atau putus-putus, memastikan jaringan tetap stabil walau diakses banyak pengguna secara bersamaan. 

=== Langkah-langkah Praktikum
==== Simple Queue
- Fitur paling dasar untuk membatasi kecepatan (upload dan download) berdasarkan alamat IP klien. Sangat cocok untuk pengguna rumahan atau kantor kecil.
  + Dengan menggunakan settingan pada modul bridge sebelumnya. Kita bisa melakukan QOS Simple Queue.
  + Masuk ke menu Queue > Simple Queue > New
  + Masukkan nama sebagai identifier.
  + Masukkan target IP dari laptop Anda.
  + Masukkan Max Limit untuk Target Upload dan Target Download. Tekan OK.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 160349.png", width: 80%),
      caption: [
        x
      ],
    )]
  + Masuk ke tab "Total" dan isi Total Max Limit.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 160400.png", width: 80%),
      caption: [
        x
      ],
    )]

  + Lalu masuk ke Tab "Simple Queue" dan double click pada Queue, lalu pilih "Torch".
  + Amati hasilnya.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 160648.png", width: 80%),
      caption: [
        x
      ],
    )]

  + Lalu Anda dapat menambahkan Queue Type baru, seperti gambar di bawah ini.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 160950.png", width: 80%),
      caption: [
        x
      ],
    )]



