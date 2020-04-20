import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(color: Color(0xff8d8d98), fontSize: 18.0);

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String label;

  const IconContent({@required this.iconData, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: 80.0),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
