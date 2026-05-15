
object knightRider {
  method peso() = 500
  method peligro() = 10
}
object bumblebee {
  var modo = auto
  method definirModo(nuevoModo){modo = nuevoModo} 
  method peso() = 800
  method peligro() = modo.peligro()
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
}
object arenaAGranel {
  var peso = 10
  method definirPeso(nuevoPeso){peso = nuevoPeso} 
  method peso() = peso
  method peligro() = 1
}
object bateriaAntiárea{
  var tieneMisiles = true
  method definirMisiles(estado){tieneMisiles = estado} 
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
}
object residuos {
  var peso = 0
  method nuevoPeso(nuevoPeso) { peso = nuevoPeso} 
  method peso() = peso 
  method peligrosidad() = 200 
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
}
object embalajeDeSeguridad{
  var cosaQueEnvulve = bumblebee
   method definirQueEnvuelve(cosa){cosaQueEnvulve = cosa} 
  method peso() = cosaQueEnvulve.peso() 
  method peligro() = cosaQueEnvulve.peligro() / 2 
}