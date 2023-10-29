import actividades.*

class Socio {
	const edad
	const property idiomas = #{}
	const actividadesRealizadas = []
	const maximoDeActividades  
	
	method esAdoradorDelSol() = actividadesRealizadas.all({ actividad => actividad.sirveParaBroncearse() })
	method actividadesEsforzadas() = actividadesRealizadas.filter({ actividad => actividad.implicaEsfuerzo() })
	method realizarActividad(unaActividad){ 
		if (actividadesRealizadas.size() < maximoDeActividades){
			actividadesRealizadas.add(unaActividad)
		}
		else{ self.error("Ya realizo el maximo de actividades posible") }
	}
	method leAtraeEstaActividad(unaActividad)
	method actividadesRealizadas() = actividadesRealizadas
}

class SocioTranquilo inherits Socio {
	override method leAtraeEstaActividad(unaActividad) = unaActividad.diasdeActividad() > 3
}

class Sociocoherente inherits Socio {
	override method leAtraeEstaActividad(unaActividad) = 
		if(self.esAdoradorDelSol()){ unaActividad.sirveParaBroncearse() }
		else{ unaActividad.implicaEsfuerzo() }
}

class SocioRelajado inherits Socio {
    override method leAtraeEstaActividad(unaActividad) = 
        unaActividad.idiomas().any({ idioma => idiomas.contains(idioma) })
}