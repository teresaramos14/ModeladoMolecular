#Función para graficar el histograma solo una componente de velocidad de un átomo
graficar_histograma_vz <- function(fichero, atomo) {
  #Leer el fichero ignorando comentarios
  velocidades <- read.table(fichero, comment.char = "#")
  
  # Asignar nombres de columnas (Tiempo, vx, vy, vz, |v|, ...)
  n_columnas <- ncol(velocidades)
  n_atomos <- n_columnas %/% 4
  
  colnames(velocidades) <- c("Tiempo", paste0(rep(c("vX", "vY", "vZ", "v"), times = n_atomos), "_", rep(1:n_atomos, each = 4)))
  
  # Seleccionar solo la componente vz del átomo seleccionado
  data_plot <- data.frame(
    Tiempo = velocidades$Tiempo,
    vz = velocidades[[paste0("vZ_", atomo)]]
  )
  
  # Graficar el histograma para vz
  ggplot(data_plot, aes(x = vz)) +
    geom_histogram(binwidth = 0.1, fill = "#2A9D8F", alpha = 0.7) +
    labs(title = paste("Distribución de la componente vz para el átomo ", atomo, "(298 K)"),
         x = "Velocidad en z (nm/ps)",
         y = "Frecuencia") +
    theme_minimal()
}

# Uso de la función para el átomo 2
graficar_histograma_vz("velocext.xvg", atomo = 2)
