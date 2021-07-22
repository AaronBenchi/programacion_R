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
