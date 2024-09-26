import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANEEE! WIII")
		game.schedule(2000, { game.addVisual(muro) game.addVisual(gameWin)})  /// EXTRA
    game.schedule(2800, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"
  
	method position() = game.at(self.limiteX(),0)

  method limiteX() = pepita.position().x().max(3)

	method teEncontro(ave) {
		if(ave.esAtrapada(self)){
      game.say(ave, "PERDI! AAAA AYUDA POR FAVOR")
      game.schedule(2000, { game.addVisual(muro) game.addVisual(gameOver)}) /// EXTRA
      game.schedule(2800, { game.stop() })
    }
	}
	
}

/// TODO ESTO ES EXTRA :)
object muro {
  method position() = game.origin()

  method image() = "fondo.jpg"
}
object gameOver {
  method position() = game.at(4,5)

  method text() = "Pepita murió. La mataste."
  method textColor() = "#FF0000"
}

object gameWin {
  method position() = game.at(4,5)

  method text() = "Pepita sobrevivió otro día. Gracias."
  method textColor() = "#FF0000"
}