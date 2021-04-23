import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_flutter/styles/hourglazz_Palette.dart';
import 'package:neumorphic_flutter/widgets/appbar.dart';
import 'package:neumorphic_flutter/widgets/clickerButton.dart';
import 'package:neumorphic_flutter/widgets/textContainer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static bool darkMode = false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomePage.darkMode
          ? HourglazzPalette().hourglazzDarkGrey
          : HourglazzPalette().hourglazzLightGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NeumorphicAppBar(leading: _darkModeToggle, items: appBarElements()),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Neumorphic Counter",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: HomePage.darkMode
                              ? HourglazzPalette().hourglazzYellow
                              : HourglazzPalette().hourglazzDarkGrey,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: EdgeInsets.all(35),
                  child: NeumorphicTextContainer(Container(
                      padding: EdgeInsets.all(15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '$_counter',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            color: HomePage.darkMode
                                ? HourglazzPalette().hourglazzYellow
                                : HourglazzPalette().hourglazzDarkGrey,
                          )),
                          textAlign: TextAlign.left,
                        ),
                      ))),
                ),
                NeumorphicButton(
                  action: _incrementCounter,
                  diameter: 35,
                  icon: Icons.add,
                ),
              ],
            )),
            Container()
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _darkModeToggle() {
    print('toggle');
    setState(() {
      HomePage.darkMode = !HomePage.darkMode;
    });
  }

  List<Widget> appBarElements() {
    var appBarTopPadding = MediaQuery.of(context).size.height * 0.05;
    var appBarLeftPadding = MediaQuery.of(context).size.width * 0.08;

    List<Widget> appBarElements = [
      Padding(
          padding:
              EdgeInsets.only(top: appBarTopPadding, left: appBarLeftPadding),
          child: NeumorphicButton(
            action: _darkModeToggle,
            diameter: 11,
            icon: Icons.nightlight_round,
          )),
      /*
      Padding(
          padding: EdgeInsets.only(
            top: appBarTopPadding,
            left: appBarLeftPadding * 0.5,
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
      
      Padding(
          padding: EdgeInsets.only(
            top: appBarTopPadding,
            right: appBarLeftPadding,
          ),
          child: NeumorphicButton(
            action: _darkModeToggle,
            diameter: 11,
            icon: Icons.account_circle,
          )),
          */
    ];

    return appBarElements;
  }
}
