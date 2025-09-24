import wollok.game.*

object capy {
  var property position = game.origin()
  var impactoEnLaHuellaDeCarbonoTotal = 0 
  
  method recolectarBasura(basura){
    game.removeVisual(basura)
    game.say(self, "Recolecté: " + basura.nombre())
    impactoEnLaHuellaDeCarbonoTotal += basura.impactoEnLaHuellaDeCarbono()
  }
  
  method tratar(){
    impactoEnLaHuellaDeCarbonoTotal = (impactoEnLaHuellaDeCarbonoTotal - 20).max(0)
  }
  
  method impactoEnLaHuellaDeCarbono() = impactoEnLaHuellaDeCarbonoTotal

  method salvarTortuga(){
    tortuga.salvar()
  }
  
  method image() = "capy_tranqui.png"
}

object tortuga {
  var contaminada = true
  var property position = game.at(7,3)

  method colisionarCon(capy) {
    game.say(capy, "Hay que ayudarla")
    game.say(self, "Estoy contaminada :(, aprieta N para ayudarme")
    }
  
  method salvar() {
    contaminada = false
  }

  method image() {
    if (contaminada) {
      return "tortugaContaminada.png"
    } else {
      return "tortugaSana.png"
    }
  }
}