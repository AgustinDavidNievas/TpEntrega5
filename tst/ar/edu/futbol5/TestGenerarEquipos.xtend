package ar.edu.futbol5

import ar.edu.futbol5.excepciones.BusinessException
import ar.edu.futbol5.ordenamiento.OrdenamientoCalificacionUltimos2Partidos
import ar.edu.futbol5.ordenamiento.OrdenamientoMix
import ar.edu.futbol5.ordenamiento.OrdenamientoPorHandicap
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import java.util.List
import com.google.common.collect.Lists

class TestGenerarEquipos {

	Partido partidoPocosJugadores
	Partido partidoOk
	Partido partido1
	List<String> nombres8
	List<Jugador> jugadoresEstandar8
	List<List<Double>> puntajes
	List<Double> calificaciones

	Jugador eric
	Jugador leo
	Jugador ferme
	Jugador roly
	Jugador pato
	Jugador mike
	Jugador dodi
	Jugador sytek
	Jugador chicho
	Jugador lechu
	Jugador rodri
	
	
	@Before
	def void init() {
		partidoPocosJugadores = new Partido()
		(1 .. 7).forEach[inscribir(partidoPocosJugadores, new Jugador)]
		partidoOk = new Partido
		partido1 = new Partido

		nombres8 = newArrayList("sytek", "chicho", "pato", "lechu", "rodri", "mike", "dodi", "roly")
		jugadoresEstandar8 = Lists.newArrayList(nombres8.map[nombre|new Jugador(nombre, 0d, newArrayList(0d, 0d))])
		puntajes = newArrayList(newArrayList(5d, 8d), newArrayList(6d, 8d, 6d), newArrayList(9d, 8d),
			newArrayList(7d, 9d), newArrayList(5d, 8d), newArrayList(4d, 10d, 6d, 8d), newArrayList(6d, 7d),
			newArrayList(6d, 6d, 9d))

		calificaciones = newArrayList(6d, 7d, 8d, 7d, 6d, 5d, 7d, 8d, 6d, 5d, 8d)

		jugadoresEstandar8.forEach[jugador|
			jugador.modificarCalificacion(calificaciones.get(jugadoresEstandar8.indexOf(jugador)))]

		jugadoresEstandar8.forEach[jugador|jugador.modificarPuntaje(puntajes.get(jugadoresEstandar8.indexOf(jugador)))]

		eric = new Jugador("eric", 6d, newArrayList(9d, 4d, 3d, 10d))
		eric.modoSolidario
		leo = new Jugador("leo", 5d, newArrayList(6d, 6d, 6d))
		leo.modoSolidario
		ferme = new Jugador("ferme", 8d, newArrayList(9d, 10d, 7d))
		ferme.modoSolidario

		jugadoresEstandar8.forEach[jugador|inscribir(partido1, jugador)]
		inscribir(partido1, eric)
		inscribir(partido1, leo)
		inscribir(partido1, ferme)

		jugadoresEstandar8.forEach[jugador|inscribir(partidoOk, jugador)]
		inscribir(partidoOk, eric)
		inscribir(partidoOk, leo)
		inscribir(partidoOk, ferme)

	}

	@Test(expected=typeof(BusinessException))
	def void pocosInscriptosNoGeneranEquipos() {
		partidoPocosJugadores.generarEquipos
	}

	@Test(expected=typeof(BusinessException))
	def void partidoSinIniciarNoPuedeGenerarEquipos() {
		(1 .. 4).forEach[inscribir(partidoPocosJugadores, new Jugador)]
		partidoPocosJugadores.generarEquipos
	}

	@Test
	def void inscripcionJugadorNuevoDesplazaAPrimerSolidario() {
		inscribir(partido1, roly)
		Assert.assertTrue(partido1.inscriptos.contains(roly))
		Assert.assertFalse(partido1.inscriptos.contains(eric))
		Assert.assertTrue(partido1.inscriptos.contains(ferme))
	}

//	
//		@Test
//		def void generarEquiposPorHandicap() {
//			println("******************************************")
//			println("ordenamiento por handicap")
//			println(
//				partido1.ordenarEquipos.map [ jugador |
//					println("Jugador: " + jugador + " - calificacion: " + jugador.calificacion)
//				])
//			Assert.assertArrayEquals(newArrayList(ferme, roly, pato, dodi, lechu, chicho, rodri, sytek, leo, mike),
//				partido1.ordenarEquipos)
//		}
//	
//		@Test
//		def void generarEquiposPorCalificacionUltimos2Partidos() {
//			partido1.criterioOrdenamiento = new OrdenamientoCalificacionUltimos2Partidos
//			println("******************************************")
//			println("ordenamiento por ultimas 2 calificaciones")
//			println(
//				partido1.ordenarEquipos.map [ jugador |
//					val misPuntajes = jugador.puntajes.clone.reverse.take(2).toList
//					val promedio = misPuntajes.fold(0d, [acum, puntaje|acum + puntaje]) / misPuntajes.size
//					println(
//						"Jugador: " + jugador + " puntajes: " + jugador.puntajes + " ult.puntajes: " + misPuntajes +
//							" promedio: " + promedio)
//				])
//			Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, roly, mike, chicho, dodi, rodri, sytek, leo),
//				partido1.ordenarEquipos)
//		}
//	
//		@Test
//		def void generarEquiposPorMixDeCriterios() {
//			val ordenamientoMix = new OrdenamientoMix
//			ordenamientoMix.addCriterio(new OrdenamientoCalificacionUltimos2Partidos)
//			ordenamientoMix.addCriterio(new OrdenamientoPorHandicap)
//			partido1.criterioOrdenamiento = ordenamientoMix
//			println("******************************************")
//			println("ordenamiento por mix")
//			println(partido1.ordenarEquipos)
//			Assert.assertArrayEquals(newArrayList(ferme, pato, roly, lechu, chicho, dodi, rodri, sytek, mike, leo),
//				partido1.ordenarEquipos)
//		}
//	
//		@Test
//		def void distribuirEquiposParEImpar() {
//			partido1.cerrar
//			partido1.generarEquipos
//			Assert.assertArrayEquals(newArrayList(ferme, pato, lechu, rodri, leo), partido1.equipo1.jugadores)
//			Assert.assertArrayEquals(newArrayList(roly, dodi, chicho, sytek, mike), partido1.equipo2.jugadores)
//		}
//	
//		@Test
//		def void distribuirEquipos14589() {
//			partido1.distribucionEquipos = 16 // ordenamiento
//			partido1.cerrar
//			partido1.generarEquipos
//			Assert.assertArrayEquals(newArrayList(ferme, dodi, lechu, sytek, leo), partido1.equipo1.jugadores)
//			Assert.assertArrayEquals(newArrayList(roly, pato, chicho, rodri, mike), partido1.equipo2.jugadores)
//		}
//	
//		@Test(expected=typeof(BusinessException))
//		def void generarEquiposCuandoSeCierra() {
//			partido1.distribucionEquipos = 16 // ordenamiento
//			partido1.cerrar
//			partido1.generarEquipos
//			partido1.generarEquipos
//		}
	/** *************************************************************************
	 * METODOS AUXILIARES DE LOS TESTS
	 ****************************************************************************/
	def void inscribir(Partido partido, Jugador jugador) {
		partido.inscribir(jugador)
	}

}
