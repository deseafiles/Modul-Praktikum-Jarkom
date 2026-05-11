= Modul Praktikum Jaringan Komputer
== Firewall

#align(center)[
#figure(
  image("assets/Firewall.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]

=== Overview
- Digunakan untuk melindungi router dari luar dan dalam. Bertindak sebagai penjaga yang melakukan filtering pada paket data.
  - Accept  : Mengizinkan jaringan masuk dan keluar.
  - Reject  : Menolak dengan menampilkan error respon.
  - Drop    : Menolak secara diam diam tanpa menampilkan respon.
- Cara kerja pada firewall, yaitu ketika ada paket data yang masuk atau keluar di jaringan pasti melewati firewall terlebih dahulu untuk dilakukan pengecekan, setelah paket data dipastikan aman, maka akan diizinkan masuk/keluar. Namun jika mencurigakan akan diblokir. 


=== Langkah - Langkah Praktikum
  + Ikuti tatacara pada modul 1 untuk terhubung dengan internet.
  + Masuk ke menu IP > Firewall > Filter Rules
    #align(center)[
    #figure(
      image("assets/img/Screenshot 2026-05-06 155403.png", width: 80%),
      caption: [
        Halaman Awal Winbox
      ],
    )]
  + Klik New atau icon tambah.
  + Setelah itu akan muncul firewall setting.
  + Di tab General, pilih Chain untuk forward. Note: Firewall filter rule menggunakan prinsip IF ... THEN, alias (IF) jika paket yang masuk memenuhi syarat (THEN) maka action akan dilakukan terhadap paket tersebut.
    #align(center)[
    #figure(
      image("assets/img/Screenshot 2026-05-06 155455.png", width: 80%),
      caption: [
        Tampilan Setting Firewall
      ],
    )]
  + Lalu masih di tab General terdapat beberapa kolom yang perlu diperhatikan seperti:
    - Src. Address      : Berisi IP Client atau sumber paket.
    - Dst. Address      : Berisi alamat tujuan paket data.
    - Protocol          : Jenis protokol yang digunakan seperti TCP, UDP, atau ICMP.
    - Source Port       : Port asal dari paket data.
    - Destination Port  : Port tujuan paket data.
    - In. Interface     : Interface tempat paket masuk ke router.
    - Out. Interface    : Interface tempat paket keluar dari router.
    - Packet Mark       : Penanda paket tertentu yang dibuat menggunakan mangle.
    - Connection Mark   : Penanda koneksi tertentu untuk kebutuhan filtering atau routing.
    - Routing Mark      : Penanda routing tertentu yang digunakan untuk policy routing.
    - Routing Table     : Tabel routing yang digunakan oleh paket.
  + Selanjutnya pindah ke tab Action. Terdapat beberapa pilihan dengan penjelasan seperti di bawah ini.
    - accept            : Mengizinkan paket melewati firewall.
    - add-dst-to-address: Menambahkan alamat tujuan paket ke address list.
    - add-src-to-address: Menambahkan alamat sumber paket ke address list.
    - drop              : Menolak paket tanpa memberikan balasan.
    - jump              : Mengalihkan proses pengecekan paket ke chain lain.
    - log               : Mencatat aktivitas paket ke log router.
    - passthrough       : Membiarkan paket lanjut diproses ke rule berikutnya.
    - reject            : Menolak paket dan mengirimkan pesan penolakan.
    - return            : Mengembalikan proses ke chain sebelumnya.
    - tarpit            : Menahan koneksi TCP agar berjalan sangat lambat.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155611.png", width: 80%),
  caption: [
    Firewall Action Tab
  ],
)]

=== Protecting Our Router
  + Jika ada traffic input yang berasal IP Laptop pribadi, lalu ke tab Action dan pilih accept untuk mengizinkan paket dengan IP Laptop pribadi masuk/keluar.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155721.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155825.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
  + Lalu tambahkan untuk Firewall Rule baru dan kosongkan Src. Address yang berarti semua IP Address, lalu pilih Action sebagai drop.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155910.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155921.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
  + Pada Firewall akan terbentuk 2 Filter Rule baru, yaitu accept dan drop.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 155938.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
  + Cobalah untuk masing-masing anggota melakukan ping, akses route, dan remote winbox ke peserta lain. Amati bagaimana firewall memperlakukan paket yang masuk dan keluar.

=== Firewall Logging
  - Firewall Logging adalah fitur untuk mencatat aktivitas yang terjadi dalam jaringan kita.
    + Buat filter rule pada menu IP>Firewall>FilterRules. Lalu ping dari laptop IP interface wlan1 dan amati log pada router.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 160108.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 160136.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]

=== Firewall Address List
  - Fitur Address List dipakai untuk mengelompokkan IP address supaya rule jaringan lebih mudah dikelola. Daripada menulis IP satu-satu di banyak firewall rule, cukup masukkan IP ke satu list lalu rule tinggal memanggil nama list itu.  
    + Masuk ke tab General, lalu pilih Chain dengan input, protocol icmp, dan In. interface dengan ether2.
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 161233.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
    + Pindah ke tab Action, pilih action dengan add src to address list, Address List dengan "who-ping-me", dan time-out dengan 20 detik. Ini untuk mengetahui siapa dari lokal yang melakukan ping ke router, dia tidak akan bisa mengakses internet selama 20 detik. 
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 161255.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
    + Buat rule drop untuk address-list "who-ping-me", sehingga jika ada yang melakukan ping ke router maka paket akan didrop. //revisi
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 161342.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 161357.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]

=== Firewall Block Content
  - Digunakan untuk memblokir trafik berdasarkan isi data paket, bukan hanya IP atau port. 
    + Tambah rule firewall baru.
      #align(center)[
      #figure(
        image("assets/img/Screenshot 2026-05-06 161535.png", width: 80%),
        caption: [
          Skema Firewall
        ],
      )]
    + Tambahkan chain sebagai forward, content sebagai mikrotik (berisi content apa yang ingin dikenakan action), lalu pilih action. Dalam hal ini action yang dipilih ialah drop.
      #align(center)[
      #figure(
      image("assets/img/Screenshot 2026-05-06 161557.png", width: 80%),
      caption: [
        Skema Firewall
      ],
    )]
#align(center)[
#figure(
  image("assets/img/Screenshot 2026-05-06 161608.png", width: 80%),
  caption: [
    Skema Firewall
  ],
)]

