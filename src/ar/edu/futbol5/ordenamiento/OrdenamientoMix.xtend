package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador
import java.util.ArrayList
import java.util.List

class OrdenamientoMix extends CriterioOrdenamiento {

	List<CriterioOrdenamiento> criterios

	new() {
		criterios = new ArrayList<CriterioOrdenamiento>
	}

	def addCriterio(CriterioOrdenamiento criterio) {
		criterios.add(criterio)
	}

	override calcularValor(Jugador jugador) {

		criterios.fold(0d, [acum, criterio|acum + criterio.calcularValor(jugador)]) / criterios.size

	//se deberia separar comportamiento, aplicar por un lado y carlcular el valor por otro
	}

}
