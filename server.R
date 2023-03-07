connectDB <- function(){
  driver <- dbDriver('PostgreSQL')
  
  # 1. set connection to ElephantSQL server database
  DB <- dbConnect(
    driver,
    dbname="srsttvfb", # User & Default database
    host="topsy.db.elephantsql.com", # Server
    # port=5433,
    user="srsttvfb", # User & Default database
    password="TLaAq8YtYIw6OXrnpcJRERsgE6MspeOn" # Password
  )
}

function(input, output, session){
  output$tblFak <- renderDataTable({
    DB <- connectDB() # koneksi database
    q <- "SELECT nm_fk as Nama_Fakultas,jml_prodi as Jumlah_Prodi FROM fakultas;" # query
    dbGetQuery(DB, q) # retrieve database
  })
  
  output$tblProdi <- renderDataTable({
    DB <- connectDB() # koneksi database
    q <- "SELECT nm_prodi as Nama_Prodi,kode_fk as Fakultas FROM prodi;"
    dbGetQuery(DB, q)
  })
  
  output$tblRuangan <- renderDataTable({
    DB <- connectDB() # koneksi database
    q <- paste0("SELECT kode_rg as kode_ruangan,nm_rg as Nama_Ruangan, lokasi, kapasitas,kode_fk as Fakultas FROM ruangan WHERE kode_fk='", input$listFak,"';")
    dbGetQuery(DB, q)
  })
  
  output$tblMatkul <- renderDataTable({
    DB <- connectDB() # koneksi database
    q <- paste0("SELECT * FROM mata_kuliah WHERE kode_prodi='", input$listProdi_matkul,"';")
    dbGetQuery(DB, q)
  })

}

# function(input, output, session){
#   output$tblProdi <- renderDataTable({
#     driver <- dbDriver('PostgreSQL')
#     DB <- dbConnect(
#       driver, dbname="RuanganIPB", host="localhost",port=5432,user="postgres", password="Cacadcdcuy5."
#     )
#     dbReadTable(DB, 'prodi')
#   })
# }
# 
# function(input,output,session){
#   output$tblRuangan <- renderDataTable({
#     driver <- dbDriver('PostgreSQL')
# 
#     # bangun koneksi ke DBMS
#     DB <- dbConnect(
#       driver, dbname="ruangan-IPB", host="localhost",port=5432,user="postgres", password="Cacadcdcuy5."
#     )
#     dbReadTable(DB,'Ruangan')
# 
# q <- "SELECT * FROM ;"
# dbGetQuery(DB, q)
# #   })
# }
# 
# function(input,output,session){
#   output$tblProdi <- renderDataTable({
#     driver <- dbDriver('PostgreSQL')
# 
#     # bangun koneksi ke DBMS
#     DB <- dbConnect(
#       driver, dbname="ruangan-IPB", host="localhost",port=5432,user="postgres", password="Cacadcdcuy5."
#     )
#     dbReadTable(DB,'Prodi')
#   })
# }
# 
# function(input,output,session){
#   output$tblProdi <- renderDataTable({
#     driver <- dbDriver('PostgreSQL')
# 
#     # bangun koneksi ke DBMS
#     DB <- dbConnect(
#       driver, dbname="ruangan-IPB", host="localhost",port=5432,user="postgres", password="Cacadcdcuy5."
#     )
#     dbReadTable(DB,'Prodi')
#   })
# }