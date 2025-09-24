import wollok.game.*

object posicionAleatoria {
  method calcular() = game.at(
    0.randomUpTo(game.width()).truncate(0),
    0.randomUpTo(game.height()).truncate(0)
  )
}

object nuevaPosicion {
  var x = 0

  method HaciaLaDerecha(){
    x += 1
    return game.at(x, 5)
  }
  
  method HaciaLaIzquierda(){
      x -= 1
    return game.at(x, 5)
  }
}
