#------------------------------------------------------------------------------#
#-------------- DISEÑOS EXPERIMENTALES II - TRABAJO FINAL ---------------------#
#------------------------------------------------------------------------------#
#- Autor: Bañares Gutierrez, Michael A. - 20210824 - UNALM - Fecha: 2/07/2024 -#

library(FrF2)
library(rsm)

y = c(7.07,7.17,3.5,6.4,6.47,3.27,7,4.13,4.3,6.27,6.13,7.13)

# Néctar Mixto de Alta Aceptabilidad
names = c("Maracuya","Pepino","Sacarosa")
FrF2(nruns = 8, nfactors = 3, 
     factor.names = names) |> as.data.frame() #Diseño 2^3

#------------------------------------------------------------------------------#
#Agregando Puntos Centrales
set.seed(2024)
diseño = FrF2(nruns = 8, nfactors = 3, ncenter = 4, 
              factor.names = names) |> as.data.frame() #Diseño 2^3 con 4 puntos centrales


#Maracuyá:   alto = 16, bajo = 6
#Pepino:     alto = 75, bajo = 72
#Sacarosa:   alto = 8,  bajo = 0

#------------------------------------------------------------------------------#
#Agregando Puntos Centrales
datos = cbind(diseño, y) #Datos

#------------------------------------------------------------------------------#
#Primer ANOVA
m1 = lm(y ~ SO(Maracuya, Pepino, Sacarosa), data = datos)

m1 |> summary() #Maracuyá y Sacarosa significativos
m1 |> anova()

shapiro.test(rstandard(m1)) #Cumple Normalidad

library(car)
ncvTest(m1) #Cumple Homogeneidad de Varianzas

durbinWatsonTest(m1) #Independencia de Errores

par(mfrow=c(2,2))
plot(m1) #Cumple los supuestos

#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
#Vamos a considerar mi pepino Constante (73.5%)

#Maracuyá:   alto = 14.54, bajo = 7.46
#Sacarosa:   alto = 5.41,  bajo = 2.59

y2 = c(6.83, 5.95, 7.05, 7.70, 4.53, 7.65, 7.68, 7.10, 4.5, 7.05, 7.16, 7.6)

set.seed(2024)
diseño_2 = ccd(2, n0 = 2) |> as.data.frame()
data2 = cbind(diseño_2, y2)

m2 = rsm(y2 ~ SO(x1, x2), data = data2)
anova(m2)
summary(m2)


#------------------------------------------------------------------------------#
# Gráfico de la superficie de respuesta 

library(plotly)
x1_seq = seq(min(data2$x1), max(data2$x1), length.out = 50)
x2_seq = seq(min(data2$x2), max(data2$x2), length.out = 50)
grid = expand.grid(x1 = x1_seq, x2 = x2_seq)

grid$y2 = predict(m2, newdata = grid)

z = matrix(grid$y2, nrow = length(x1_seq), ncol = length(x2_seq))

plot_ly(x = ~x1_seq, y = ~x2_seq, z = ~z, type = "surface", 
        colors = colorRamp(c("green", "yellow", "red"))) |>
  layout(scene = list(xaxis = list(title = "Maracuyá"),
                      yaxis = list(title = "Sacarosa"),
                      zaxis = list(title = "Grado de Aceptabilidad"),
                      aspectratio = list(x = 1, y = 1, z = 0.5)))

#------------------------------------------------------------------------------#
# Gráfico de contorno

plot_ly(x = ~x1_seq, y = ~x2_seq, z = ~z, type = "contour", 
        colors = colorRamp(c("green", "yellow", "red"))) |> 
  layout(xaxis = list(title = "Maracuyá"), yaxis = list(title = "Sacarosa"))
