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


function(input, output) {
  #TAB FAKULTAS
  output$tblFak <- renderDataTable({
    DB <- connectDB()
    q <- "SELECT 
      kode_fk as Kode_Fakultas,
      nama_fk as Nama_Fakultas,
      jmlh_prodi as Jumlah_Prodi 
      
      FROM fakultas
      WHERE jmlh_prodi > 0;"
    output_fak <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_fak
  },options = list(pageLength = 15))
  
  #TAB PRODI
  output$tblProdi <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_prodi,
                nama_prodi as nama_Program_Studi,
                singkatan
                
                FROM 
                prodi as P,
                fakultas as F 
                
                WHERE P.kode_fk=F.kode_fk 
                AND nama_fk='", input$listFak_prodi,"';")
    output_prodi <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_prodi
  })
  
  #TAB RUANGAN
  output$tblRuangan <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_rg as kode_ruangan,
                nama_rg as Nama_Ruangan, 
                lokasi, 
                kapasitas as kapasitas_ruangan 
                
                FROM 
                ruangan as R,
                fakultas as F 
                
                WHERE R.kode_fk=F.kode_fk 
                AND nama_fk='", input$listFak_ruang,"';")
    output_rg <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_rg
  },options = list(pageLength = 15))
  
  #TAB JADWAL
  output$tblJadwal <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                JK.kode_mk as kode_matkul, 
                nama_mk as Nama_mata_kuliah, 
                semester as smt,
                jenis_kelas,
                hari,
                jam,
                nama_rg as Nama_Ruangan, 
                lokasi
                
                FROM 
                mata_kuliah as MK, 
                jadwal_kuliah as JK, 
                ruangan as R, 
				        prodi as Pr
                
                WHERE 
                JK.kode_mk=MK.kode_mk 
                AND JK.kode_rg=R.kode_rg 
				AND Pr.kode_prodi=MK.kode_prodi
                AND nama_prodi='", substr(input$listProdi_Jadwal,8,100),"';")
    output_jadwal <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_jadwal
  },options = list(pageLength = 15))
  
  #TAB MATKUL
  output$tblMatkul <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_mk, 
                nama_mk as Nama_mata_kuliah, 
                semester 
                
                FROM mata_kuliah as mk,prodi as pr
                WHERE mk.kode_prodi =pr.kode_prodi
				AND nama_prodi='", substr(input$listProdi_matkul,8,100),"';")
    output_mk <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_mk
  },options = list(pageLength = 15))
  
  #Tab Cari Kelas
  output$tblKelas <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                JK.kode_mk as kode_matkul, 
                nama_mk as Nama_mata_kuliah, 
                jenis_kelas,
                hari,
                jam,
                nama_rg as Nama_Ruangan, 
                lokasi
                
                FROM 
                mata_kuliah as MK, 
                jadwal_kuliah as JK, 
                ruangan as R, 
				        prodi as Pr
                
                WHERE 
                JK.kode_mk=MK.kode_mk 
                AND JK.kode_rg=R.kode_rg 
				AND Pr.kode_prodi=MK.kode_prodi
                AND mk.kode_mk='", substr(input$listMatkul,1,7),"';")
    output_mk <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_mk
  })
  
  output$RuanganPerFak <- renderPlotly({
    DB <- connectDB()
    ruangFak <- dbGetQuery(DB,"select f.kode_fk,f.nama_fk,COUNT(*) as Jumlah_ruangan
from ruangan as r,fakultas as f
where r.kode_fk=f.kode_fk
group by f.nama_fk,f.kode_fk
order by f.kode_fk;")
    xprodiFak <- list(categoryorder = "array",
                      categoryarray = ruangFak$nama_fk)
    plotruangfak <- plot_ly(x=ruangFak$nama_fk,y=ruangFak$jumlah_ruangan,type="bar") %>%
      layout(title = "",
             xaxis = xprodiFak)
    dbDisconnect(DB)
    plotruangfak
  })
  
  output$RuanganPerHari <- renderPlotly({
    DB <- connectDB()
    ruangHari <- dbGetQuery(DB,"select hari, count(*) as jumlah_jadwal
from jadwal_kuliah
group by hari;")
    ruangHari$hari <- ordered(ruangHari$hari,c("Senin","Selasa","Rabu","Kamis","Jumat","Sabtu"))
    plotruangHari <- plot_ly(x=ruangHari$hari,y=ruangHari$jumlah_jadwal,type="bar")
    dbDisconnect(DB)
    plotruangHari
  })

  output$MatkulPerProdi <- renderPlotly({
    DB <- connectDB()
    matkulProdi <- dbGetQuery(DB,"select concat(pr.kode_prodi,' - ',pr.singkatan) as kode_prodi, count(*) as jumlah_matkul
from prodi as pr,mata_kuliah as mk
where pr.kode_prodi=mk.kode_prodi
group by pr.kode_prodi
order by kode_prodi;")
    plotmatkulProdi <- plot_ly(x=matkulProdi$kode_prodi,y=matkulProdi$jumlah_matkul,type="bar")
    dbDisconnect(DB)
    plotmatkulProdi
  })
  
  output$ProdiPerFak <- renderPlotly({
    DB <- connectDB()
    prodiFak <- dbGetQuery(DB,"SELECT * 
                           FROM fakultas
                           WHERE jmlh_prodi > 0;")
    xprodiFak <- list(categoryorder = "array",
                  categoryarray = prodiFak$nama_fk)
    plotprodiFak <- plot_ly(x=prodiFak$nama_fk,y=prodiFak$jmlh_prodi,type="bar") %>%
      layout(title = "",
             xaxis = xprodiFak)
    dbDisconnect(DB)
    plotprodiFak
  })
  DB <- connectDB()
  
  namaProdi <- dbGetQuery(DB,"select concat(kode_prodi,' - ', nama_prodi) as nama_prodi,
                        nama_fk 
                        from 
                        prodi as pr,
                        fakultas as f
                        
                        WHERE 
                        pr.kode_fk=f.kode_fk
                        ;")
  
  namaMatkul <- dbGetQuery(DB,"select concat(kode_mk,' - ',nama_mk) as kode_mk, 
nama_prodi 
from mata_kuliah as mk,prodi as pr
where mk.kode_prodi=pr.kode_prodi;")
  
  dbDisconnect(DB)
  
  
  observe({ updateSelectInput(getDefaultReactiveDomain(),
                              inputId="listProdi_Jadwal", 
                              choices=namaProdi[namaProdi$nama_fk == input$listFak_Jadwal,
                                                           "nama_prodi"]
  )
  })
  
  observe({ updateSelectInput(getDefaultReactiveDomain(),
                              inputId="listProdi_matkul", 
                              choices=namaProdi[namaProdi$nama_fk == input$listFak_matkul,
                                                "nama_prodi"]
  )
  })
  
  observe({ updateSelectInput(getDefaultReactiveDomain(),
                              inputId="listProdi_Kelas", 
                              choices=namaProdi[namaProdi$nama_fk == input$listFak_Kelas,
                                                "nama_prodi"]
  )
  })
  
  observe({ updateSelectInput(getDefaultReactiveDomain(),
                              inputId="listMatkul", 
                              choices=namaMatkul[namaMatkul$nama_prodi == substr(input$listProdi_Kelas,8,100),
                                                "kode_mk"]
  )
  })
}
