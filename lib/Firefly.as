package lib {

	import flash.display.MovieClip;
	import flash.events.*;

	import lib.calc;

	//----------------------------------------------
	// Author: Andrés Felipe Ceballos Marín
	// eMail: andresfcebas@gmail.com
	//----------------------------------------------

	public class Firefly extends MovieClip {

		private var mueveX: Number;
		private var mueveY: Number;
		private var trans: Number;
		private var velocidad: Number;

		private var globalInitX: Number;
		private var globalInitY: Number;
		private var globalFinalX: Number;
		private var globalFinalY: Number;

		public function Firefly(initX: Number, initY: Number, finalX: Number, finalY: Number) {

			mueveX = calc.randRange(initX, finalX);
			mueveY = calc.randRange(initY, finalY);

			trans = calc.randRange(20, 100) / 100;
			velocidad = 30;

			globalInitX = initX;
			globalInitY = initY;
			globalFinalX = finalX;
			globalFinalY = finalY;
		}

		public function moveFireflies(): void {
			this.addEventListener(Event.ENTER_FRAME, eventoEnterFrame);
		}

		function eventoEnterFrame(event: Event): void {			
			this.x += (mueveX - this.x) / velocidad;
			this.y += (mueveY - this.y) / velocidad;

			this.alpha += (trans - this.alpha) / (velocidad / 3);

			if (trans < 1) {
				trans += 0.01;
			} else {
				trans = 0;
			}

			if (this.x > globalInitX && this.x < globalFinalX) {

				if (this.y > globalInitY && this.y < globalFinalY) {

					//Escala de la luciérnaga, para perspectiva 3D
					this.scaleY = this.scaleX = ((this.y - globalInitY) / (globalFinalY - globalInitY)) * (5);

					//Movimiento de la luciérnaga
					mueveX += calc.randRange(-5, 5);
					mueveY += calc.randRange(-5, 5);

				} else {
					mueveX = calc.randRange(globalInitX, globalFinalX);
					mueveY = calc.randRange(globalInitY, globalFinalY);
				}
			} else {
				mueveX = calc.randRange(globalInitX, globalFinalX);
				mueveY = calc.randRange(globalInitY, globalFinalY);
			}
		}
	}
}