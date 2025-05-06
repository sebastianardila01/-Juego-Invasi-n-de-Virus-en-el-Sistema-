Algoritmo EscapeDelLaberinto
	Dimension laberinto[10,10]
	Definir i, j, fila, col, seguir, tecla Como Entero
	Definir caracter Como Caracter
	seguir <- 1
	fila <- 1
	col <- 1

	// Generar laberinto simple con obstáculos y trampas
	Para i <- 0 Hasta 9
		Para j <- 0 Hasta 9
			laberinto[i,j] <- " "
		FinPara
	FinPara

	laberinto[9,9] <- "S" // Salida
	laberinto[3,3] <- "X"
	laberinto[4,4] <- "X"
	laberinto[2,5] <- "T"
	laberinto[6,2] <- "T"

	Mientras seguir = 1
		Limpiar Pantalla
		laberinto[fila,col] <- "P"

		// Mostrar laberinto
		Para i <- 0 Hasta 9
			Para j <- 0 Hasta 9
				Escribir Sin Saltar "[" + laberinto[i,j] + "]"
			FinPara
			Escribir ""
		FinPara

		laberinto[fila,col] <- " " // Borrar posición anterior
		Escribir "Mover (W/A/S/D): "
		Leer caracter

		Si caracter = "W" o caracter = "w" Entonces
			Si fila > 0 Entonces
				fila <- fila - 1
			FinSi
		SiNo
			Si caracter = "S" o caracter = "s" Entonces
				Si fila < 9 Entonces
					fila <- fila + 1
				FinSi
			SiNo
				Si caracter = "A" o caracter = "a" Entonces
					Si col > 0 Entonces
						col <- col - 1
					FinSi
				SiNo
					Si caracter = "D" o caracter = "d" Entonces
						Si col < 9 Entonces
							col <- col + 1
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi

		// Evaluar casilla
		Segun laberinto[fila,col]
			Caso "X":
				Escribir "¡Chocaste con un muro!"
				Esperar Tecla
			Caso "T":
				Escribir "¡Caíste en una trampa! Game Over."
				seguir <- 0
			Caso "S":
				Escribir "¡Escapaste del laberinto! ¡Ganaste!"
				seguir <- 0
		FinSegun
	FinMientras
FinAlgoritmo
