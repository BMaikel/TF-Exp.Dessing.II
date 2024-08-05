# Una Aplicación del Diseño de Superficie de Respuesta

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

## Descripción
Este proyecto aplica la Metodología de Superficie de Respuesta (RSM) y la Programación Lineal para desarrollar un néctar mixto de alta aceptabilidad y bajo costo. El trabajo se enfoca en optimizar las proporciones de maracuyá, pepino dulce, sacarosa y agua, utilizando diseños experimentales y técnicas de optimización de costos. 
Trabajo final para el curso de Diseños Experimentales II - Ciclo 2024 - I

## Objetivo
Desarrollar un néctar mixto altamente aceptable y con el costo mínimo posible, utilizando RSM para maximizar la aceptabilidad sensorial y la Programación Lineal para minimizar el costo de producción.

## Metodología
El estudio se realizó en dos etapas principales:
1. **Screening**: Utilizando un diseño factorial 2^3 + 4 puntos centrales, se exploraron diferentes combinaciones de maracuyá, pepino dulce y sacarosa para determinar sus efectos en la aceptabilidad general.
2. **Optimización**: Aplicando un Diseño Compuesto Central Rotable (DCCR) 2^2 + 2*2 + 4 puntos centrales, se optimizaron las proporciones de maracuyá y sacarosa mientras se mantenía constante la proporción de pepino dulce.

Finalmente, se utilizó la Programación Lineal para reducir el costo del néctar sin comprometer su alta aceptabilidad.

## Variables
- **Maracuyá**: Proporción en el néctar, variando entre 9% y 14%.
- **Pepino dulce**: Proporción fija en el néctar, alrededor de 73.5%.
- **Sacarosa**: Proporción en el néctar, variando entre 4% y 5%.
- **Agua**: Utilizada para completar el 100% del néctar.

## Resultados
Se obtuvo un néctar mixto de alta aceptabilidad con una puntuación óptima de 7 en una escala hedónica. La Programación Lineal permitió reducir el costo del néctar a S/.174 para una producción de 1000 L/día.

## Repositorio
Este repositorio contiene:
- Código en R para la replicación de los resultados.
- Datos experimentales utilizados en el estudio.
- Documentación adicional sobre la metodología y los análisis realizados.

## Referencias
López Calderón, E., Arteaga Miñano, H., Castro Santander, P., Nolasco Pérez, I., & Siche, R. (2012). El Método de Superficie Respuesta y la Programación Lineal en el desarrollo de un néctar mixto de alta aceptabilidad y mínimo costo. *Scientia Agropecuaria*, 3, 309-318.
