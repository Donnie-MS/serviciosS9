import serviciosProfesionales.*

class EmpresaDeServicios {
    var property profesionales = #{}
    var property honorarios//de referencia
    var property clientes = #{}
    method darServicio(unSolicitante) {
        var profesional = profesionales.find({profesional => unSolicitante.puedeSerAtendido(profesional)})
        profesional.cobrar(profesional.honorarios())
        self.agregarCliente(unSolicitante)
    }
    method eliminarCliente(unCliente) {
        clientes.remove(unCliente)
    }
    method agregarCliente(unCliente) {
        clientes.add(unCliente)
    }
    method cantClientes() {
        return clientes.size()
    }
    method esCliente(unSolicitante) {
        return clientes.contains(unSolicitante)
    }
    method cantProfesionalesContratados(unaUniversidad) {
        return self.profesionalesContratados(unaUniversidad).size()
    }
    method cantProfesionalesContratados() {
        return profesionales.size()
    }
    method puedeSatisfacer(unSolicitante) {
        return profesionales.any({profesional => unSolicitante.puedeSerAtendido(profesional)})
    }
    method contratar(unProfesional) {
        profesionales.add(unProfesional)
    }
    method despedir(unProfesional) {
        if (profesionales.contains(unProfesional)) {
            profesionales.remove(unProfesional)
        }
    }
    method profesionalesContratados(unaUniversidad) {
        return profesionales.filter({profesional => profesional.universidad() == unaUniversidad})
    }
    method cantProfesionalesCaros() = self.profesionalesCaros().size()
    method profesionalesCaros() {
        return profesionales.filter({profesional => profesional.honorarios() > honorarios})
    }
    method profesionalesBaratos() {
        return profesionales.filter({profesional => profesional.honorarios() <= honorarios})
    }
    method esCaro(unProfesional) {
        return self.profesionalesCaros().contains(unProfesional)
    }
    method esBarato(unProfesional) {
        return self.profesionalesBaratos().contains(unProfesional)
    }
    method universidadesFormadoras() {//Importante
        return profesionales.map({profesional => profesional.universidad()}).asSet()
    }
    method profesionalMasBarato() {
        return profesionales.min({profesional => profesional.honorarios()})
    }
    method esDeGenteAcotada() {
        return profesionales.all({profesional => profesional.puedeTrabajar().size() <= 3})
    }

}
class Club {
    var property provincias = #{}
    method puedeSerAtendido(unProfesional) {
        return not (provincias.intersection(unProfesional.provincia()).isEmpty())
    }
    
}
class Persona {
    var property provincia = #{}
    method puedeSerAtendido(unProfesional) {
        return not (unProfesional.puedeTrabajar().intersection(provincia).isEmpty())
    }
}
class Institucion {//probar
    const property universidades = #{}
    method puedeSerAtendido(unProfesional) {
        return universidades.any({uni => uni == unProfesional.universidad()})
    }
}