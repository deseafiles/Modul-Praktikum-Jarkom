= Modul Praktikum Jaringan Komputer
== Routing Statis

=== Overview
- Routing MikroTik adalah proses pengiriman dan pemilihan jalur paket data dari satu jaringan ke jaringan lainnya yang dilakukan oleh perangkat router MikroTik. 
- Memungkinkan perangkat dengan segmen IP berbeda, seperti jaringan lokal (LAN) dan internet, untuk saling berkomunikasi. 
- Rute jaringan yang dimasukkan secara manual oleh administrator ke dalam tabel routing. Cocok untuk jaringan skala kecil hingga menengah yang stabil.
    #align(center)[
    #figure(
      image("./assets/skema.png", width: 80%),
      caption: [
        x
      ],
    )]



#show table.cell.where(x: 0): set text(style: "italic")
#show table.cell.where(y: 0): set text(style: "normal", weight: "bold")
#set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })

#align(center, table(
  columns: 3,
  align: center + horizon,
  table.header[Keterangan][Router 1][Router 2],
  [IP ether1], [10.10.10.1/24], [10.10.10.2/24],
  [IP ether2], [192.168.1.1/24], [192.168.2.1/24],
  [Gateway], [10.10.10.2], [10.10.10.1],
  [Type], [unicast], [unicast],
))


=== Langkah-langkah Praktikum
- Router 1

  + Pada Router 1, daftarkan IP Address dengan mengikuti table di Atas.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 161544.png", width: 100%),
      caption: [
        x
      ],
    )]
  + Lalu masuk ke IP > Routes.
  + Tambahkan Route baru dengen Dst. Address ke network lawan dan gateaway juga IP Address router lawan.
  + Pilih Type dengan unicast.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 162002.png", width: 100%),
      caption: [
        x
      ],
    )]
  + Lalu coba ping antar router
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 162020.png", width: 100%),
      caption: [
        x
      ],
    )]

- Router 2 
  + Pada Router 2, daftarkan IP Address dengan mengikuti table di Atas.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 161623.png", width: 100%),
      caption: [
        x
      ],
    )]
  + Lalu masuk ke IP > Routes 
  + Tambahkan Route baru dengen Dst. Address ke network lawan dan gateaway juga IP Address router lawan.
  + Pilih Type dengan unicast.
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 161842.png", width: 100%),
      caption: [
        x
      ],
    )]
  + Ping ke IP Address
    #align(center)[
    #figure(
      image("./assets/Screenshot 2026-05-19 161907.png", width: 100%),
      caption: [
        x
      ],
    )]



