package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido

class OrdenamientoPorHandicap implements CriterioOrdenamiento {
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(calcularValor()).clone.reverse
	}
	//todas las clases hacen lo mismo, deberia estar en la interface directamente
	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	
	override calcularValor() {
		[ jugador | jugador.calificacion ]
	}
	
}