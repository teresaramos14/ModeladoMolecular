#install.packages("ggplot2")
# Cargar librería ggplot2
library(ggplot2)

# Cargar datos desde un archivo .xvg
data <- read.table("energy.xvg", comment.char="#", header=FALSE)

# Ver las primeras filas de los datos
head(data)

# Nombrar columnas del archivo son: tiempo (ps) y energía total (kJ/mol)
colnames(data) <- c("Time", "TotalEnergy")

# Crear el gráfico
ggplot(data, aes(x = Time, y = TotalEnergy)) +
  geom_line() + 
  geom_point() +
  labs(title = "Evolución de la energía total a 298 K",
       x = "Tiempo (ps)",
       y = "Energía Total (kJ/mol)") +
  theme_minimal()




