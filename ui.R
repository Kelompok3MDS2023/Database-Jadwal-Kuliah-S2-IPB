library(shiny)
library(shinydashboard)
library(DT)
library(RPostgreSQL)
library(DBI)
library(bslib)
library(gridlayout)
library(plotly)
library(tidyverse)
library(shinythemes)

# Local database
# connectDB <- function(){
#   driver <- dbDriver('PostgreSQL')
# 
#   DB <- dbConnect(
#     driver,
#     dbname="ruangan-IPB",
#     host="localhost",
#     port=5432,
#     user="postgres",
#     password="root"
#   )
# }


#1. set connection to ElephantSQL server database
connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  DB <- dbConnect(
    driver,
    dbname="srsttvfb", # User & Default database
    host="topsy.db.elephantsql.com", # Server
    # port=5433,
    user="srsttvfb", # User & Default database
    password="TLaAq8YtYIw6OXrnpcJRERsgE6MspeOn" # Password
  )
}

DB <- connectDB()
namaFak <- dbGetQuery(DB,"select nama_fk from fakultas where jmlh_prodi>0;")
listFak <- namaFak$nama_fk

namaFak2 <- dbGetQuery(DB,"select nama_fk from fakultas;")
listFak2 <- namaFak2$nama_fk

namaProdi <- dbGetQuery(DB,"select concat(kode_prodi,' - ', nama_prodi) as nama_prodi,
                        nama_fk 
                        from 
                        prodi as pr,
                        fakultas as f
                        
                        WHERE 
                        pr.kode_fk=f.kode_fk
                        ;")
listProdi <- namaProdi$nama_prodi

namaMatkul <- dbGetQuery(DB,"select concat(kode_mk,' - ',nama_mk) as kode_mk, 
nama_prodi 
from mata_kuliah as mk,prodi as pr
where mk.kode_prodi=pr.kode_prodi;")

listMatkul <- namaMatkul$kode_mk
dbDisconnect(DB)

navbarPage(
  title = "Database Jadwal Kuliah S2 IPB",
  selected = "About",
  collapsible = TRUE,
  theme = shinytheme("flatly"),
  tabPanel(
    title = "About",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area1",
        "area2 area2"
      ),
      row_sizes = c(
        "0.51fr",
        "1.25fr",
        "1.24fr"
      ),
      col_sizes = c(
        "1fr",
        "1fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Tentang Database Jadwal Kuliah S2 IPB",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_header(strong("Deskripsi")),
        card_body_fill(
          "Database ini bertujuan untuk mempermudah mahasiswa S2 IPB University dalam mengetahui daftar fakultas, program studi, mata kuliah dan jadwal kuliah beserta lokasi ruangan kelas yang tersedia di Pascasarjana IPB.
          Mata kuliah yang ditampilkan pada database ini hanya mata kuliah pada semester genap tahun akademik 2022/2023."
        )
      ),
      grid_card(
        area = "area2",
        card_header(strong("Anggota Tim Pengembang")),
        card_body_fill(
          span("1. Merryanty Lestari P (G1501221022) : Data Manager"),
          span("2. Ahmad Syauqi (G1501221019) : Project Leader & Shiny Developer (back-end)"),
          span("3. Yully Sofyah Waode (G1501222056) : Shiny Developer (front-end)"),
          span("4. Nadira Nisa Alwani (G1501222048) : Technical Writer")
        )
      )
    )
  ),
  tabPanel(
    title = "Summary Database",
    tabsetPanel(
      tabPanel(
        title = "Sebaran Program Studi S2",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.27fr",
            "1.73fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card_text(
            content = "Jumlah Program Studi Per Fakultas",
            alignment = "center",
            area = "area0"
          ),
          grid_card(
            area = "area1",
            plotlyOutput(
              outputId = "ProdiPerFak",
              width = "100%",
              height = "400px"
            )
          )
        )
      ),
      tabPanel(
        title = "Sebaran Ruangan",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.27fr",
            "1.73fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card_text(
            content = "Jumlah Ruangan Per Fakultas",
            alignment = "center",
            area = "area0"
          ),
          grid_card(
            area = "area1",
            plotlyOutput(
              outputId = "RuanganPerFak",
              width = "100%",
              height = "400px"
            )
          )
        )
      ),
      tabPanel(
        title = "Sebaran Jadwal",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.27fr",
            "1.73fr"
          ),
          col_sizes = c(
            "0.99fr",
            "1.01fr"
          ),
          gap_size = "10px",
          grid_card_text(
            content = "Sebaran Jadwal Kuliah Per Hari",
            alignment = "center",
            area = "area0"
          ),
          grid_card(
            area = "area1",
            plotlyOutput(
              outputId = "RuanganPerHari",
              width = "100%",
              height = "400px"
            )
          )
        )
      ),
      tabPanel(
        title = "Jumlah Mata Kuliah",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.28fr",
            "1.72fr"
          ),
          col_sizes = c(
            "0.98fr",
            "1.02fr"
          ),
          gap_size = "10px",
          grid_card_text(
            content = "Jumlah Mata Kuliah Per Program Studi",
            alignment = "center",
            area = "area0"
          ),
          grid_card(
            area = "area1",
            plotlyOutput(
              outputId = "MatkulPerProdi",
              width = "100%",
              height = "400px"
            )
          )
        )
      )
    )
  ),
  
  tabPanel(
    title = "Fakultas",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area1"
      ),
      row_sizes = c(
        "0.27fr",
        "1.73fr"
      ),
      col_sizes = c(
        "1fr",
        "1fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Daftar Fakultas",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        dataTableOutput(outputId = "tblFak", width = "100%")
      )
    )
  ),
  tabPanel(
    title = "Program Studi",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area2"
      ),
      row_sizes = c(
        "0.27fr",
        "1.73fr"
      ),
      col_sizes = c(
        "0.42fr",
        "1.58fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Daftar Program Studi",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_body_fill(
          selectInput(
          inputId = "listFak_prodi",
          label = "Fakultas",
          choices = listFak
        )
        )
        
      ),
      grid_card(
        area = "area2",
        dataTableOutput(outputId = "tblProdi", width = "100%")
      )
    )
  ),
  tabPanel(
    title = "Ruangan",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area2"
      ),
      row_sizes = c(
        "0.27fr",
        "1.73fr"
      ),
      col_sizes = c(
        "0.42fr",
        "1.58fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Daftar Ruangan",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_body_fill(
          selectInput(
          inputId = "listFak_ruang",
          label = "Gedung",
          choices = listFak2
        )
        )
        
      ),
      grid_card(
        area = "area2",
        dataTableOutput(outputId = "tblRuangan", width = "100%")
      )
    )
  ),
  tabPanel(
    title = "Jadwal Kuliah",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area2"
      ),
      row_sizes = c(
        "0.27fr",
        "1.73fr"
      ),
      col_sizes = c(
        "0.42fr",
        "1.58fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Jadwal Kuliah",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_body_fill(
          selectInput(
          inputId = "listFak_Jadwal",
          label = "Fakultas",
          choices = listFak
        ),
        selectInput(
          inputId = "listProdi_Jadwal",
          label = "Program Studi",
          choices = listProdi
        )
        )
        
      ),
      grid_card(
        area = "area2",
        dataTableOutput(outputId = "tblJadwal", width = "100%")
      )
    )
  ),
  tabPanel(
    title = "Mata Kuliah",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area2"
      ),
      row_sizes = c(
        "0.27fr",
        "1.73fr"
      ),
      col_sizes = c(
        "0.42fr",
        "1.58fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Daftar Mata Kuliah",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_body_fill(
          selectInput(
            inputId = "listFak_matkul",
            label = "Fakultas",
            choices = listFak
          ),
          selectInput(
          inputId = "listProdi_matkul",
          label = "Program Studi",
          choices = listProdi
        )
        )
        
      ),
      grid_card(
        area = "area2",
        dataTableOutput(outputId = "tblMatkul", width = "100%")
      )
    )
  ),
  tabPanel(
    title = "Cari Kelas",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area3",
        "area1 area3"
      ),
      row_sizes = c(
        "0.37fr",
        "1.32fr",
        "1.31fr"
      ),
      col_sizes = c(
        "0.42fr",
        "1.58fr"
      ),
      gap_size = "10px",
      grid_card_text(
        content = "Mencari Lokasi Kelas",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        card_body_fill(
          selectInput(
            inputId = "listFak_Kelas",
            label = "Fakultas",
            choices = listFak
          ),
          selectInput(
            inputId = "listProdi_Kelas",
            label = "Program Studi",
            choices = listProdi
          ),
          selectInput(
          inputId = "listMatkul",
          label = "Mata Kuliah",
          choices = listMatkul
        )
        )
        
      ),
      grid_card(
        area = "area3",
        dataTableOutput(
          outputId = "tblKelas",
          width = "100%"
        )
      )
    )
  )
  
)
