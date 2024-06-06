import Parcelas.*

class Planta{
	const property anioSemilla
	var property altura
	method horasDeSol()
	method esFuerte()= self.horasDeSol()>10
	method daNuevasSemillas()= self.esFuerte() or self.condicionAlternativa()
	method condicionAlternativa()
	method cuantoEspacioOcupa()
	method condicionIdeal(unaParcela)
	
}

class Menta inherits Planta{
	override method horasDeSol()=6
	override method condicionAlternativa()= altura>0.3
	override method cuantoEspacioOcupa()= altura*3
	override method condicionIdeal(unaParcela)= unaParcela.tieneSueloExtenso()
}

class Hierbabuena inherits Menta{
	override method cuantoEspacioOcupa()= super()*2
}

class Soja inherits Planta{
	override method horasDeSol()= if(altura<0.5) 6 else if (altura.between(0.5,1)) 7 else 9
	override method condicionAlternativa()= anioSemilla>2007 and altura>1
	override method cuantoEspacioOcupa()= altura/2
	override method condicionIdeal(unaParcela)= self.horasDeSol()==unaParcela.horasDeSolP()
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas()=false
	override method condicionIdeal(unaParcela)= unaParcela.hayMaximoDeUnaPlanta()
}

class Quinoa inherits Planta{
	var horasDeSol=0
	method horasDeSol(unaCantidad){horasDeSol=unaCantidad}
	override method horasDeSol()= horasDeSol
	override method condicionAlternativa()= anioSemilla <2005
	override method cuantoEspacioOcupa()= 0.5
	override method condicionIdeal(unaParcela)= not unaParcela.hayPlantaMayorAMetroYMedio()
}


