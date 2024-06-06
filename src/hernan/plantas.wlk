import parcelas.*

class Planta{
	const property anioDeObtencion
	var property altura
	method horasToleradas()
	method esFuerte(){return self.horasToleradas()>10}
	method daNuevasSemillas()
	method espacioQueOcupa()
	method parcelaIdeal(parcela)
}

class Menta inherits Planta{
	override method horasToleradas()=6
	override method daNuevasSemillas(){
		return self.altura()>0.4
	}
	override method espacioQueOcupa(){
		return self.altura()*3
	}
	override method parcelaIdeal(parcela){
		return parcela.superficie()>6
	}
}

class Soja inherits Planta{
	override method horasToleradas(){
		return if(self.altura()<0.5)6 else if(self.altura()<1)7 else 9
	}
	override method daNuevasSemillas(){
		return self.anioDeObtencion()>2007&&self.altura()>1
	}
	override method espacioQueOcupa(){
		return self.altura()/2
	}
	override method parcelaIdeal(parcela){
		return parcela.horasAlSol()==self.horasToleradas()
	}
}

class Quinoa inherits Planta{
	const property horasToleradas
	override method daNuevasSemillas(){
		return self.anioDeObtencion()<2005
	}
	override method espacioQueOcupa()=0.5
	override method parcelaIdeal(parcela){
		return parcela.plantas().all({p=>p.altura()<=1.5})
	}
}

class SojaTrangenica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	override method parcelaIdeal(parcela){
		return parcela.cantidadMaxima()==1
	}
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa(){
		return super()*2
	}
}

