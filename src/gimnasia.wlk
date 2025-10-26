class Rutina {
    var property intensidad = 0
    method descanso(tiempo){
        return 0
    }

    method caloriasBajadas(tiempo){
        return 100 *(tiempo - self.descanso(tiempo)) * self.intensidad()
    }
}

class Running inherits Rutina{

    override method descanso(tiempo){
        if (tiempo > 20){
           return 5
        } else {return 2}
    }
}

class Maraton inherits Running{
    override method caloriasBajadas(tiempo){ return super(tiempo)*2}
}

class Remo inherits Rutina{
    override method intensidad(){
        return 1.3}
    override method descanso(tiempo){
        return tiempo/5}
}

class RemoDeCompeticion inherits Remo{
    override method intensidad(){
        return 1.7}
    override method descanso(tiempo){
    return (super(tiempo)-3).max(2)}
}

class Persona {
    var property peso = 60
    var property tiempo = 0
    method kilosPorCaloriasQuePierde(){
        return 0
    }
    method pesoPerdido(rutina){
        return rutina.caloriasBajadas(self.tiempo())/ self.kilosPorCaloriasQuePierde()
    }
    method aplicarRutina(rutina){
        return self.peso() - self.pesoPerdido(rutina)
    }
}
class PersonaSedentaria inherits Persona{
    override method kilosPorCaloriasQuePierde(){
        return 7000}
    method verificarQuePesaMasDe(n){
        if (self.peso() < n) {
            self.error ( "la persona pesa menos de" + n)
        }}
    override method aplicarRutina(rutina){
        if(self.peso()< 50){
            return self.peso()
        }else{
        return super(rutina)}
    }
}

class PersonaAtleta inherits Persona{
    override method tiempo() {
        return 90
    }
    override method pesoPerdido(rutina){
        return super(rutina) - 1
    }
    override method kilosPorCaloriasQuePierde(){
        return 8000}
    method verificarQueRutinaConsumaMasDe10000(rutina){
        if(rutina.caloriasBajadas(self.tiempo()) < 10000){
            self.error("La rutina consume menos de 10000 calorias")
        }
    }
    override method aplicarRutina(rutina){
        if (rutina.caloriasBajadas(self.tiempo()) < 10000){
            return self.peso()
        }else{
        return super(rutina)}
    }
}