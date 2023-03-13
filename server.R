# Local database
connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  
  DB <- dbConnect(
    driver, 
    dbname="ruangan-IPB", 
    host="localhost",
    port=5432,
    user="postgres",
    password="root"
  )
}

   
# 1. set connection to ElephantSQL server database
# connectDB <- function(){
#   driver <- dbDriver('PostgreSQL')
#   DB <- dbConnect(
#     driver,
#     dbname="srsttvfb", # User & Default database
#     host="topsy.db.elephantsql.com", # Server
#     # port=5433,
#     user="srsttvfb", # User & Default database
#     password="TLaAq8YtYIw6OXrnpcJRERsgE6MspeOn" # Password
#   )
#}


function(input, output) {
  #TAB FAKULTAS
  output$tblFak <- renderDataTable({
    DB <- connectDB()
    q <- "SELECT 
      nama_fk as Nama_Fakultas,
      jmlh_prodi as Jumlah_Prodi 
      
      FROM fakultas;"
    output_fak <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_fak
  },options = list(pageLength = 15))
  
  #TAB PRODI
  output$tblProdi <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_prodi,
                nama_prodi as Program_Studi,
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
  })
  
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
                fakultas as F, 
                mata_kuliah as MK, 
                jadwal_kuliah as JK, 
                ruangan as R, 
				        prodi as Pr
                
                WHERE 
                JK.kode_mk=MK.kode_mk 
                AND r.kode_fk=f.kode_fk 
                AND JK.kode_rg=R.kode_rg 
				AND Pr.kode_prodi=MK.kode_prodi
                AND nama_prodi='", input$listProdi_Jadwal,"';")
    output_jadwal <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_jadwal
  })
  
  #TAB MATKUL
  output$tblMatkul <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_mk, 
                nama_mk as Nama_mata_kuliah, 
                semester 
                
                FROM mata_kuliah as mk,prodi as pr
                WHERE mk.kode_prodi =pr.kode_prodi
				AND nama_prodi='", input$listProdi_matkul,"';")
    output_mk <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_mk
  })
  
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
                fakultas as F, 
                mata_kuliah as MK, 
                jadwal_kuliah as JK, 
                ruangan as R, 
				        prodi as Pr
                
                WHERE 
                JK.kode_mk=MK.kode_mk 
                AND r.kode_fk=f.kode_fk 
                AND JK.kode_rg=R.kode_rg 
				AND Pr.kode_prodi=MK.kode_prodi
                AND mk.kode_mk='", input$listMatkul,"';")
    output_mk <- dbGetQuery(DB, q)
    dbDisconnect(DB)
    output_mk
  })
  
  output$ProdiPerFak <- renderPlot({
    DB <- connectDB()
    prodiFak <- dbGetQuery(DB,"SELECT * FROM fakultas;")
    prodiFak <- as.data.frame(prodiFak)
    plot_prodiFak <- barplot(prodiFak$jmlh_prodi,names.arg=prodiFak$nama_fk,xlab="Fakultas",ylab="Jumlah Prodi",col="blue",
                             main="Jumlah Prodi per Fakultas",border="red")
  })
  
  
  
}
