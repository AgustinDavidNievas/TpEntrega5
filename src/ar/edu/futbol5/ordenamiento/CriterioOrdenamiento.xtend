package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador
import ar.edu.futbol5.Partido
import java.util.List

class CriterioOrdenamiento {

	def List<Jugador> ordenar(Partido partido) {

		partido.getInscriptos.sortBy(jugador|calcularValor(jugador)).clone.reverse
	}

	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	def Double calcularValor(Jugador jugador) {
	}

}
