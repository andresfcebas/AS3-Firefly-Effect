package lib {

	//----------------------------------------------
	// Author: Andrés Felipe Ceballos Marín
	// eMail: andresfcebas@gmail.com
	//----------------------------------------------

	public class calc {

		public function calc() {

		}

		public static function randRange(min: Number, max: Number): Number {
			var randomNum: Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
	}

}