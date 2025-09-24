import wollok.game.*
import utilidades.*
import combustibles.*

object lataDeCerveza {
  var property position = posicionAleatoria.calcular()
  var property longitudCm = 10
  
  method impactoEnLaHuellaDeCarbono() = 5 * longitudCm
  method nombre() = "lata_roja"
  method image() = self.nombre() + ".png"

  method esReciclable() = true
  
  method tratar() {
    longitudCm *= 0.9
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)

  }
}

object cigarros {
  var property position = game.at(0,5)
  var direccion = "derecha"
  const impactoEnHuellaDeCarbono = 80

  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono
  method nombre() =  "cigarrillos"
  method image() = self.nombre() + ".png"
  method esReciclable() = false

  method arrastradoPorElAgua() {
    if (direccion == "derecha"){
      if(position == game.at(9,5)){
        direccion = "izquierda"
        position = nuevaPosicion.HaciaLaIzquierda()
      }else{
          position = nuevaPosicion.HaciaLaDerecha()
      }
    }else if (direccion == "izquierda") {
      if (position == game.at(0,5)) {
        direccion = "derecha"
        position = nuevaPosicion.HaciaLaDerecha()
      } else{
        position = nuevaPosicion.HaciaLaIzquierda()
      }
    }
  }

  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("arrastradoPorElAgua")
  }
}

object botellaDeGaseosa {
  var impactoEnHuellaDeCarbono = 100
  var property position = posicionAleatoria.calcular()
  
  method impactoEnLaHuellaDeCarbono() = impactoEnHuellaDeCarbono

  method nombre() = "lata_naranja"

  method image() = self.nombre() + ".png"  

  method esReciclable() = true
  
  method tratar() {
    impactoEnHuellaDeCarbono -= 5
  }
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
  }
}

object barrilDeCombustible {
  var property position = posicionAleatoria.calcular()
  var combustibleActual = biogas
  var combustibleAnterior = gasoil
  
  method impactoEnLaHuellaDeCarbono() = combustibleActual.consumo()
  
  method esReciclable() = false
  method nombre() =  "barril"
  method image() = self.nombre() + "_" + combustibleActual.sufijo()+ "_" + ".png"

  method cambiarCombustible() {
    const aux = combustibleActual
    combustibleActual = combustibleAnterior
    combustibleAnterior = aux
  }
  
  method combustibleActual() = combustibleActual
  
  method colisionarCon(capy) {
    capy.recolectarBasura(self)
    game.removeTickEvent("cambiarCombustible")
  }
}