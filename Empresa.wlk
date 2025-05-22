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
    var property provincia
    method puedeSerAtendido(unProfesional) {
        return unProfesional.puedeTrabajar(provincia)
    }
}
class Institucion {//probar
    const property universidades = #{}
    method puedeSerAtendido(unProfesional) {
        return universidades.any({uni => uni == unProfesional.universidad()})
    }
}


/*
hacer test 
los profesionales libres se guardan todo lo que cobran. Debe mantenerse el total recaudado por cada uno.
Un profesional libre le puede pasar una cantidad X de dinero a otro: se resta X del total recaudado, y el otro cobra X. P.ej. si ruben tiene 10000 de total recaudado, nora tiene 12000, y hacemos
nora.pasarDinero(ruben,4000)
entonces nora pasa a tener 8000, y ruben 14000 (porque cobró 4000).
*/