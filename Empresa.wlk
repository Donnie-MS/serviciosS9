import serviciosProfesionales.*


class EmpresaDeServicios {
    var property profesionales = #{}
    var property honorarios//de referencia

    method cantProfesionalesContratados(unaUniversidad) {
        return self.profesionalesContratados(unaUniversidad).size()
    }
    method cantProfesionalesContratados() {
        return profesionales.size()
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