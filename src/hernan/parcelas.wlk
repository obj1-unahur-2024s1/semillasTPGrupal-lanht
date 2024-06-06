import plantas.*

class Parcela{
	const ancho //mts
	const largo //mts
	const property horasAlSol // Xdia
	const plantas=[]
	
	method plantas()=plantas
	method superficie()=ancho*largo
	method cantidadMaxima(){
		return if(ancho>largo)self.superficie()/5
			else self.superficie()/3+largo
	}
	method tieneComplicaciones(){
		return plantas.any({p=>p.horasToleradas()<horasAlSol})
	}
	method plantarPlanta(planta){
		if(plantas.size()<self.cantidadMaxima()&&horasAlSol<planta.horasToleradas()+2)
			plantas.add(planta)
	}
	method seAsociaBien(planta)
	method cantidadPlantasAsociadas(){
		return plantas.count({p=>self.seAsociaBien(p)})
	}
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(planta){
		return !self.tieneComplicaciones()&&planta.parcelaIdeal(self)
	}
}
class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(planta){
		return self.plantas().size()<=2&&planta.esFuerte()
	}
}

object inta{
	const parcelas=[]
	method promedioDePlantas(){
		return parcelas.sum({p=>p.plantas().size()}) / parcelas.sum()
	}
	method masSustentable(){
		return parcelas.filter({pa=>pa.plantas().size()>4})
				.max({pa=>pa.cantidadPlantasAsociadas()/pa.plantas().size()})
	}
}