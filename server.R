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


function(input, output, session){
  #TAB FAKULTAS
  output$tblFak <- renderDataTable({
    DB <- connectDB()
    q <- "SELECT 
      nm_fk as Nama_Fakultas,
      jml_prodi as Jumlah_Prodi 
      
      FROM fakultas;"
    dbGetQuery(DB, q)
  })
  
  #TAB PRODI
  output$tblProdi <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                nm_fk as Fakultas, 
                kode_prodi,
                nm_prodi as Program_Studi 
                
                FROM 
                prodi as P,
                fakultas as F 
                
                WHERE P.kode_fk=F.kode_fk 
                AND P.kode_fk='", input$listFak_prodi,"';")
    dbGetQuery(DB, q)
    
  })
  
  #TAB RUANGAN
  output$tblRuangan <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_rg as kode_ruangan,
                nm_rg as Nama_Ruangan, 
                lokasi, 
                kapasitas as kapasitas_ruangan 
                
                FROM 
                ruangan as R,
                fakultas as F 
                
                WHERE R.kode_fk=F.kode_fk 
                AND R.kode_fk='", input$listFak_ruang,"';")
    dbGetQuery(DB, q)
    
  })
  
  #TAB JADWAL
  output$tblJadwal <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                JK.kode_mk as kode_mata_kuliah, 
                nm_mk as Nama_mata_kuliah, 
                jadwal, 
                nm_rg as Nama_Ruangan, 
                lokasi,
                nm_fk as Gedung 
                
                FROM 
                fakultas as F, 
                mata_kuliah as MK, 
                jadwal_kuliah as JK, 
                ruangan as R 
                
                WHERE 
                JK.kode_mk=MK.kode_mk 
                AND r.kode_fk=f.kode_fk 
                AND JK.kode_rg=R.kode_rg 
                AND kode_prodi='", input$listProdi_Jadwal,"';")
    dbGetQuery(DB, q)
    
  })
  
  #TAB MATKUL
  output$tblMatkul <- renderDataTable({
    DB <- connectDB()
    q <- paste0("SELECT 
                kode_mk, 
                nm_mk as Nama_mata_kuliah, 
                semester 
                
                FROM mata_kuliah 
                WHERE kode_prodi='", input$listProdi_matkul,"';")
    dbGetQuery(DB, q)
    
  })

}
