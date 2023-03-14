<div align="center">

![Logo IPB](https://user-images.githubusercontent.com/111562803/224660545-5b54692d-4e5f-4827-9aa6-85d4eeb83fd3.png)

# Data Base Ruangan IPB

• [Tentang Data Base Ruangan IPB](#scroll-Tentang-Data-Base-Ruangan-IPB)
• [Screenshot](#📸-screenshot)
• [Demo](#🎥-Demo)
• [Dokumentasi](#blue_book-documentation)

</div>

## :bookmark_tabs: Main Menu

- [Tentang Data Base Ruangan IPB](#📈-Tentang-Data-Base-Ruangan-IPB)
- [Screenshot](#📸_scene-Screenshot)
- [Demo](#📹-Demo)
- [Dokumentasi](#blue_book-documentation)
- [Requirements](#❗-Requirements)
- [Skema Database](#💻-Skema-Database)
- [Entity Relationship Diagram](#📝-Entity-Relationship-Diagram)
- [Deskripsi Data](#🔎-Deskripsi-Data)
- [Struktur Folder](#open_file_folder-Stuktur-Folder)
- [Anggota Tim Pengembang](#🎇-Anggota-Tim-Pengembang)


## 📈 Tentang Data Base Ruangan IPB 
Deskripsi Database Ruangan IPB

<div align="justify">
Database ini bertujuan untuk memudahkan mahasiswa dalam mencari ruangan belajar sesuai dengan jadwal dan mata kuliah yang telah ada. Informasi yang diberikan berupa jadwal kuliah, mata kuliah, posisi lokasi ruangan dan fakultas. Database terdiri dari beberapa tabel yaitu Tabel Fakultas, Ruangan, Jadwal Kuliah, dan Mata Kuliah.

</div>

#📸 Screenshot
<div align="justify">
R-Shiny pada dasarnya merupakan sebuah framework (kerangka kerja) yang ditawarkan oleh RStudio. Dengan menggunakan R-Shiny dapat membuat laporan dan visualisasi data yang efektif sehingga eksplorasi data pun lebih mudah. Selain itu, RStudio juga menyediakan elemen Shiny yang memungkinkan Anda menggunakan elemen HTML untuk mendesain konten yang ada dalam aplikasi.

 
Untuk mengaplikasikan R-Shinny dapat juga digunakan pada sistem manajemen database Ruang di IPB, yang bertujuan untuk menampilkan serta memberikan informasi mengenai ruangan belajar.
</div>

1️⃣ Summary Database

Menampilkan tampilan awal pada Rshinny Database.

<img width="960" alt="Tampilan Sebaran Prodi" src="https://user-images.githubusercontent.com/111562803/224901355-39a88ead-1015-4154-add5-ff28715bc83b.png">
<img width="960" alt="tampilan sebaran ruangan" src="https://user-images.githubusercontent.com/111562803/224901475-e2613290-c08f-4c53-81bc-96ddd4f4bb6d.png">
<img width="960" alt="tampilan sebaran kuliah per hari" src="https://user-images.githubusercontent.com/111562803/224901604-63c9ed08-b10d-46a3-abf6-ce01a7d7c593.png">
<img width="953" alt="tampilan jumlah matkul" src="https://user-images.githubusercontent.com/111562803/224901515-23347b2f-033b-4c0d-a0a0-2fd265af8804.png">


2️⃣ Fakultas

Menampilkan informasi daftar fakultas apa saja yang tersedia.

<img width="959" alt="Tampilan Daftar Fakultas" src="https://user-images.githubusercontent.com/111562803/224893596-e96b1a11-c462-467c-9c80-59e6a3dfc95c.png">


3️⃣ Program Studi

Menampilkan informasi daftar program studi apa saja yang tersedia.

<img width="957" alt="daftar prodi" src="https://user-images.githubusercontent.com/111562803/224901895-97ffcd89-f5fd-4dc6-b50a-79b721d2df0d.png">



4️⃣ Ruangan

Menampilkan informasi tentang ruangan apa saja yang tersedia.

<img width="960" alt="daftar ruangan" src="https://user-images.githubusercontent.com/111562803/224901973-90846704-0da8-43ce-95cb-34f4b2d61a8d.png">



5️⃣ Jadwal Kuliah

Menampilkan informasi jadwal kuliah apa saja yang tersedia.

<img width="958" alt="jadwal kuliah" src="https://user-images.githubusercontent.com/111562803/224902031-33e6f031-88e0-46f4-853c-a3a93dd29975.png">



6️⃣ Mata Kuliah

Menampilkan informasi mata kuliah apa saja yang tersedia.

<img width="960" alt="daftar matkul" src="https://user-images.githubusercontent.com/111562803/224902098-394fae8e-26be-4c75-af6d-27a0a66e19df.png">



## 📹 Demo
| url                      | login          |
| ------------------------ | -------------- |
|[ https://merryanty.shinyapps.io/Ruangan-IPB/ ](https://merryanty.shinyapps.io/Ruangan-IPB/)| merryantylestari9@gmail.com |



## :blue_book: Dokumentasi 

1️⃣ Contoh Mencari Ruang Kelas

Menampilkan contoh pencarian ruang kelas STA1541 maka akan muncul nama mata kuliah, jam, hari, serta lokasi ruangan tersebut.

<img width="960" alt="contoh" src="https://user-images.githubusercontent.com/111562803/224902166-a892125e-1668-4f9f-a29e-75b272066b71.png">


## ❗ Requirements

- Paket R yang digunakan:

library(shiny)

library(shinydashboard)

library(DT)

library(RPostgreSQL)

library(DBI)

library(bslib)

library(gridlayout)

library(plotly)

- RDBMS yang digunakan adalah PostgreSQL 15
- Front End menggunakan RShiny UI
- Back End menggunakan RShiny Server

## 💻 Skema Database
<img width="242" alt="skema update" src="https://user-images.githubusercontent.com/111562803/223139863-0f7b7950-6586-49aa-9e6c-5c756d2a0375.png">

## 📝 Entity Relationship Diagram
![ERD terbaru](https://user-images.githubusercontent.com/111562803/224460185-a02c22fb-ff99-4d24-beb9-61a97790e629.jpeg)

## 🔎 Deskripsi Data
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


## 🎇 Anggota Tim Pengembang
1. Merryanty Lestari P (G1501221022) : Data Manager
2. Ahmad Syauqi        (G1501221019) : Shiny Developer (back-end)
3. Yully Sofyah Waode  (G1501222056) : Shiny Developer (front-end)
4. Nadira Nisa Alwani  (G1501222048) : Technical Writer

