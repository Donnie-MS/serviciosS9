class Universidad {
    const property provincia
    var property honorarios
    
}

class ProfesionalVinculado {
    const property universidad
    method puedeTrabajar() = #{universidad.provincia()}
    method honorarios() = universidad.honorarios()  
}

class ProfesionalAsociado {
    const property universidad
    method puedeTrabajar() = #{"Entre Rios", "Santa Fe", "Corrientes"}
    method honorarios() = 3000

}

class ProfesionalLibre {
    const property universidad
    var property puedeTrabajar = #{}
    var property honorarios
    method agregarProvincia(unaProvincia) {
        puedeTrabajar.add(unaProvincia)
    }
}


