import cosas.*
object camion {
method cantidadBultos() = carga.sum({c => c.espacioBulto()}) 
const carga = []
method tara() = 1000
method pesoDelCamion() {
  return carga.sum({c => c.peso()}) + self.tara()
}
method AgregarCosa(cosa) {
carga.add(cosa)
cosa.cambiar()
}
method SacarCosa(cosa) {carga.remove(cosa)}
method sonTodosLosPesosPares(){carga.all({c => c.peso().even()})}
method algoPesa(peso) {carga.any({c => c.peso() == peso})} 
method es_DePeligroso(nivelPeligro){carga.find({c => c.peligro() == nivelPeligro})}
method cosasPeligrosas(nivelPeligro) {carga.filter({c => c.peligro() > nivelPeligro})} 
method cosasMasPeligrosasQue(cosa) {carga.filter({c => c.peligro() > cosa.peligro()})} 
method elCamionEstaExcedidoDePeso() {return self.pesoDelCamion() > 2500} 
method hayPeligro(nivelPeligro) {return carga.any({c => c.peligro() > nivelPeligro}) }
method puedeCircularEnRuta(nivelPeligro) {
    return not self.elCamionEstaExcedidoDePeso() and not self.hayPeligro(nivelPeligro)}  
method cosaEntre(peso1,peso2){carga.any({c => c.peso().between(peso1, peso2)})}
method cosaMasPesada() {return carga.find({c => c.peso() == carga.map({c => c.peso()}).max()})}
}