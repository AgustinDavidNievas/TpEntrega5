package ar.edu.futbol5

import ar.edu.futbol5.inscripcion.CriterioInscripcion
import ar.edu.futbol5.inscripcion.ModoSolidario
import java.util.ArrayList
import java.util.List
import ar.edu.futbol5.inscripcion.ModoEstandar

class Jugador {

	@Property String nombre
	@Property Double calificacion
	@Property List<Double> puntajes
	@Property CriterioInscripcion criterioInscripcion

	new() {
		this.puntajes = new ArrayList<Double>
		this.calificacion = null
		this.criterioInscripcion = new ModoEstandar
		this.nombre = ""
	}

	new(String nombre, double calificacion, List<Double> puntajes) {
		this.calificacion = calificacion
		this.puntajes = puntajes
		this.criterioInscripcion = new ModoEstandar
		this.nombre = nombre
	}

	def modificarCalificacion(Double calificacion) {
		this.calificacion = calificacion

	}




	def modoSolidario() {
		this.criterioInscripcion = new ModoSolidario
	}

	def boolean dejaLugarAOtro() {
		this.criterioInscripcion.dejasLugarAOtro()

	//		if (criterioInscripcion.class.equals(typeof(ModoSolidario))) { //Pregunta por clase
	//			return true
	//		} else { //return true, return false? xD . Se supone que lo de arriba ya da como resultado un boole
	//			return false
	//		}
	}

	//	override toString() {//wtf?
	//		//"Jugador (" + calificacion + ") - modo " + criterioInscripcion.toString()
	//		nombre
	//	}	
	// Este mensaje esta de mas
	def List<Double> ultimosDosPuntajes() {
		this.getPuntajes.clone.reverse.take(2).toList
	}
	
	def modificarPuntaje(List<Double> doubles) {
		this.puntajes = doubles
	}
	
}
