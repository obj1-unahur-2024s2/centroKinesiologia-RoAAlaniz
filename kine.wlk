class Paciente {
  var edad
  var fortaleza
  var dolor

  method edad() = edad
  method cumplirAnio() {
    edad += 1
  }  
  method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)
  method usar(unAparato) {
    if (self.puedeUsar(unAparato))
      unAparato.consecuenciaDelUso(self)
  }
  method disminuirDolor(unValor) {
    dolor = 0.max(dolor - unValor)
  }   
  method aumentarFortaleza(unValor) {
    fortaleza += unValor
  }
}

class Aparato {
  method puedeSerUsadoPor(unPaciente)
  method consecuenciaDeUso(unPaciente) 
}

class Magneto inherits Aparato {
  var magneto
  override method consecuenciaDeUso(unPaciente) {
    unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
    magneto -= 1
  }
  override method puedeSerUsadoPor(unPaciente){
    return true
  }
}

class Bicicleta inherits Aparato {
  override method consecuenciaDeUso(unPaciente) {
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente){
    unPaciente.edad() > 8
  }
}

class Minitramp inherits Aparato {
  override method consecuenciaDeUso(unPaciente) {
    unPaciente.aumentarFortaleza(unPaciente.edad() * 0.1)
  }
  override method puedeSerUsadoPor(unPaciente){
    unPaciente.dolor() < 20
  }
}