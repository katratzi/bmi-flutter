import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  void selectMale() {}

  void selectFemale() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardChild: IconContent(
                            iconData: FontAwesomeIcons.mars, label: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        })),
                Expanded(
                    child: ReusableCard(
                  colour: selectedGender == Gender.female
                      ? kactiveCardColour
                      : kinactiveCardColour,
                  cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kactiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text('130', style: kNumberTextStyle),
                    Text('cm', style: klabelTextStyle),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(colour: kactiveCardColour)),
                Expanded(child: ReusableCard(colour: kactiveCardColour)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: kbottomContainerColour,
            height: kbottomContainerHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
