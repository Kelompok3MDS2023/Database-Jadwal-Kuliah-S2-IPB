library(shiny)
library(shinydashboard)
library(DT)
library(RPostgreSQL)
library(DBI)
library(bslib)
library(gridlayout)
library(plotly)

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
namaFak <- dbGetQuery(DB,"select nama_fk from fakultas;")
listFak <- namaFak$nama_fk

namaProdi <- dbGetQuery(DB,"select nama_prodi from prodi;")
listProdi <- namaProdi$nama_prodi

namaMatkul <- dbGetQuery(DB,"select kode_mk from mata_kuliah;")
listMatkul <- namaMatkul$kode_mk

navbarPage(
  title = "Database Jadwal Kuliah S2 IPB",
  selected = "Summary Database",
  collapsible = TRUE,
  theme = bslib::bs_theme(version = 5, bootswatch = "minty"),
  
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
        selectInput(
          inputId = "listFak_prodi",
          label = "Fakultas",
          choices = listFak
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
        selectInput(
          inputId = "listFak_ruang",
          label = "Gedung",
          choices = listFak
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
        selectInput(
          inputId = "listProdi_Jadwal",
          label = "Program Studi",
          choices = listProdi
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
        selectInput(
          inputId = "listProdi_matkul",
          label = "Program Studi",
          choices = listProdi
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
        selectInput(
          inputId = "listMatkul",
          label = "Mata Kuliah",
          choices = listMatkul
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
