
object knightRider {
  method peso() = 500
  method peligro() = 10
  method espacioBulto() = 1 
  method cambiar(){} 
}
object bumblebee {
  var modo = auto
  method definirModo(nuevoModo){modo = nuevoModo} 
  method peso() = 800
  method peligro() = modo.peligro()
   method espacioBulto() = 2
   method cambiar(){modo = robot} 
}
object auto {
  method peligro() {
    return 15
  }
}
object robot {
    method peligro() {
    return 30
  }
}
object ladrillos {
  var cantidad = 10
  method definirCantidad(cantidadLadrillos) {cantidad = cantidadLadrillos} 
  method peso() = cantidad * 2
  method peligro() = 2
  method espacioBulto(){if(cantidad >= 100){return 1}
  else{
  return self.estaEntre101y300()}
  }
  method estaEntre101y300(){
  if(cantidad.between(101, 300)){return 2}else{return 3}
  }
  method  cambiar() {cantidad =+ 12} 
}
object arenaAGranel {
  var peso = 10
  method definirPeso(nuevoPeso){peso = nuevoPeso} 
  method peso() = peso
  method peligro() = 1
   method espacioBulto() = 1 
   method cambiar(){peso =- 10} 
}
object residuos {
  var peso = 0
  method nuevoPeso(nuevoPeso) { peso = nuevoPeso} 
  method peso() = peso 
  method peligrosidad() = 200 
   method espacioBulto() = 1 
   method cambiar() {peso =+ 15} 
}
object bateriaAntiárea{
  var tieneMisiles = true
  method definirMisiles(estado){tieneMisiles = estado} 
  method espacioBulto(){
      if(tieneMisiles){
    return 2}
    else{
    return 1}
    }
  method peso(){
    if(tieneMisiles){
    return 300}
    else{
    return 200}
  } 
    method peligro(){
    if(tieneMisiles){
    return 100}
    else{
    return 0}
  } 
  method cambiar(){tieneMisiles = true} 
}
object contenedorPortunario{
  const cosas = []
    method agregarCosas(cosa) {
    cosas.add(cosa)
  }
  method peso() {
  return cosas.map({c => c.peso()}).sum() + 100
}
  method peligro() {
    if(cosas.isEmpty())
    {
        return 0
    }
    else
    {
        return cosas.map({c => c.peligro()}).max()
    }
    }
    method espacioBulto() = 1 + cosas.sum({c => c.espacioBulto()})
    method cambiar() {cosas.forEach({c => c.cambiar()})} 
}
object embalajeDeSeguridad{
  var cosaQueEnvulve = bumblebee
   method definirQueEnvuelve(cosa){cosaQueEnvulve = cosa} 
  method peso() = cosaQueEnvulve.peso() 
  method peligro() = cosaQueEnvulve.peligro() / 2 
   method espacioBulto() = 2
   method cambiar() {} 
}