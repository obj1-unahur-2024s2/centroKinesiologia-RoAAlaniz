class Paciente {
  var edad
  var fortalezaMuscular
  var dolor

  method edad() = edad
  method fortalezaMuscular() = fortalezaMuscular 
  method dolor() = dolor
  method cumplirAnios(){
    edad += 1
  }
  method disminuirDolor(unValor) {
    dolor = (dolor - unValor).max(0)
  }
  method aumentarFortaleza(unValor) {
    fortalezaMuscular += unValor
  }
  method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)
  method usar(unAparato) {
    if (self.puedeUsar(unAparato))
      unAparato.consecuenciaDelUso(self)
  }
}

class Aparato {
  method consecuenciaDelUso(unPaciente)
  method puedeSerUsadoPor(unPaciente)
}

class Magneto inherits Aparato {
  var magneto= 800
  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
    magneto -= 1
  }
  override method puedeSerUsadoPor(unPaciente) = true
}

class Bicicleta inherits Aparato {
  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente) {
    return unPaciente.edad() > 8
  }
}

class Minitramp inherits Aparato {
  override method consecuenciaDelUso(unPaciente){
    unPaciente.aumentarFortaleza(unPaciente.edad() * 0.1)
  }
  override method puedeSerUsadoPor(unPaciente) {
    return unPaciente.dolor() < 20
  }  
}