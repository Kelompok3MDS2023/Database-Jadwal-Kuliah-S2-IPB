# Data Base Ruangan IPB 
Deskripsi Database Ruangan IPB

Database ini bertujuan untuk memudahkan mahasiswa dalam mencari ruangan belajar sesuai dengan jadwal dan mata kuliah yang telah ada. Informasi yang diberikan berupa jadwal kuliah, mata kuliah, posisi lokasi ruangan dan fakultas. Database terdiri dari beberapa tabel yaitu Tabel Fakultas, Ruangan, Jadwal Kuliah, dan Mata Kuliah.


## Anggota Kelompok

1. Merryanty Lestari P (G1501221022) : Data Manager
2. Ahmad Syauqi        (G1501221019) : Shiny Developer (back-end)
3. Yully Sofyah Waode  (G1501222056) : Shiny Developer (front-end)
4. Nadira Nisa Alwani  (G1501222048) : Technical Writer


## Skema
<img width="242" alt="skema update" src="https://user-images.githubusercontent.com/111562803/223139863-0f7b7950-6586-49aa-9e6c-5c756d2a0375.png">

## Entity-Relationship Diagram
![ERD terbaru](https://user-images.githubusercontent.com/111562803/224460185-a02c22fb-ff99-4d24-beb9-61a97790e629.jpeg)

## Sintax Rancangan Database

Tabel Fakultas

Tabel ini akan menyimpan data kode fakultas, nama fakultas, dan jumlah prodi yang nantinya akan dihubungan dengan tabel ruangan untuk mengetahui lokasi ruangan berdasarkan fakultas.

Primary Key: Kode Fakultas

```sql
CREATE TABLE public.fakultas
(
    kode_fk character varying(2) NOT NULL,
    nama_fk text NOT NULL,
    jmlh_prodi integer NOT NULL,
    CONSTRAINT fakultas_pkey PRIMARY KEY (kode_fk)
);

```

Tabel Ruangan

Tabel ini menyimpan data kode ruangan, nama ruangan, lokasi, kapasitas ruangan, dan kode fakultas. Tabel ini bertujuan untuk mengetahui lokasi suatu ruangan di IPB yang dicari berdasarkan jadwal kuliah dan kode ruangan.

Primary Key: Kode Ruangan

Foreign Key: Kode Fakultas

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
Tabel Prodi

Tabel ini menyimpan data kode Program Studi, nama prodi dan kode fakultas. Tabel ini bertujuan untuk memberikan informasi prodi apa saja yang nantinya akan dihubungkan dengan tabel fakultas. 

Primary Key: Kode Program Studi

Foreign Key: Kode Fakultas

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

Tabel Jadwal Kuliah

Tabel ini menyimpan data kode mata kuliah, jenis kelas, hari, jam, dan kode ruangan. Tabel ini bertujuan untuk memberikan informasi jadwal kuliah beserta lokasi dan fakultas ruangan sehingga memudahkan mahasiswa dalam mencari ruangan belajar.

Primary Key: Kode Matakuliah dan Jenis kelas

Foreign Key: Kode Ruangan dan kode Matakuliah 

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

Tabel Mata Kuliah

Tabel ini menyimpan data kode mata kuliah, nama mata kuliah, dan semester mata kuliah. Tabel ini bertujuan untuk memberikan informasi mata kuliah yang nantinya akan dihubungkan dengan tabel jadwal kuliah.

Primary Key: Kode Mata Kuliah

Foreign Key: Kode Program Studi

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
