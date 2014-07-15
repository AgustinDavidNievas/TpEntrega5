package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador

class OrdenamientoPorHandicap extends CriterioOrdenamiento {

	override calcularValor(Jugador jugador) {
		jugador.calificacion
	}

}
