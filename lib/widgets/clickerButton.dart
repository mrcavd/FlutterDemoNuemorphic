import 'package:flutter/material.dart';
import 'package:neumorphic_flutter/pages/homePage.dart';
import 'package:neumorphic_flutter/styles/hourglazz_Palette.dart';

class NeumorphicButton extends StatefulWidget {
  NeumorphicButton({this.action, this.diameter, this.icon}) : super();
  final Function action;
  // as a % of the viewport width
  final double diameter;
  final IconData icon;

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
      widget.action();
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Container(
          height: MediaQuery.of(context).size.width * widget.diameter / 100,
          width: MediaQuery.of(context).size.width * widget.diameter / 100,
          decoration: _isPressed ? neumorphicDown() : neumorphicUp(),
          child: IconButton(
            icon: Icon(
              widget.icon,
              // the icon within the button will be fitted inside the
              size: MediaQuery.of(context).size.width * widget.diameter / 160,
              color: HomePage.darkMode
                  ? HourglazzPalette().hourglazzYellow
                  : HourglazzPalette().hourglazzGrey,
            ),
            onPressed: () => {},
          ),
        ));
  }

  Decoration neumorphicUp() {
    return BoxDecoration(
      boxShadow: HomePage.darkMode
          ? [
              BoxShadow(
                color: HourglazzPalette().hourglazzShadowGrey,
                offset: Offset(2, 5),
                blurRadius: 10,
                spreadRadius: 0.5,
              ),
              BoxShadow(
                color: HourglazzPalette().hourglazzGrey,
                offset: Offset(-2, -4),
                blurRadius: 15,
                spreadRadius: 0.1,
              ),
            ]
          : [
              BoxShadow(
                color: HourglazzPalette().hourglazzGrey,
                offset: Offset(2, 5),
                blurRadius: 10,
                spreadRadius: 0.5,
              ),
              BoxShadow(
                color: HourglazzPalette().hourglazzHighlight,
                offset: Offset(-2, -4),
                blurRadius: 15,
                spreadRadius: 0.1,
              ),
            ],
      gradient: HomePage.darkMode
          ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.6,
              ],
              colors: [
                HourglazzPalette().hourglazzDarkerGrey,
                HourglazzPalette().hourglazzDarkGrey,
              ],
            )
          : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.5,
                0.99,
              ],
              colors: [
                HourglazzPalette().hourglazzLightGrey,
                HourglazzPalette().hourglazzHighlight
              ],
            ),
      shape: BoxShape.circle,
    );
  }

  Decoration neumorphicDown() {
    return ConcaveDecoration(
        shape: CircleBorder(),
        colors: HomePage.darkMode
            ? [
                HourglazzPalette().hourglazzGrey,
                HourglazzPalette().hourglazzDarkerGrey,
              ]
            : [
                HourglazzPalette().hourglazzHighlight,
                HourglazzPalette().hourglazzGrey,
              ],
        depth: 10.0,
        opacity: 0.7);
  }
}
