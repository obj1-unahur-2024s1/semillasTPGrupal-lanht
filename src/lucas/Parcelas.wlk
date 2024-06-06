import semillas.*

class Parcela {
	const property ancho
	const property largo
	var property horasDeSolP=0
	const property plantas=[]
	method superficie()= ancho*largo
	method cantidadMaximaPlantas()= self.superficie() / if(ancho>largo)5 else 3 + largo
	method tieneComplicaciones()= plantas.any{p=>p.horasDeSol()<horasDeSolP}
							//ese +1 seria la planta que agregariamos
	method plantar(unaPlanta)= if (plantas.size()+1>self.cantidadMaximaPlantas() or horasDeSolP>unaPlanta.horasDeSol()+2)self.error("No hay espacio en la parcela o la planta no tolera las horas de sol recibidas en la parcela")else plantas.add(unaPlanta)
	
	method tieneSueloExtenso()= self.superficie()>6
	
	method hayPlantaMayorAMetroYMedio()= plantas.any{p=>p.altura()>1.5}
	
	method hayMaximoDeUnaPlanta()= plantas.size()<=1
	
	method seAsociaBien(unaPlanta)
	
	method cantidadDePlantas()= plantas.size()
	
	method cantidadBienAsociadas()= plantas.count{p=>self.seAsociaBien(p)}
}


class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta)= not self.tieneComplicaciones() and unaPlanta.condicionIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta)= self.cantidadDePlantas()<=2 and unaPlanta.esFuerte()
}

