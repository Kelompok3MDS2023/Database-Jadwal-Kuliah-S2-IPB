<div align="center">

![Logo IPB](https://user-images.githubusercontent.com/111562803/224660545-5b54692d-4e5f-4827-9aa6-85d4eeb83fd3.png)

# Data Base Jadwal Kuliah S2 IPB

• [Tentang Data Base Jadwal Kuliah IPB](#memo-tentang-data-base-jadwal-kuliah-s2-ipb)
• [Screenshot](#camera_flash-screenshot)
• [Demo](#video_camera-demo)
• [Dokumentasi](#blue_book-dokumentasi)

</div>

## :bookmark_tabs: Main Menu

- [Tentang Data Base Jadwal Kuliah S2 IPB](#memo-tentang-data-base-jadwal-kuliah-s2-ipb)
- [Screenshot](#camera_flash-screenshot)
- [Demo](#video_camera-demo)
- [Dokumentasi](#blue_book-dokumentasi)
- [Requirements](#video_camera-requirements)
- [Skema Database](#computer-skema-database)
- [Entity Relationship Diagram](#memo-entity-relationship-diagram)
- [Deskripsi Data](#pencil-deskripsi-data)
- [Struktur Folder](#open_file_folder-struktur-folder)
- [Anggota Tim Pengembang](#fireworks-anggota-tim-pengembang)


## :memo: Tentang Data Base Jadwal Kuliah S2 IPB 
Deskripsi Database Jadwal Kuliah S2 IPB

<div align="justify">
Database ini bertujuan untuk memudahkan mahasiswa dalam mencari ruangan belajar sesuai dengan jadwal dan mata kuliah yang telah ada. Informasi yang diberikan berupa jadwal kuliah, mata kuliah, posisi lokasi ruangan dan fakultas. Database terdiri dari beberapa tabel yaitu Tabel Fakultas, Ruangan, Jadwal Kuliah, dan Mata Kuliah.

</div>

<div align="justify">
R-Shiny pada dasarnya merupakan sebuah framework (kerangka kerja) yang ditawarkan oleh RStudio. Dengan menggunakan R-Shiny dapat membuat laporan dan visualisasi data yang efektif sehingga eksplorasi data pun lebih mudah. Selain itu, RStudio juga menyediakan elemen Shiny yang memungkinkan Anda menggunakan elemen HTML untuk mendesain konten yang ada dalam aplikasi.

 
Untuk mengaplikasikan R-Shinny dapat juga digunakan pada sistem manajemen database Ruang di IPB, yang bertujuan untuk menampilkan serta memberikan informasi mengenai ruangan belajar.
</div>

## :camera_flash: Screenshot
1️⃣ Summary Database

Menampilkan summary Database berupa visualisasi grafik pada Database yang tersedia.


Tentang Database
<img width="958" alt="about" src="https://user-images.githubusercontent.com/111562803/227761926-48358bd3-faad-46c4-9bd7-03c36d5f7b10.png">

Sebaran Program Studi S2 Per Fakultas
<img width="959" alt="Summary-Sebaran Prodi" src="https://user-images.githubusercontent.com/111562803/227761900-5b0b82d2-d2ce-4fa2-bbe4-6bdeb7cdbac3.png">

Sebaran Jumlah Ruangan Per Fakultas
<img width="958" alt="Summary-Sebaran Jumlah Ruangan" src="https://user-images.githubusercontent.com/111562803/227761908-fe1ed315-dbe0-4eb9-a4eb-723dd48fbe4a.png">

Sebaran Jadwal Kuliah Per Hari
<img width="958" alt="Summary - Sebaran Jadwal Kuliah" src="https://user-images.githubusercontent.com/111562803/227761918-a1d5c9f1-7c94-4dd6-b624-48c1d92da1eb.png">

Sebaran Jumlah Mata Kuliah Per Program Studi
<img width="959" alt="Summary - sebaran jumlah matkul" src="https://user-images.githubusercontent.com/111562803/227761919-b8595615-9251-4493-b9ae-b6259d9e40ef.png">


2️⃣ Fakultas

Menampilkan informasi daftar fakultas apa saja yang terdapat di IPB.

<img width="958" alt="Daftar Fakultas" src="https://user-images.githubusercontent.com/111562803/227761991-db5f624b-8a19-4eb0-aa09-e5218c1c9ab3.png">


3️⃣ Program Studi

Menampilkan informasi daftar program studi apa saja yang terdapat di IPB pada setiap fakultasnya.

<img width="960" alt="Daftar Prodi" src="https://user-images.githubusercontent.com/111562803/227762005-7681c7e0-b6e0-4be9-906b-7be908569026.png">



4️⃣ Ruangan

Menampilkan informasi tentang ruangan apa saja yang tersedia di IPB pada setiap gedung.

<img width="960" alt="Daftar Ruangan" src="https://user-images.githubusercontent.com/111562803/227762032-f3a3ba80-fea3-49f1-9c2f-1a84588c4ea4.png">



5️⃣ Jadwal Kuliah

Menampilkan informasi jadwal kuliah pada tiap program studi.

<img width="960" alt="Daftar Jadwal Kuliah" src="https://user-images.githubusercontent.com/111562803/227762041-b6ae94ea-eb23-46f3-9f23-0c4a3a40e463.png">


6️⃣ Mata Kuliah

Menampilkan informasi mata kuliah pada tiap program studi.

<img width="960" alt="Daftar Mata Kuliah" src="https://user-images.githubusercontent.com/111562803/227762055-2bfb80e4-f223-455b-b830-532ec9f94113.png">



## :video_camera: Demo
| url                      | login          |
| ------------------------ | -------------- |
|[ https://merryanty.shinyapps.io/Ruangan-IPB/ ](https://merryanty.shinyapps.io/Ruangan-IPB/)| merryantylestari9@gmail.com |



## :blue_book: Dokumentasi 

1️⃣ Contoh Mencari Ruang Kelas

Menampilkan contoh pencarian ruang kelas STA1541 maka akan muncul nama mata kuliah, jam, hari, serta lokasi ruangan tersebut.

<img width="960" alt="Contoh Mencari Ruang Kelas" src="https://user-images.githubusercontent.com/111562803/227762068-1f23813b-b5b0-4276-864c-e26a5529df4b.png">


## :video_camera: Requirements

- Paket R yang digunakan:

library(shiny)

library(shinydashboard)

library(DT)

library(RPostgreSQL)

library(DBI)

library(bslib)

library(gridlayout)

library(plotly)

library(tidyverse)

- RDBMS yang digunakan adalah PostgreSQL 15
- Front End menggunakan RShiny UI
- Back End menggunakan RShiny Server

## :computer: Skema Database
<img width="309" alt="Skema Baruu" src="https://user-images.githubusercontent.com/111562803/225198435-070352be-0237-4beb-b2a9-6a466f0c7b16.png">


## :memo: Entity Relationship Diagram
![ERD terbaru](https://user-images.githubusercontent.com/111562803/224460185-a02c22fb-ff99-4d24-beb9-61a97790e629.jpeg)

## :pencil: Deskripsi Data
### Sintax Rancangan Database

1️⃣ Tabel Fakultas
<div align="justify">
Tabel ini akan menyimpan data kode fakultas, nama fakultas, dan jumlah prodi yang nantinya akan dihubungkan dengan tabel ruangan untuk mengetahui lokasi ruangan berdasarkan fakultas.
</div>


| Attribute     | Type                  | Description                     |
|:--------------|:----------------------|:--------------------------------|
| kode_fk       | character varying(2)  | Kode Fakultas                   |
| nama_fk       | text                  | Nama fakultas                   |
| jmlh_prodi    | integer               | Jumlah Program Studi            |

| Primary Key    |
|:---------------|
| Kode Fakultas  |


```sql
CREATE TABLE public.fakultas
(
    kode_fk character varying(2) NOT NULL,
    nama_fk text NOT NULL,
    jmlh_prodi integer NOT NULL,
    CONSTRAINT fakultas_pkey PRIMARY KEY (kode_fk)
);

```

2️⃣ Tabel Ruangan
<div align="justify">
Tabel ini menyimpan data kode ruangan, nama ruangan, lokasi, kapasitas ruangan, dan kode fakultas. Tabel ini bertujuan untuk mengetahui lokasi suatu ruangan di IPB yang dicari berdasarkan jadwal kuliah dan kode ruangan.
</div>


| Attribute     | Type                  | Description                     |
|:--------------|:----------------------|:--------------------------------|
| kode_rg       | character varying(25) | Kode Ruangan                    |
| nama_rg       | text                  | Nama Ruangan                    |
| lokasi        | text                  | Lokasi                          |
| kapasitas     | integer               | Kapasitas                       |
| kode_fk       | character varying(2)  | Kode Fakultas                   |

| Primary Key    | Foreign Key   | 
|:---------------|:--------------|
| Kode Ruangan   | Kode Fakultas |

```sql
CREATE TABLE public.ruangan
(
    kode_rg character varying(25) NOT NULL,
    nama_rg text NOT NULL,
    lokasi text NOT NULL,
    kapasitas integer NOT NULL,
    kode_fk character varying(2) NOT NULL,
    CONSTRAINT ruangan_pkey PRIMARY KEY (kode_rg),
    CONSTRAINT ruangan_fkey FOREIGN KEY (kode_fk)
        REFERENCES public.fakultas (kode_fk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```
3️⃣ Tabel Prodi
<div align="justify">
Tabel ini menyimpan data kode Program Studi, nama prodi, singkatan dan kode fakultas. Tabel ini bertujuan untuk memberikan informasi prodi apa saja yang nantinya akan dihubungkan dengan tabel fakultas. 
</div>


| Attribute     | Type                  | Description                     |
|:--------------|:----------------------|:--------------------------------|
| kode_prodi    | character varying(25) | Kode Program Studi              |
| nama_prodi    | text                  | Nama Program Studi              |
| singkatan     | character varying(25) | Singkatan pada Program Studi    |
| kode_fk       | character varying(2)  | Kode Fakultas                   |

| Primary Key        | Foreign Key   | 
|:-------------------|:--------------|
| Kode Program Studi | Kode Fakultas |

```sql
CREATE TABLE public.prodi
(
    kode_prodi character varying(25) NOT NULL,
    nama_prodi text NOT NULL,
    singkatan character varying(25) NOT NULL,
    kode_fk character varying(2) NOT NULL,
    CONSTRAINT prodi_pkey PRIMARY KEY (kode_prodi),
    CONSTRAINT prodi_kode_fk_fkey FOREIGN KEY (kode_fk)
        REFERENCES public.fakultas (kode_fk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```

4️⃣ Tabel Jadwal Kuliah
<div align="justify">
Tabel ini menyimpan data kode mata kuliah, jenis kelas, hari, jam, dan kode ruangan. Tabel ini bertujuan untuk memberikan informasi jadwal kuliah beserta lokasi dan fakultas ruangan sehingga memudahkan mahasiswa dalam mencari ruangan belajar.
</div>


| Attribute     | Type                  | Description                     |
|:--------------|:----------------------|:--------------------------------|
| kode_mk       | character varying(10) | Kode Mata Kuliah                |
| jenis_kelas   | character varying(5)  | Jenis Kelas                     |
| hari          | text                  | Hari                            |
| jam           | character varying(25) | Jam                             |
| kode_rg       | character varying(25) | Kode Ruangan                    |

| Primary Key     | Foreign Key   | 
|:----------------|:--------------|
| Kode Matakuliah | Kode Ruangan  |
| Jenis Kelas     | Matakuliah    |

```sql
CREATE TABLE public.jadwal_kuliah
(
    kode_mk character varying(10) NOT NULL,
    jenis_kelas character varying(5) NOT NULL,
    hari text NOT NULL,
    jam character varying(25) NOT NULL,
    kode_rg character varying(25) NOT NULL,
    CONSTRAINT jadwa_kuliah_pkey PRIMARY KEY (kode_mk, jenis_kelas),
    CONSTRAINT jadwa_kuliah_kode_rg_fkey FOREIGN KEY (kode_rg)
        REFERENCES public.ruangan (kode_rg) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT jadwa_kuliah_kode_mk_fkey FOREIGN KEY (kode_mk)
        REFERENCES public.mata_kuliah (kode_mk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
```

5️⃣ Tabel Mata Kuliah
<div align="justify">
Tabel ini menyimpan data kode mata kuliah, nama mata kuliah, dan semester mata kuliah. Tabel ini bertujuan untuk memberikan informasi mata kuliah yang nantinya akan dihubungkan dengan tabel jadwal kuliah.
</div>


| Attribute     | Type                  | Description                     |
|:--------------|:----------------------|:--------------------------------|
| kode_mk       | character varying(10) | Kode Mata Kuliah                |
| nama_mk       | text                  | Nama Matakuliah                 |
| semester      | integer               | Semester                        |
| kode_prodi    | character varying(25) | Kode Program Studi              |

| Primary Key     | Foreign Key        | 
|:----------------|:-------------------|
| Kode Matakuliah | Kode Program Studi |



```sql
CREATE TABLE public.mata_kuliah
(
    kode_mk character varying(10) NOT NULL,
    nama_mk text NOT NULL,
    semester integer NOT NULL,
    kode_prodi character varying(25) NOT NULL,
    CONSTRAINT mata_kuliah_pkey PRIMARY KEY (kode_mk),
    CONSTRAINT mata_kuliah_kode_prodi_fkey FOREIGN KEY (kode_prodi)
      REFERENCES public.prodi (kode_prodi) MATCH SIMPLE
      ON UPDATE NO ACTION
      ON DELETE NO ACTION
      NOT VALID
);
```
### :open_file_folder: Struktur Folder

```
.
├── app           # ShinyApps
│   ├── css
│   │   ├── **/*.css
│   ├── server.R
│   └── ui.R
├── data 
│   ├── xlsx
│   └── sql
|       └── db.sql
├── src           # Project source code
├── doc           # Doc for the project
├── .gitignore
├── LICENSE
└── README.md
```


## :fireworks: Anggota Tim Pengembang
1. Merryanty Lestari P (G1501221022) : Data Manager
2. Ahmad Syauqi        (G1501221019) : Shiny Developer (back-end)
3. Yully Sofyah Waode  (G1501222056) : Shiny Developer (front-end)
4. Nadira Nisa Alwani  (G1501222048) : Technical Writer

