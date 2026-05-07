= Modul Praktikum Jaringan Komputer
== Basic Mikrotik RouterOs


+ Matikan Wifi pada laptop Anda.
+ Lalu masuk ke pengaturan pada bagian menu "Network & internet" dan tekan "Ethernet".
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153605.png", width: 70%)

+ Selanjutnya tekan "Edit" pada *IP assigment*.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153621.png", width: 70%)

+ Pada bagian ini ganti DHCP menjadi Manual, lalu centang IPv4 untuk mengaktifkan konfigurasi IPv4. Saat ini langkah yang dilakukan ialah memberikan IP Address pada laptop Anda secara manual. Masukkan IP Address untuk laptop dengan network yang sama dengan IP Router Anda. Lalu gunakan subnet mask 255.255.255.0. Pada bagian gateway gunakan IP Address yang sama dengan yang akan di gunakan oleh router Anda. Masukkan Preferred DNS dengan 8.8.8.8 yang merepresentasikan public DNS server milik Google.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153712.png", width: 70%)

+ Masuk ke winbox
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153742.png", width: 70%)

+ Pilih menu IP > Address
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153800.png", width: 70%)

+ Tambahkan IP Address untuk router, nah IP address inilah yang menjadi gateway bagi laptop kita. Prefix yang digunakan adalah /24, yang bilamana diubah ke subnet mask akan bernilai 255.255.255.0. Lalu pilih interface sesuai port ethernet yang digunakan untuk menghubungkan laptop ke router. Dalam hal ini penulis mencolok pada ether1. _Lebih jelasnya bisa ditanyakan ke asisten masing-masing tentang ether itu apa_.
+ Lalu klik Apply/OK
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 153922.png", width: 70%)


+ Selanjutnya kembali ke halaman utama winbox, lalu pilih menu Wireless
+ Lalu masuk ke menu security profile dan klik new untuk mendaftarkan security profile baru.
+ Berikan nama yang tepat bagi security profile-- _boleh sembarang_--. Lalu cek apakah wifi yang akan digunakan sebagai WAN berisi password atau tidak, jika ya maka lanjut poin x.1. Namun jika tidak, maka lewatkan poin x.1. Lalu klik Apply/OK.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154153.png", width: 70%)

+ Pada menu Wifi Interfaces, klik wlan1 dan pilih enable.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154004.png", width: 70%)


+ Lalu balik ke halaman wireless dan klik 2 kali pada nama wlan1. Setelah ini akan menampilkan settingan pada wlan1.

+ Langkah selanjutnya masuk ke menu wireless, pilih mode sebagai station agar router dapat bertindak sebagai clinet dan terhubung ke access point lain. Tambahkan SSID yang sama dengan nama SSID dari wifi yang ingin dihubungkan. Pilih security profile yang didaftarkan sebelumnya. 
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154245.png", width: 70%)

+ Klik Apply/OK.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154619.png", width: 70%)

+ Langkah selanjutnya adalah mengkonfigurasi IP Address untuk wlan1. Dengan menggunakan DHCP Client. Kembali ke halaman utama winbox, lalu pilih IP > DHCP Client.
+ Klik "New" untuk menambahkan DHCP Client. Pada menu DHCP Client, pilih interface "wlan1", lalu centang Use Peer DNS dan Use Peer NTP. 
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154639.png", width: 70%)

+ Klik Apply/OK.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154651.png", width: 70%)



+ Jika status telah "bound", maka DHCP Client sudah memberikan IP ke wlan1.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154704.png", width: 70%)

+ Lalu untuk mengecek apakah IP Address dari DHCP Client benar-benar didapatkan, bisa ke menu IP > Address. Jika benar, maka akan muncul tanda D seperti gambar di bawah ini. _Pengertian DHCP Client bisa ditanyakan lebih lanjut ke asisten masing-masing_.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154724.png", width: 70%)

+ Lalu pilih menu terminal pada halaman awal winbox. Ketik ping 8.8.8.8 atau ping www.google.com, untuk mengecek koneksi internet. Jika status TTL, maka router telah berhasil mendapat koneksi internet.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154801.png", width: 70%)

+ Selanjutnya untuk dapat menghubungkan laptop ke koneksi internet, maka diperlukan konfigurasi pada NAT. _Fungsi NAT akan dijelaskan lebih lanjut oleh asisten masing-masing_.

+ Untuk melakukan setting NAT, masuk ke menu IP > Firewall > NAT. Lalu klik "new".

+ Di menu general, pilih chain sebagai "srcnat" dan Out. Interface sebagai "wlan1".
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154926.png", width: 70%)

+ Lalu pindah ke menu action dan pilih Action sebagai "masquerade". Klik Apply/OK.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 154943.png", width: 70%)
  

+ NAT akan muncul di layar seperti ini.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 155050.png", width: 70%)

+ Selanjutnya buka terminal di laptop dan ping ke 8.8.8.8 untuk mengecek koneksi internet pada laptop Anda. TTL menandakan laptop sudah terkoneksi dengan internet.
  #image("./Modul-1-20260507T022609Z-3-001/Modul-1/Screenshot 2026-05-06 155121.png", width: 70%)



