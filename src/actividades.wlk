import socios.*

class Actividad {
	const idiomas = #{}
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad()
	method idiomas(unIdioma){ idiomas.add(unIdioma) }
	method idiomas() = idiomas
	method esRecomendadaParaSocio(unSocio)
}

class Viaje inherits Actividad {
	method esInteresante() = idiomas.size() > 1
	override method esRecomendadaParaSocio(unSocio) = 
		self.esInteresante() and
		unSocio.leAtraeEstaActividad(self) and
		not unSocio.actividadesRealizadas().contains(self)
}

class ViajeDePlaya inherits Viaje {
	const largo 
	
	override method implicaEsfuerzo() = largo > 1200
	override method sirveParaBroncearse() = true
	override method diasDeActividad() = largo/500
}

class ExcursionACiudad inherits Viaje {
	const atraccionesAVisitar 
	
	override method implicaEsfuerzo() = atraccionesAVisitar.between(5,8)
	override method sirveParaBroncearse() = false
	override method diasDeActividad() = atraccionesAVisitar/2
	override method esInteresante() = super() or atraccionesAVisitar == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method sirveParaBroncearse() = true
	override method diasDeActividad() = super() + 1
}

class SalidaDeTrekking inherits Viaje {
	const kilometros 
	const diasDeSolPorAnio
	
	override method implicaEsfuerzo() = kilometros > 80
	override method sirveParaBroncearse() = diasDeSolPorAnio > 200 or ( diasDeSolPorAnio.between(100,200) and kilometros > 120 )
	override method diasDeActividad() = kilometros/50
	override method esInteresante() = super() and diasDeSolPorAnio > 140
	
}

class ClasesDeGimnasia inherits Actividad {
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method diasDeActividad() = 1
	override method idiomas() = "español"
	override method esRecomendadaParaSocio(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad {
    const libros = []
    
    override method idiomas() = libros.map({ libro => libro.idioma() })
    override method diasDeActividad() = libros.size() + 1
    override method sirveParaBroncearse() = false
    override method esRecomendadaParaSocio(unSocio) = unSocio.idiomas().size() > 1
    
    override method implicaEsfuerzo() = 
        libros.any({ libro => libro.cantidadDePaginas() > 500 }) or
        ( libros.all({ libro => libro.autor() == libros.get(0).autor() }) and libros.size() > 1 )
    
    method agregarLibro(unLibro){ libros.add(unLibro) }
}

class Libro {
	const property idioma
	const property cantidadDePaginas
	const property autor
}

