package ar.edu.futbol5.ordenamiento

import ar.edu.futbol5.Jugador
import ar.edu.futbol5.Partido
import java.util.List

class CriterioOrdenamiento {
	
	def List<Jugador> ordenar(Partido partido){
		
		partido.getInscriptos.sortBy (jugador | calcularValor(jugador)).clone.reverse
	}

	//def (Jugador) => Double calcularValor()  // que es esto?? se supone que hay una lista en algun lado? :P

     def Double calcularValor (Jugador jugador){
     	
     }
     
}