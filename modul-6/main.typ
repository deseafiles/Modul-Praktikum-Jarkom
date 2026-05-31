= Modul Praktikum Jaringan Komputer
== Routing Dinamis OSPF

#align(center)[
#figure(
  image("assets/routing.png", width: 80%),
  caption: [
    Skema Routing
  ],
)]

=== Tujuan Praktikum
  Setelah menyelesaikan praktikum ini, mahasiswa mampu:
  - Memahami konsep dasar routing dinamis OSPF
  - Mengkonfigurasi OSPF pada router mikrotik
  - Menguji konektivitas antar jaringan menggunakan OSPF

=== Overview
==== Apa itu OSPF?
  OSPF (Open Shortest Path First) adalah sebuah protokol routing yang digunakan oleh router untuk saling bertukar informasi tentang jaringan yang mereka ketahui. Dengan informasi tersebut, router dapat menentukan jalur terbaik untuk mengirimkan data dari satu jaringan ke jaringan lainnya.

  Bayangkan sebuah aplikasi peta. Saat seseorang ingin pergi ke suatu tempat, aplikasi akan mencari rute tercepat berdasarkan kondisi jalan yang tersedia. OSPF bekerja dengan konsep serupa, yaitu membantu router menemukan "jalan tercepat" untuk mengirim paket data.

==== Mengapa OSPF Dibutuhkan?
  Dalam jaringan kecil yang hanya memiliki satu atau dua router, administrator dapat mengatur rute secara manual (static routing).
  Namun pada jaringan yang lebih besar terdapat beberapa masalah seperti, jumlah router bisa puluhan hingga ratusan, jalur jaringan dapat berubah sewaktu-waktu, dan kemungkinan terjadinya penambahan atau pengurangan perangkat. Jika semua rute diatur secara manual, pengelolaannya akan sangat rumit.

==== Bagaimana OSPF Bekerja?

#show table.cell.where(x: 0): set text(style: "italic")
#show table.cell.where(y: 0): set text(style: "normal", weight: "bold")
#set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })

#align(center, table(
  columns: 3,
  align: center + horizon,
  table.header[Keterangan][Router 1][Router 2],
  [IP ether1], [10.10.10.1/30], [10.10.10.2/30],
  [IP ether2], [192.168.1.1/24], [192.168.2.1/24],
  [Redistribute Default Route], [always (as type 1)], [always (as type 1)],
))

=== Langkah - langkah pengerjaan
- Pada Router 1
+ Tambahkan IP Address pada masing masing interface yang digunakan. Silahkan improvisasi IP Address atau bisa ikuti settingan pada table di atas. Pastikan ether1 digunakan untuk menghubungkan antar router.
+ Lalu pada menu Routing pilih "OSPF" dan setelahnya akan menampilkan settingan OSPF, masuk ke tab "Instance", lalu double klik pada "Default". Note: Jangan lupa enable jika sebelumnya belum menyala.
+ Pilih redistribute Default Router menjadi "always (as type 1)", lalu OK. Note: Pada praktikum ini digunakan "Redistribute Default Route" untuk tujuan pembelajaran. Dalam implementasi nyata, konfigurasi ini hanya diperlukan apabila router memiliki default route yang ingin disebarkan ke router lain. 
  #align(center)[
  #figure(
    image("assets/Screenshot 2026-05-19 162304.png", width: 80%),
    caption: [
      Skema Routing
    ],
  )]
+ Selanjutnya masih di OSPF, masuk ke tab Networks, lalu tambahkan network baru. Tambahkan semua network untuk tiap jaringan yang ingin dihubungkan dengan router. Pilih area sebagai backbone. Note: Jangan lupa prefix setiap kali menambahkan network baru.
  #align(center)[
  #figure(
    image("assets/Screenshot 2026-05-19 163200.png", width: 80%),
    caption: [
      Skema Routing
    ],
  )]
+ Lakukan hal yang sama pada Router 2 juga.
+ Terakhir, lakukan uji coba ping untuk mengetes apakah routing berhasil atau tidak.
  #align(center)[
  #figure(
    image("assets/Screenshot 2026-05-19 163446.png", width: 80%),
    caption: [
      Skema Routing
    ],
  )]



