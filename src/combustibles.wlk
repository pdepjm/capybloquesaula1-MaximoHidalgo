object petroleo {
  method consumo() = 1200
  
  method sufijo() = "petroleo"
}

object biogas {
  /* el biogas es el resultado de la degradaciónde materia degradable, así que en si es una forma de reciclar */
  method consumo() = 0
  
  method sufijo() = "biogas"
}

object gasoil {
  var pureza = 0.4
  
  method pureza(porcentaje) {
    pureza = porcentaje
  }
  
  method consumo() = 500 * pureza
  
  method sufijo() = "gasoil"
}