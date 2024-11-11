class Paciente {
  var edad
  var fortalezaMuscular
  var dolor
  const rutina = [] 

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
  method puedeHacerRutina() {
    rutina.all({a => a.puedeUsar(a)})
  }
  method realizarRutina() {
    rutina.forEach({a => a.usar(a)})
  }
}

class Resistente inherits Paciente {
  override method realizarRutina() {
    const cantidad = rutina.count{a => self.puedeUsar(a)}
    super()
    self.aumentarFortaleza(cantidad)
  }
}

class Caprichoso inherits Paciente {
   override method puedeHacerRutina() {
    return self.hayAlgunAparatoRojo()
    super()
    }
  method hayAlgunAparatoRojo() = rutina.any{a => a.color() == "rojo"}
  override method realizarRutina() {
    super()
    super()
  }
}

class RapiRecuperacion inherits Paciente {
  override method realizarRutina() {
    super()
    self.disminuirDolor(disminucionDolor.valor())
  }
}

object disminucionDolor {
  var property valor = 3
}

class Aparato {
  var property color = "blanco"

  method consecuenciaDelUso(unPaciente)
  method puedeSerUsadoPor(unPaciente)
  method necesitaMantenimiento() = false
  method consecuenciasMantenimiento() {}
}

class Magneto inherits Aparato {
  var magneto= 800
  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
    magneto -= 1
  }
  override method puedeSerUsadoPor(unPaciente) = true
  override method necesitaMantenimiento() = magneto < 100
  override method consecuenciasMantenimiento() {
    magneto = (magneto + 500).min(800) 
  }
}

class Bicicleta inherits Aparato {
  var tornillos = 0
  var aceite = 0

  override method consecuenciaDelUso(unPaciente){
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsadoPor(unPaciente) {
    return unPaciente.edad() > 8
  }
  override method necesitaMantenimiento() {
    return tornillos >=10 or aceite >= 5
  }
  override method consecuenciasMantenimiento() {
    tornillos = 0
    aceite = 0
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