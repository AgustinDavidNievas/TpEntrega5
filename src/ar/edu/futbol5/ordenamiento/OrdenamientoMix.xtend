package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Partido
import java.util.ArrayList
import java.util.List
import ar.edu.futbol5.Jugador

class OrdenamientoMix extends CriterioOrdenamiento {
	
	List<CriterioOrdenamiento> criterios 
	
	new() {
		criterios = new ArrayList<CriterioOrdenamiento>
	}
	
	override ordenar(Partido partido) {
		partido.inscriptos.sortBy(jugador | calcularValor(jugador)).clone.reverse
	}
	//todas las clases hacen lo mismo, deberia estar en la interface directamente
	//tambien hay que ver si el encargado de ordenar la lista es el criterio y no alguien mas como por ej el Admin
	
	def addCriterio(CriterioOrdenamiento criterio) {
		criterios.add(criterio) 
	}
	
	override calcularValor(Jugador jugador) {
		
			criterios.fold(0d, [ acum, criterio | acum + criterio.calcularValor(jugador) ]) / criterios.size
		
		
		//se deberia separar comportamiento, aplicar por un lado y carlcular el valor por otro
			
		}
	
}