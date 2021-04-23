import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_flutter/pages/homePage.dart';
import 'package:neumorphic_flutter/styles/hourglazz_Palette.dart';

import 'clickerButton.dart';

class NeumorphicAppBar extends StatefulWidget {
  NeumorphicAppBar({this.leading, this.items}) : super();
  final Function leading;
  final List<Widget> items;

  @override
  _NeumorphicAppBarState createState() => _NeumorphicAppBarState();
}

class _NeumorphicAppBarState extends State<NeumorphicAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.items.length > 2
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.items,
      /*
      [
        Padding(
            padding: EdgeInsets.only(top: topPadding, left: leftPadding),
            child: NeumorphicButton(
              action: widget.leading,
              diameter: 11,
              icon: Icons.nightlight_round,
            )),
        Padding(
            padding: EdgeInsets.only(
              top: topPadding,
              left: leftPadding * 0.5,
            ),
            child: Text("Flutter Demo Page",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: HomePage.darkMode
                          ? HourglazzPalette().hourglazzYellow
                          : HourglazzPalette().hourglazzDarkGrey,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold),
                ))),
      ],
      */
    );
  }
}
