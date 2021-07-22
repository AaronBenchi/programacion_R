# Función para cargar e instalar librerías ----
cargar_librerias <- function(librerias) {
  sapply(librerias, function(lib) {
    
    # Cargar la librería, y si no existe instalar y cargar.
    if(!require(lib, character.only = TRUE)) {
      
      # Instalar paquete
      install.packages(lib)
      
      # Cargar librería
      library(lib, character.only = TRUE)
    }
  })}

librerias <- c(
  'data.table',
  'tidyverse',
  'lubridate',
  'reactable',
  'htmltools')

cargar_librerias(librerias)

# Adquisición y preparación del dato ----

fun_leer_archivos <- function(carpeta_datos){
  
  # Leer archivos de el directorio data
  mis_tablas <<- list.files(carpeta_datos)
  
  # Nombre de las tablas sin el csv
  nombre_tablas <<- gsub(".csv", "", mis_tablas)
  
  # Número de tablas
  n_archivos <<- length(mis_tablas)
  
  # Ruta del completa de cada archivo
  mis_tablas_path <<- paste0(getwd(), "/data/", list.files("data"))
  
  # creo una lista con totdas las tablas
  lista_de_tablas <<- lapply(mis_tablas_path, fread)
  
  # lista de tablas con nombre
  lista_de_tablas <<- magrittr::set_names(lista_de_tablas, nombre_tablas)
  
}