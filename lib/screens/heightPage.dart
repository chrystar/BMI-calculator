import 'package:bmi_updated/componets/navigationBotton.dart';
import 'package:bmi_updated/home_screen.dart';
import 'package:bmi_updated/screens/weightpage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

double heightValue = 1;

class HeightPage extends StatefulWidget {
  HeightPage({this.genderHeight});

  final Image? genderHeight;

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  final backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Center(
          child: Text('SELECT YOUR HEIGHT'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 50),
                  height: 550,
                  child: widget.genderHeight,
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 50),
                    height: 600,
                    child: SfLinearGauge(
                      minimum: 1,
                      maximum: 2,
                      isMirrored: true,
                      orientation: LinearGaugeOrientation.vertical,
                      markerPointers: [
                        LinearShapePointer(
                          value: heightValue,
                          onChanged: (value) {
                            setState(() {
                              print(heightValue);
                              heightValue = value;
                              //   print(heightValue);
                            });
                          },
                        ),
                      ],
                      ranges: [
                        LinearGaugeRange(
                          endValue: heightValue,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                height_button(
                  buttonIcon: Icon(Icons.arrow_back),
                  text: 'BACK',
                  backtoHome: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                height_button(
                  buttonIcon: Icon(Icons.arrow_forward),
                  text: 'NEXT',
                  backtoHome: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => weightPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
