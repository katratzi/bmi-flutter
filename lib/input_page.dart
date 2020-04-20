import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xff1d1e33);
const inactiveCardColour = Color(0xff111328);
const bottomContainerColour = Color(0xffeb1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleSelected = false;
  bool femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleSelected = !maleSelected;
                      femaleSelected = false;
                    });
                  },
                  child: ReusableCard(
                    colour:
                        maleSelected ? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleSelected = !femaleSelected;
                      maleSelected = false;
                    });
                  },
                  child: ReusableCard(
                    colour:
                        femaleSelected ? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                )),
              ],
            ),
          ),
          Expanded(child: ReusableCard(colour: activeCardColour)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: activeCardColour)),
                Expanded(child: ReusableCard(colour: activeCardColour)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: bottomContainerColour,
            height: bottomContainerHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
