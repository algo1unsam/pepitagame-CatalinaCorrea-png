import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"
  
	method position() = game.at(self.limiteX(),0)

  method limiteX() = pepita.position().x().max(3)

	
}

object muro {
  method position() = game.origin()

  method image() = "fondo.jpg"
}
object gameOver {
  method position() = game.at(4,5)

  method text() = "Pepita murió. La mataste."
  method textColor() = "#FF0000"
}
