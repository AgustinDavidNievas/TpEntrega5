package ar.edu.futbol5.inscripcion

import ar.edu.futbol5.inscripcion.CriterioInscripcion

class ModoEstandar implements CriterioInscripcion {

//	override toString() {//no implementa nada de la interfaz...
//		"Estándar"			nunca se usa este mensaje
//	}
	override dejasLugarAOtro(){
		return false
	}	
}