import 'package:bmi_updated/appBrain/bmiBrain.dart';
import 'package:bmi_updated/home_screen.dart';
import 'package:bmi_updated/screens/weightpage.dart';
import 'package:flutter/material.dart';
import 'heightPage.dart';


class Resultpage extends StatelessWidget {
   Resultpage({required this.bmiResult, required this.calcDecision, required this.calcComment});

  final String bmiResult;
  final String calcDecision;
  final String calcComment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 50),
                height: 200,
                child: Stack(
                  children: [
                     Card(
                      elevation: 20,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "BMI SCORE",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Height:',
                                 style:  TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                    heightValue.toStringAsFixed(1),
                                 style:  TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Text(
                                    'Weight:',
                                 style:  TextStyle(
                                      fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                    weightValue.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blue
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                ('$bmiResult'),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
              ),
              Card(
                elevation: 20,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 30),
                child: Container(
                  width: 350,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                            calcDecision.toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        child: Text(
                          calcComment.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade300,
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'RE-CALCULATE BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
