import Empresa.*
class Universidad {
    const property provincia = #{}
    var property honorarios
    var property donaciones = 0
    method recibirDonacion(monto) {
        donaciones += monto
    }
}
object asociacionProfesionalesDelLitoral {
    var property recaudado = 0
    method recibirRecaudacion(monto) {
        recaudado += monto
    }
}
class ProfesionalVinculado {
    const property universidad
    method puedeTrabajar() = universidad.provincia()
    method honorarios() = universidad.honorarios()
    var property dinero = 0
    method cobrar(monto) {
        self.donarA(universidad, monto / 2)
    }
    method donarA(unaUniversidad, monto) {
        universidad.recibirDonacion(monto)
    }
}

class ProfesionalAsociado {
    const property universidad
    method puedeTrabajar() = #{"Entre Rios", "Santa Fe", "Corrientes"}
    method honorarios() = 3000
    var property dinero = 0
    method cobrar(monto) {
        asociacionProfesionalesDelLitoral.recibirRecaudacion(monto)
    }
}

class ProfesionalLibre {
    const property universidad
    var property puedeTrabajar = #{}
    var property honorarios
    var property dinero = 0
    method cobrar(monto) {
        dinero += monto
    }
    method pasarDinero(profLibre, monto) {
        if (dinero >= monto) {
            profLibre.cobrar(monto)
            dinero -= monto
        }
    }
    method agregarProvincia(unaProvincia) {
        puedeTrabajar.add(unaProvincia)
    }
}


