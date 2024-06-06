import Parcelas.*
import semillas.*
object inta {
	const parcelas=[]
	method promedioDePlantasPorParcela()= parcelas.sum{p=>p.cantidadDePlantas()/parcelas.size()}
	method parcelaAutosustentable()=parcelas.filter{p=>p.cantidadDePlantas()>4}.max{p=>p.cantidadBienAsociadas()}
}
