package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido
import ar.edu.futbol5.Jugador

class OrdenamientoPorHandicap extends CriterioOrdenamiento {
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(jugador | calcularValor(jugador)).clone.reverse
	}
	//todas las clases hacen lo mismo, deberia estar en la interface directamente
	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	
	override calcularValor(Jugador jugador) {
		jugador.calificacion 
	}
	
}