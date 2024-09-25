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
    if(!self.estaCansada() && self.limitesX() && self.limitesY()){
		  self.vola(position.distance(nuevaPosicion))
		  position = nuevaPosicion
    } else {
      game.addVisual(muro)
      game.addVisual(gameOver)
      game.stop()
    }
	}

  method limitesX() = self.position().x().between(0, 11)
  method limitesY() = self.position().y().between(0, 11)

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method gravedad() {
    if(self.limitesY())
    	position = position.down(1)
  	}

}

