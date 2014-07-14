package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido
import java.util.ArrayList
import java.util.List

class OrdenamientoMix implements CriterioOrdenamiento {
	
	List<CriterioOrdenamiento> criterios 
	
	new() {
		criterios = new ArrayList<CriterioOrdenamiento>
	}
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(calcularValor()).clone.reverse
	}
	//todas las clases hacen lo mismo, deberia estar en la interface directamente
	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	
	def addCriterio(CriterioOrdenamiento criterio) {
		criterios.add(criterio) 
	}
	
	override calcularValor() {
		[ jugador | 
			criterios.fold(0d, [ acum, criterio | acum + criterio.calcularValor().apply(jugador) ]) / criterios.size
		]
		
		//se deberia separar comportamiento, aplicar por un lado y carlcular el valor por otro
		//no entiendo bien como funciona la lista de criterios. divide por el size de la lista criterios en vez de la lista 
		//de calificaciones??	
		}
	
}