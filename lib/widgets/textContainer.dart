import 'package:flutter/material.dart';
import 'package:neumorphic_flutter/pages/homePage.dart';
import 'package:neumorphic_flutter/styles/hourglazz_Palette.dart';

class NeumorphicTextContainer extends StatefulWidget {
  NeumorphicTextContainer(this.content) : super();

  final content;

  @override
  _NeumorphicTextContainerState createState() =>
      _NeumorphicTextContainerState();
}

class _NeumorphicTextContainerState extends State<NeumorphicTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.2,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: ConcaveDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            colors: HomePage.darkMode
                ? [
                    HourglazzPalette().hourglazzGrey,
                    HourglazzPalette().hourglazzShadowGrey,
                  ]
                : [
                    HourglazzPalette().hourglazOffwhite,
                    HourglazzPalette().hourglazzGrey,
                  ],
            depth: 12.0,
            opacity: 0.7),
        child: widget.content);
  }
}
