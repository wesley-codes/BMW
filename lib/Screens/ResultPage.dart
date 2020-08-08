import 'package:bmw/Screens/InputPage.dart';
import 'package:flutter/material.dart';
import '../const/Const.dart';
import '../Calculate_BMW.dart';

class ResultPage extends StatelessWidget {

  // Using a construct to pass down the input gotten from the InputPage 
  ResultPage(
      {@required this.interprete,
      @required this.reconds,
      @required this.bMwSolve});
  final String interprete;
  final String reconds;
  final String bMwSolve;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMW CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: KlabelTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Cardbox(
              colour: Colors.yellow,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    reconds.toUpperCase(),
                    style: KlabelTextStyle,
                  ),
                  Text(
                    bMwSolve,
                    style: KNumberTextStyle,
                  ),
                  Text(
                    interprete,
                    textAlign: TextAlign.center,
                    style: KlabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ContainedButton(
            child: Text("RE CALCULATE"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
