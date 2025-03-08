#Cargar ggplot2
library(ggplot2)

data <- read.table("arg-3-400.dat", header=FALSE)


data <- read.table("arg-3-400.dat", header=FALSE)[, 2:3]
colnames(data) <- c("Phi", "Psi")  # Renombrar columnas


# Graficar los puntos (φ vs ψ)
ggplot(data, aes(x=Phi, y=Psi)) +
  geom_point(color="blue", alpha=0.6) +  # Puntos en azul con transparencia
  labs(title="Ángulos de giro de ARG-3 (400 K)", x="Phi (φ)", y="Psi (ψ)") +
  theme_minimal()
