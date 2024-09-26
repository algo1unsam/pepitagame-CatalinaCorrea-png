import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		if (self.estaEnElNido()) {
			return "pepita-grande.png"
			} else if (self.esAtrapada(silvestre) or self.estaCansada()){
				return "pepita-gris.png"
			} 
			else {
				return "pepita.png"
			}
	}

	method esAtrapada(silvestre) = self.position() == silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
    if(!self.estaCansada()){
		  self.vola(position.distance(nuevaPosicion))
		  position = nuevaPosicion
    } else {
      // game.addVisual(muro)
      game.addVisual(gameOver)  /// EXTRA
      game.schedule(2000, {game.stop()})
    }
	}

  //* LIMITES BORDES
  method limiteL() = self.position().x().between(1, 9)
  method limiteR() = self.position().x().between(0, 8)
  method limiteU() = self.position().y().between(0, 8)

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

  //* METODO PARA GRAVEDAD
	method cae() {
    if(!self.estaEnElSuelo())
    	position = position.down(1)
  	}

}

