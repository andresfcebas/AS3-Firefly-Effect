package src {

	import flash.display.MovieClip;
	import flash.display.Sprite;

	import lib.calc;
	import lib.Firefly;

	//----------------------------------------------
	// Author: Andrés Felipe Ceballos Marín
	// eMail: andresfcebas@gmail.com
	//----------------------------------------------

	public class main extends MovieClip {

		// Dimensiones del escenario de las luciérnagas
		private var globalInitX: Number;
		private var globalInitY: Number;
		private var globalFinalX: Number;
		private var globalFinalY: Number;

		//Número de Luciernagas a salir
		private var numFireflies: Number;

		//Función principal
		public function main() {

			//Definición de los límites de las luciérnagas
			globalInitX = 0;
			globalInitY = 400;
			globalFinalX = 1280;
			globalFinalY = 720;

			//Definición del número de luciérnagas
			numFireflies = 100;

			//Llamada a procedimiento inicial
			initial();
		}

		public function initial(): void {

			//Variable contenedora de las luciérnagas
			var fireflies: Sprite = new Sprite();

			for (var i = 1; i <= numFireflies; i++) {

				var _firefly: Firefly = new Firefly(globalInitX, globalInitY, globalFinalX, globalFinalY);

				_firefly.x = calc.randRange(globalInitX, globalFinalX);
				_firefly.y = calc.randRange(globalInitY, globalFinalY);

				_firefly.name = "firefly" + i;

				fireflies.addChild(_firefly);
				_firefly.moveFireflies();
			}

			this.addChild(fireflies);
		}
	}

}