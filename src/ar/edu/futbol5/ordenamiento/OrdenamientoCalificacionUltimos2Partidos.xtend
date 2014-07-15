package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador

class OrdenamientoCalificacionUltimos2Partidos extends CriterioOrdenamiento {

	override calcularValor(Jugador jugador) {

		jugador.ultimosDosPuntajes.fold(0d, [acum, puntaje|acum + puntaje]) / 2

	}

}
