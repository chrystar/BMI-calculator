import 'package:bmi_updated/screens/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:bmi_updated/appBrain/bmiBrain.dart';

import 'heightPage.dart';

double weightValue = 20;

class weightPage extends StatefulWidget {
  const weightPage({super.key});

  @override
  State<weightPage> createState() => _weightPageState();
}

class _weightPageState extends State<weightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Container(
              child: Text(
                'SELECT YOUR WEIGHT',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            )),
            Container(
                child: SfRadialGauge(
              axes: [
                RadialAxis(
                  isInversed: true,
                  minimum: 0,
                  maximum: 100,
                  startAngle: 180,
                  interval: 10,
                  endAngle: 0,
                  pointers: [
                    NeedlePointer(
                      enableDragging: true,
                      value: weightValue,
                      onValueChanged: (value) {
                        setState(() {
                          weightValue = value.roundToDouble();
                          print(weightValue);
                        });
                      },
                    ),
                  ],
                  annotations: [
                    GaugeAnnotation(
                        widget: Container(
                      child: Text(
                        weightValue.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                      alignment: AlignmentDirectional.bottomCenter,
                    )),
                  ],
                )
              ],
            )),
            Column(
              children: <Widget>[
                HeightNavigator(
                  heightBack: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => HeightPage()));
                  },
                  backgroundColor: Colors.white,
                  backTextButton: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                HeightNavigator(
                  heightBack: () {
                    BmiBrain bmiBrain = BmiBrain(height: heightValue, weight: weightValue);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Resultpage(
                          bmiResult: bmiBrain.calc().toString(),
                          calcDecision: bmiBrain.calcDecision().toString(),
                          calcComment: bmiBrain.calcComment().toString(),
                        )));
                  },
                  backgroundColor: Colors.blue.shade300,
                  backTextButton: Text(
                    'CALCULATE BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeightNavigator extends StatelessWidget {
  HeightNavigator(
      {required this.backTextButton,
      this.backIcon,
      this.backgroundColor,
      this.heightBack});

  final Text backTextButton;
  final Icon? backIcon;
  final Color? backgroundColor;
  VoidCallback? heightBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: TextButton(
        onPressed: heightBack,
        child: backTextButton,
      ),
    );
  }
}
