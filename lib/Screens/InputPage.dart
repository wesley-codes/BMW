import 'package:flutter/material.dart';
import 'package:bmw/Calculate_BMW.dart';
import 'package:bmw/Widgets/IconContent.dart';
import 'package:bmw/Screens/InputPage.dart';
import 'package:bmw/Widgets/RoundButtonIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const/Const.dart';
import 'ResultPage.dart';
import '../Widgets/BottomButton.dart';

const InActiveCardColor = Color(0xFF4E493F);
const CalculateContainerColor = Colors.red;
const ActiveCardColor = Color(0xFFFA9883);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = InActiveCardColor;
  Color femaleCardColour = InActiveCardColor;
  Gender selectedGender;

  int height = 20;
  int weightIncrease = 10;
  int age = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BWM CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cardbox(
                      colour: selectedGender == Gender.male
                          ? ActiveCardColor
                          : InActiveCardColor,
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardchild: IconContent(
                        caption: "Male",
                        icons: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: Cardbox(
                      colour: selectedGender == Gender.female
                          ? ActiveCardColor
                          : InActiveCardColor,
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardchild: IconContent(
                        caption: "Female",
                        icons: FontAwesomeIcons.venus,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cardbox(
              colour: InActiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Height",
                      style: KlabelTextStyle,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: KlabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF747DE7),
                      overlayColor: Color(0x29747DE7),
                      inactiveTrackColor: Colors.white,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: CalculateContainerColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 200,
                      onChanged: (double value) {
                        print(value);
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cardbox(
                    colour: InActiveCardColor,
                    cardchild: Column(
                      children: [
                        Text(
                          "Weight",
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weightIncrease.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weightIncrease++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weightIncrease--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Cardbox(
                    colour: InActiveCardColor,
                    cardchild: Column(
                      children: [
                        Text(
                          "Age",
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContainerButton(
            onPressed: () {
              CalculateBMW calc = CalculateBMW(height: height);
              CalculateBMW(weight: weightIncrease);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (ResultPage(
                      bMwSolve: calc.BMWsolve(),
                      interprete: calc.Interprete(),
                      reconds: calc.Recondons(),
                    )),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

class Cardbox extends StatelessWidget {
  Cardbox({this.icons, @required this.colour, this.cardchild, this.onpressed});
  final Icon icons;
  final Widget cardchild;
  final Color colour;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Center(child: cardchild),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
