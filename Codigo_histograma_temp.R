# Cargar paquetes necesarios
library(ggplot2)

# Leer el archivo temp.xvg (suponiendo que es un archivo de texto con columnas)
data <- read.table("temp_ext.xvg", comment.char = "@", header = FALSE)

# Seleccionar la segunda columna (temperatura)
temperature <- data$V2  

# Definir el ancho del bin
width <- 2  

# Crear el histograma
ggplot(data, aes(x = temperature)) +
  geom_histogram(binwidth = width, fill = "green", color = "black", alpha = 0.5) +
  labs(title = "Histograma de evolucion de temperatura 298K", x = "Temperatura (K)", y = "Frecuencia") +
  theme_minimal()
