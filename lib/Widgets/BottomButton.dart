import 'package:flutter/material.dart';
import '../const/Const.dart';



class ContainerButton extends StatelessWidget {
  ContainerButton({@required this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.black,
        margin: EdgeInsets.only(top: 10.0),
        height: 70,
        width: double.infinity,
        child: Center(
          child: Text(
            "CALCULATE",
            style: KlabelTextStyle,
          ),
        ),
      ),
    );
  }
}