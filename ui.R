library(shiny)
library(shinydashboard)
library(RPostgreSQL)
library(DBI)
library(ggplot2)
library(gridlayout)
library(plotly)
library(DT)

DB <- connectDB()
namaFak <- dbGetQuery(DB,"select nama_fk from fakultas;")
listFak <- namaFak$nama_fk

namaProdi <- dbGetQuery(DB,"select nama_prodi from prodi;")
listProdi <- namaProdi$nama_prodi

namaMatkul <- dbGetQuery(DB,"select kode_mk from mata_kuliah;")
listMatkul <- namaMatkul$kode_mk

navbarPage(
  title = "Database Ruangan IPB",
  selected = "Summary Database",
  collapsible = TRUE,
  theme = bslib::bs_theme(),
  
  tabPanel(
    title = "Summary Database",
    grid_container(
      layout = c(
        "area0 area0",
        "area1 area1",
        "area2 area2",
        "area3 area3",
        "area4 area4",
        "area6 area6",
        "area5 area5",
        "area7 area7"
      ),
      row_sizes = c(
        "1.14fr",
        "0.76fr",
        "1.11fr",
        "0.8fr",
        "1.15fr",
        "0.84fr",
        "1.24fr",
        "0.96fr"
      ),
      col_sizes = c(
        "1.03fr",
        "0.97fr"
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
      ),
      grid_card_text(
        content = "Jumlah Ruangan Per Fakultas",
        alignment = "center",
        area = "area2"
      ),
      grid_card(
        area = "area3",
        plotlyOutput(
          outputId = "RuanganPerFak",
          width = "100%",
          height = "400px"
        )
      ),
      grid_card_text(
        content = "Jumlah Jadwal Kuliah Per Hari",
        alignment = "center",
        area = "area4"
      ),
      grid_card_text(
        content = "Jumlah Mata Kuliah Per Program Studi",
        alignment = "center",
        area = "area5"
      ),
      grid_card(
        area = "area6",
        plotlyOutput(
          outputId = "RuanganPerHari",
          width = "100%",
          height = "400px"
        )
      ),
      grid_card(
        area = "area7",
        plotlyOutput(
          outputId = "MatkulPerProdi",
          width = "100%",
          height = "400px"
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
        content = "Daftar Program Studi",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.45fr",
            "1.55fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card(
            area = "area0",
            selectInput(
              inputId = "listFak_prodi",
              label = "Fakultas",
              choices = listFak
            )
          ),
          grid_card(
            area = "area1",
            dataTableOutput(outputId = "tblProdi", width = "100%")
          )
        )
      )
    )
  ),
  tabPanel(
    title = "Ruangan",
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
        content = "Daftar Ruangan",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.45fr",
            "1.55fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card(
            area = "area0",
            selectInput(
              inputId = "listFak_ruang",
              label = "Gedung",
              choices = listFak
            )
          ),
          grid_card(
            area = "area1",
            dataTableOutput(outputId = "tblRuangan", width = "100%")
          )
        )
      )
    )
  ),
  tabPanel(
    title = "Jadwal Kuliah",
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
        content = "Jadwal Kuliah",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.44fr",
            "1.56fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card(
            area = "area0",
            selectInput(
              inputId = "listProdi_Jadwal",
              label = "Program Studi",
              choices = listProdi
            )
          ),
          
          grid_card(
            area = "area1",
            dataTableOutput(outputId = "tblJadwal", width = "100%")
          )
        )
      )
    )
  ),
  tabPanel(
    title = "Mata Kuliah",
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
        content = "Daftar Mata Kuliah",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.46fr",
            "1.54fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card(
            area = "area0",
            selectInput(
              inputId = "listProdi_matkul",
              label = "Program Studi",
              choices = listProdi
            )
          ),
          grid_card(
            area = "area1",
            dataTableOutput(outputId = "tblMatkul", width = "100%")
          )
        )
      )
    )
  ),
  tabPanel(
    title = "Cari Kelas",
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
        content = "Mencari Lokasi Kelas",
        alignment = "center",
        area = "area0"
      ),
      grid_card(
        area = "area1",
        grid_container(
          layout = c(
            "area0 area0",
            "area1 area1"
          ),
          row_sizes = c(
            "0.46fr",
            "1.54fr"
          ),
          col_sizes = c(
            "1fr",
            "1fr"
          ),
          gap_size = "10px",
          grid_card(
            area = "area0",
            selectInput(
              inputId = "listMatkul",
              label = "Mata Kuliah",
              choices = listMatkul
            )
          ),
          grid_card(
            area = "area1",
            dataTableOutput(outputId = "tblKelas", width = "100%")
          )
        )
      )
    )
  )
  
)
