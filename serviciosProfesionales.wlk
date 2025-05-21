class Universidad {
    const property provincia
    var property honorarios
    
}

class ProfesionalVinculado {
    const property universidad
    method puedeTrabajar() = #{universidad.provincia()}
    method honorarios() = universidad.honorarios()  
}

class ProfesionalAsociados {
    const property universidad
    method puedeTrabajar() = #{"Entre Rios", "Santa Fe", "Corrientes"}
    method honorarios() = 3000

}

class ProfesionalLibre {
    const property universidad
    var property puedeTrabajar
    var property honorarios
}

class EmpresaDeServicio {
    var property profesionales
    var property honorarios//de referencia

    method cantProfesionalesContratados(unaUniversidad) {
        return self.profesionalesContratados(unaUniversidad).size()
    }
    method profesionalesContratados(unaUniversidad) {
        return profesionales.filter({profesional => profesional.universidad() == Universidad})
    }
    method profesionalesCaros() {
        return profesionales.filter({profesional => profesional.honorarios() > honorarios})
    }
    method universidadesFormadoras() {//TESTEAR
        return profesionales.map({profesional => profesional.universidad()})
    }
    method profesionalMasBarato() {
        return profesionales.min({profesional => profesional.honorarios()})
    }
    method genteAcotada() {
        return profesionales.all({profesional => profesional.puedeTrabajar().size() <= 3})
    }

}
