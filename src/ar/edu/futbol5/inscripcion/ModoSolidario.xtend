package ar.edu.futbol5.inscripcion

import ar.edu.futbol5.inscripcion.CriterioInscripcion

class ModoSolidario implements CriterioInscripcion {

//	override toString() {//no implementa nada de la interfaz...
//		"Solidario"		//nunca se usa este mensaje
//	}
	override dejasLugarAOtro(){
		return true
	}
}
