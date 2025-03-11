# Cargar librerías
library(ggplot2)
library(reshape2)

# Leer los archivos ignorando líneas de comentarios
velocidades_400K <- read.table("veloc400.xvg", comment.char = "#")
velocidades_298K <- read.table("veloc298.xvg", comment.char = "#")

# Asignar nombres de columnas
colnames(velocidades_400K) <- c("Tiempo", paste0(rep(c("vX", "vY", "vZ", "v"), times = ncol(velocidades_400K) %/% 4), "_", rep(1:(ncol(velocidades_400K) %/% 4), each = 4)))
colnames(velocidades_298K) <- c("Tiempo", paste0(rep(c("vX", "vY", "vZ", "v"), times = ncol(velocidades_298K) %/% 4), "_", rep(1:(ncol(velocidades_298K) %/% 4), each = 4)))

# Extraer tiempo y magnitudes de velocidad del átomo 1 para cada temperatura
data_400K <- data.frame(
  Tiempo = velocidades_400K$Tiempo,
  Atomo1 = velocidades_400K$v_5,
  Temperatura = "400K"
)

data_298K <- data.frame(
  Tiempo = velocidades_298K$Tiempo,
  Atomo1 = velocidades_298K$v_5,
  Temperatura = "298K"
)

# Combinar ambos conjuntos de datos
data_combined <- rbind(data_400K, data_298K)

# Convertir a formato largo para ggplot
data_long <- melt(data_combined, id.vars = c("Tiempo", "Temperatura"), variable.name = "Atomo", value.name = "Velocidad")

# Graficar el histograma de las velocidades para 298K y 400K
ggplot(data_long, aes(x = Velocidad, fill = Temperatura)) +
  geom_histogram(position = "dodge", bins = 30, alpha = 0.7) +  # Histograma con barras separadas
  scale_fill_manual(values = c("400K" = "#E63946", "298K" = "#457B9D")) +  # Rojo para 400K y Azul para 298K
  labs(title = "Histograma de la velocidad del átomo 5 (298K vs 400K)",
       x = "Velocidad (nm/ps)",
       y = "Frecuencia") +
  theme_minimal() +
  theme(legend.title = element_blank())