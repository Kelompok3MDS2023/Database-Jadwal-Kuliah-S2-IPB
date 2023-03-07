library(shiny)
library(shinydashboard)
library(DT)
library(RPostgreSQL)
library(DBI)

dashboardPage(
  title = "Database Ruangan IPB",
  dashboardHeader(
    title = "Database Ruangan IPB"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "Fakultas",
        tabName = "tab_aga5pjwc1c",
        icon = icon("school")
      ),
      menuItem(
        text = "Program Studi",
        tabName = "tab_ahii87bqpu",
        icon = icon("graduation-cap")
      ),
      menuItem(
        text = "Ruangan",
        tabName = "tab_pet5t4eg0l",
        icon = icon("house")
      ),
      menuItem(
        text = "Jadwal Kuliah",
        tabName = "tab_4pt74yw4gi",
        icon = icon("clock")
      ),
      menuItem(
        text = "Mata Kuliah",
        tabName = "tab_mbrxn71tai",
        icon = icon("book")
      ),
      menuItem(
        text = "Pencarian Ruangan",
        tabName = "tab_idv81nu8ip",
        icon = icon("searchengin")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
      tabName = "tab_aga5pjwc1c",
      h2(
        "Daftar Fakultas"
      ),
      dataTableOutput(
        outputId = "tblFak"
      )
    ),
    tabItem(
      tabName = "tab_ahii87bqpu",
      h2(
        "Daftar Program Studi"
      ),
      dataTableOutput(
        outputId = "tblProdi"
      )
    ),
    tabItem(
      tabName = "tab_pet5t4eg0l",
      h2(
        "Daftar Ruangan"
      ),
      selectInput(
        inputId = "listFak",
        label = "Fakultas",
        choices = c(
          "FAPERTA" = "a",
          "SKHB"="b",
          "FPIK"="c",
          "FAPET"="d",
          "FAHUTAN"="e",
          "FATETA"="f",
          "FMIPA"="g",
          "FEM"="h",
          "FEMA"="i",
          "Ruang Lain"="l"
        )
      ),
      dataTableOutput(
        outputId = "tblRuangan"
      )
    ),
    tabItem(
      tabName = "tab_4pt74yw4gi",
      h2(
        "Jadwal Kuliah"
      ),
      selectInput(
        inputId = "listProdi_Jadwal",
        label = "Program Studi",
        choices = c(
          "AGH","ITB","PBT","PWL","TNH","TEK","THP","TPL","ITP","IPH","TPP","BOT","KLI","STK","MAN","KMP"
        )
      ),
      dataTableOutput(
        outputId = "tblJadwal"
      )
    ),
    tabItem(
      tabName = "tab_mbrxn71tai",
      h2(
        "Daftar Mata Kuliah"
      ),
      selectInput(
        inputId = "listProdi_matkul",
        label = "Program Studi",
        choices = c(
          "AGH","ITB","PBT","PWL","TNH","TEK","THP","TPL","ITP","IPH","TPP","BOT","KLI","STK","MAN","KMP"
        )
      ),
      dataTableOutput(
        outputId = "tblMatkul"
      )
    ),
    tabItem(
      tabName = "tab_idv81nu8ip",
      h2(
        "Daftar Ruangan Berdasarkan Mata Kuliah"
      ),
      fluidRow(
        column(
          width = 6,
          selectInput(
            inputId = "listProdi_search",
            label = "Program Studi",
            choices = c(
              "AGH","ITB","PBT","PWL","TNH","TEK","THP","TPL","ITP","IPH","TPP","BOT","KLI","STK","MAN","KMP"
            )
          )
        ),
        column(
          width = 6,
          selectInput(
            inputId = "listMatkul",
            label = "Mata Kuliah",
            choices = NULL
          )
        )
      ),
      dataTableOutput(
        outputId = "tblRuanganMatkul"
      )
    )
    )
  )
)