import 'package:bmw/Screens/InputPage.dart';

import 'package:flutter/material.dart';

const InActiveCardColor = Color(0xFF4E493F);
const CalculateContainerColor = Colors.red;
const ActiveCardColor = Color(0xFFFA9883);

void main() => runApp(bwmCalculator());


class bwmCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFDDCCF0),
          scaffoldBackgroundColor: Color(0xFFD1ABA6),
        ),
        home: InputPage());
  }
}
