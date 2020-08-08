
import 'dart:math';

class CalculateBMW {
  CalculateBMW({this.height, this.weight});
  final int height;
  final int weight;

  double _bmw;
//Sove for BMW
  String BMWsolve() {
    _bmw = weight / pow(height/100, 2);
    return _bmw.toStringAsFixed(1);
  }

  String Interprete() {
    if (_bmw >= 25) {
      return "OverWeight";
    } else if (_bmw > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }


// To Recommend what user should do. if overweight or underweight
String Recondons(){
if (_bmw >= 25) {
      return "Omo you too dey fat, try do excersice so you go calm down";
    } else if (_bmw >= 18.5) {
      return "Alaye you dey okay, You na correct guy!!!";
    } else {
      return "Why you no dey like Chop food ? Abii you no get money ? try Chop oh. E get as you be ";
    }
}


}
