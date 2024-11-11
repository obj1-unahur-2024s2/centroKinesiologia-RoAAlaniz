import kine.*

object centroKine {
    const pacientes = []
    const aparatos = []

    method colorAparatos() = aparatos.map({a => a.color()}) 
    method pacientesMenoresA(unValor) = pacientes.filter({p => p.edad() == 8})
    method cantPacientesSinCumplirSesion() = pacientes.count({p => ! p.puedeHacerRutina()})
    method agregarPaciente(unPaciente) {
        pacientes.add(unPaciente)
    }
    method agregarAparatos(algunosAparatos) {
        aparatos.addAll(algunosAparatos)
    }
    method agregarPacientes(unaLista){
        pacientes.addAll(unaLista)
    }
    method estoyComplicado() = 
        self.cantNecesitanMantenimiento() >= aparatos.size().div(2)

    method cantNecesitanMantenimiento(){
        return aparatos.count{a=> a.necesitaMantenimiento()}
    }
    method realizarMantenimiento() {
        self.aparatosQueNecesitanMantenimiento().forEach({a=>a.realizarMantenimietno()})
    }
    method aparatosQueNecesitanMantenimiento() =
        aparatos.filter({a=> a.necesitaMantenimiento()})
}