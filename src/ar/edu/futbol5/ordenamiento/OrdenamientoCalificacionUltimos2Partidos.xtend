package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador

class OrdenamientoCalificacionUltimos2Partidos extends CriterioOrdenamiento {

	override calcularValor(Jugador jugador) {

		val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList //rompe encapsulamiento
		val promedio = misPuntajes.fold(0d, [acum, puntaje|acum + puntaje]) / misPuntajes.size
		promedio

	// esto esta al pedo
	//				
	//		TODO: una funcion que devuelva los ultimos 2 puntajes del partido
	//				a partir de ahi EN OTRO REFACTOR mejorar el promedio		
	//				mejorar los nombres asquerosos
	/* Esto es un quilombo xD
				 * se deberia delegar comportamiento, ya que hay cosas que son propias del Jugador
				 * se esta instanciando nuevas variables por/para cada jugador
				 */
	}

}
