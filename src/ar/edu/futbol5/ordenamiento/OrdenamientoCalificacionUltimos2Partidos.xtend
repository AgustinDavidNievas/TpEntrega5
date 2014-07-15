package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido

class OrdenamientoCalificacionUltimos2Partidos implements CriterioOrdenamiento {
	
	override ordenar(Partido partido) {
		partido.getInscriptos.sortBy (calcularValor()).clone.reverse
	} 
	//todas las clases hacen lo mismo, deberia estar en la interface directamente
	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	
	override calcularValor() {
		[ jugador |
				val misPuntajes = jugador.getPuntajes.clone.reverse.take(2).toList //rompe encapsulamiento
				val promedio = misPuntajes.fold(0d, [ acum, puntaje | acum + puntaje ]) / misPuntajes.size
				promedio
//				
//		TODO: una funcion que devuelva los ultimos 2 puntajes del partido
//				a partir de ahi EN OTRO REFACTOR mejorar el promedio		
//				mejorar los nombres asquerosos
				
				/* Esto es un quilombo xD
				 * se deberia delegar comportamiento, ya que hay cosas que son propias del Jugador
				 * se esta instanciando nuevas variables por/para cada jugador
				 */
				
		]
	}
	
}