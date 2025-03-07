# Cargar librerías
library(ggplot2)

# Leer el archivo ignorando líneas de comentarios
velocidades <- read.table("veloc400.xvg", comment.char = "#")

# Asignar nombres de columnas (suponiendo que el formato es Tiempo, vX, vY, vZ, |v|, ...)
colnames(velocidades) <- c("Tiempo", paste0(rep(c("vX", "vY", "vZ", "v"), times = ncol(velocidades) %/% 4), "_", rep(1:(ncol(velocidades) %/% 4), each = 4)))

# Extraer tiempo y magnitudes de velocidad de 5 átomos
data_plot <- data.frame(
  Tiempo = velocidades$Tiempo,
  Atomo1 = velocidades$v_1,
  Atomo2 = velocidades$v_2,
  Atomo3 = velocidades$v_3,
  Atomo4 = velocidades$v_4,
  Atomo5 = velocidades$v_5
)

# Convertir a formato largo para ggplot
data_long <- melt(data_plot, id.vars = "Tiempo", variable.name = "Atomo", value.name = "Velocidad")

# Colores personalizados
colores_personalizados <- c("Atomo1" = "#E63946",  # Rojo
                            "Atomo2" = "#457B9D",  # Azul
                            "Atomo3" = "#F4A261",  # Naranja
                            "Atomo4" = "#2A9D8F",  # Verde
                            "Atomo5" = "#9C27B0")  # Morado

# Graficar con colores personalizados
ggplot(data_long, aes(x = Tiempo, y = Velocidad, color = Atomo)) +
  geom_line(size = 1) +
  scale_color_manual(values = colores_personalizados) +
  labs(title = "Velocidades de 5 átomos en función del tiempo (400 K)",
       x = "Tiempo (ps)",
       y = "Velocidad (nm/ps)") +
  theme_minimal() +
  theme(legend.title = element_blank())

