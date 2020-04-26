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
  int height = 180;
  int weight = 60;

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
                    Text(height.toString(), style: kNumberTextStyle),
                    Text('cm', style: klabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xff8d8e98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x29eb1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
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
