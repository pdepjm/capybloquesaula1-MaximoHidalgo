import wollok.game.*

object plantaDeTratamiento {
  var property position = game.at(8, 8)
  
  method image() = "planta.png"
  
  method colisionarCon(capy) {
      capy.tratar()
      game.schedule(2000, { 
        game.say(capy, "Aprieta H para saber el impacto en la huella de carbono de la basura que recolectaste")
      })
  }
}

object fabricaDeDesechos {
  var property position = game.at(3, 6)
  
  method image() = "fabricaDeDesechos.png"
  
  method colisionarCon(capy) {
    game.say(capy, "Esta contaminando todo")
    }
}