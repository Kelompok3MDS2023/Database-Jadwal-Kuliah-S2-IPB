# Data-Base-Ruangan-IPB
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
![ERD-Ruangan-IPB-update](https://user-images.githubusercontent.com/111562803/223121412-cc786b72-c04d-4803-864e-46770991e971.png)

## Sintax Rancangan Database

Tabel Fakultas

Tabel ini akan menyimpan data kode fakultas, nama fakultas, dan jumlah prodi yang nantinya akan dihubungan dengan tabel ruangan untuk mengetahui lokasi ruangan berdasarkan fakultas.

Primary Key: Kode Fakultas

Foreign Key: Kode Fakultas

```sql
CREATE TABLE IF NOT EXISTS public.fakultas (
    Kode_Fk character varying(2) NOT NULL,
    Nm_Fk text NOT NULL,
    Jml_Prodi integer NOT NULL,
    PRIMARY KEY (Kode_Fk)
);
```

Tabel Ruangan

Tabel ini menyimpan data kode ruangan, nama ruangan, lokasi, kapasitas ruangan, dan kode fakultas. Tabel ini bertujuan untuk mengetahui lokasi suatu ruangan di IPB yang dicari berdasarkan jadwal kuliah dan kode ruangan.

Primary Key: Kode Ruangan

```sql
CREATE TABLE IF NOT EXISTS public.ruangan (
    Kode_RG character varying(25) NOT NULL,
    Nm_RG text NOT NULL,
    Lokasi text NOT NULL,
    Kapasitas integer NOT NULL,
    Kode_Fk character varying(2) NOT NULL,
    PRIMARY KEY (Kode_RG)
);
```

Tabel Jadwal Kuliah

Tabel ini menyimpan data kode mata kuliah, jadwal, kode ruangan, dan peserta. Tabel ini bertujuan untuk memberikan informasi jadwal kuliah beserta lokasi dan fakultas ruangan sehingga memudahkan mahasiswa dalam mencari ruangan belajar.

Primary Key: Kode Matakuliah

Foreign Key: Kode Ruangan

```sql
CREATE TABLE IF NOT EXISTS public.Jadwal_Kuliah (
    Kode_MK character varying(10) NOT NULL,
    Jadwal text NOT NULL,
    Peserta text NOT NULL,
    Kode_RG character varying(25) NOT NULL,
    PRIMARY KEY (Kode_MK)
);
```

Tabel Mata Kuliah

Tabel ini menyimpan data kode mata kuliah, nama mata kuliah, dan semester mata kuliah. Tabel ini bertujuan untuk memberikan informasi mata kuliah yang nantinya akan dihubungkan dengan tabel jadwal kuliah.

Primary Key: Kode Mata Kuliah

Foreign Key: Kode Mata Kuliah

```sql
CREATE TABLE IF NOT EXISTS public.Mata_Kuliah (
    Kode_MK character varying(10) NOT NULL,
    Nm_MK text NOT NULL,
    Semester integer NOT NULL,
    PRIMARY KEY (Kode_MK)
);
```

Ruangan di Fakultas

Tabel ini merupakan tabel pivot yang menghubungkan Tabel Fakultas dan Tabel Ruangan dengan relation many-to-many. Satu Fakultas dapat berisi banyak ruangan, dan satu ruangan dapat digunakan oleh banyak Fakultas. Tabel ini bertujuan untuk mengetahui suatu ruangan terdapat pada Fakultas tertentu.

```sql
CREATE TABLE IF NOT EXISTS public.ruangan_di_fakultas(
    Kode_Fk character varying(2) COLLATE pg_catalog."default" NOT NULL,
    Kode_RG character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ruangan_di_fakultas_pkey PRIMARY KEY (Kode_Fk , Kode_RG),
    CONSTRAINT ruangan_di_fakultas_Kode_Fk_fkey FOREIGN KEY (Kode_Fk)
        REFERENCES public.fakultas (Kode_Fk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ruangan_di_fakultas_Kode_RG_fkey FOREIGN KEY (Kode_RG)
        REFERENCES public.ruangan (Kode_RG) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

Ruangan_Mk

Tabel ini merupakan tabel pivot yang menghubungkan Tabel Ruangan dan Tabel Jadwal Kuliah dengan relation one-to-one. Satu ruangan pada waktu tertentu hanya dapat digunakan oleh satu jadwal kuliah. Tabel ini bertujuan untuk mengetahui lokasi ruangan belajar berdasarkan jadwal kuliah.

```sql
CREATE TABLE IF NOT EXISTS public.ruangan_mk(
    Kode_RG character varying(25) COLLATE pg_catalog."default" NOT NULL,
    Kode_MK character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ruangan_mk_pkey PRIMARY KEY (Kode_RG,Kode_MK),
    CONSTRAINT ruangan_mk_fkey FOREIGN KEY (Kode_RG)
        REFERENCES public.ruangan (Kode_RG) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ruangan_mk_kode_MK_fkey FOREIGN KEY (Kode_MK)
        REFERENCES public.Jadwal_Kuliah (Kode_MK) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

Jadwal_untuk_MK

Tabel ini merupakan tabel pivot yang menghubungkan Tabel Jadwal Kuliah dan Mata Kuliah dengan relation one-to-many. Jadwal kuliah dapat terdiri dari beberapa mata kuliah, dan satu mata kuliah hanya memiliki satu jadwal kuliah. Tabel ini bertujuan untuk memberikan informasi jadwal kuliah berdasarkan mata kuliah.

```sql
CREATE TABLE IF NOT EXISTS public.Jadwal_untuk_MK(
    Kode_MK character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT Jadwal_untuk_MK_pkey PRIMARY KEY (Kode_MK),
    CONSTRAINT Jadwal_untuk_MK_fkey FOREIGN KEY (Kode_MK)
        REFERENCES public.Jadwal_Kuliah (Kode_MK) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT Jadwal_untuk_MK_kode_MK_fkey FOREIGN KEY (Kode_MK)
        REFERENCES public.Mata_Kuliah (Kode_MK) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```
