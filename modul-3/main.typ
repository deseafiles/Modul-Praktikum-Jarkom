= Modul Praktikum Jaringan Komputer
== Bridge

=== Overview
- Bridge adalah perangkat jaringan yang digunakan untuk menghubungkan dua segmen jaringan pada layer 2.

#show table.cell.where(x: 0): set text(style: "italic")
#show table.cell.where(y: 0): set text(style: "normal", weight: "bold")
#set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })

#table(
  columns: 3,
  align: center + horizon,
  table.header[Keterangan][Router 1][Router 2],
  [Mode], [AP Bridge], [Station Bridge],
  [Band], [Sama], [Sama],
  [SSID], [Sama], [Sama],
  [Security Profile], [Sama], [Sama],
  [Frequency], [Tentukan], [Auto],
  [IP Wlan1], [10.10.10.1/24], [DHCP Client],
  [IP ether1], [192.168.x.1/24], [192.168.x.2/24],
  [DHCP Server], [YES], [NO],
  [DHCP Client], [NO], [YES],
)

=== Langkah - Langkah Praktikum
+ Laptop 1 (AP Bridge)
  + Pada menu Wireless > Wifi Interface > Enable.
  + Lalu double click pada wlan1 dan ubah mode menjadi "AP Bridge". 
  + Masuk ke menu IP > Firewall > Filter Rules
    #align(center)[
    #figure(
      image("./modul-3/Screenshot 2026-05-19 154506.png", width: 80%),
      caption: [
        x
      ],
    )]

  + Lalu tambahkan IP Address untuk interface Wlan1 dan interface ether1 sesuai table di atas.
    #align(center)[
    #figure(
      image("./modul-3/Screenshot 2026-05-19 154645.png", width: 80%),
      caption: [
        x
      ],
    )]

  + Selanjutnya masuk ke menu DHCP Server dan tambahkan DHCP Server baru untuk interface wlan1
    #align(center)[
    #figure(
      image("./modul-3/Screenshot 2026-05-19 154717.png", width: 80%),
      caption: [
        x
      ],
    )]

- Laptop 2 dan Router 2 (Station Bridge)
  + Pada laptop kedua masuk ke menu DHCP Client, lalu tambahkan DHCP Client baru pada interface wlan1. Saat status telah "bound", maka IP Address untuk wlan1 artinya berhasil didapatkan.
  #align(center)[
  #figure(
    image("./modul-3/Screenshot 2026-05-19 154952.png", width: 80%),
    caption: [
      x
    ],
  )]
  + Lalu tambahkan juga IP Address untuk ether1 pada router 2 sesuai tabel di atas. 
  + Selanjutnya masuk ke menu Wireless, lalu enable wlan1 dan double click. Ubah mode wlan1 menjadi station bridge. Masukkan SSID seperti router 1 dan security profile juga. Sampai status menampilkan connected to ess.
  #align(center)[
  #figure(
    image("./modul-3/Screenshot 2026-05-19 155404.png", width: 80%),
    caption: [
      x
    ],
  )]

- Bridge untuk masing-masing router
  + Masuk ke menu "Bridge", lalu tambahkan bridge baru pada tiap router. Masukkan nama bridge dan klik "OK".
  #align(center)[
  #figure(
    image("./modul-3/Screenshot 2026-05-19 155451.png", width: 80%),
    caption: [
      x
    ],
  )]
  + Pada masing-masing router, tambahkan port pada interface wlan1 dan interface ether1, seperti pada gambar di bawah ini.
  #align(center)[
  #figure(
    image("./modul-3/Screenshot 2026-05-19 155624.png", width: 80%),
    caption: [
      x
    ],
  )]
  + Lakukan ping ke ether1 lewat terminal winbox ke IP ether1 lawan, saat ttl maka sudah berhasil.
  + Lakukan sebaliknya.



