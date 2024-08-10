import 'dart:ui';

import 'package:bmi_updated/screens/heightPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          title: Center(
              child: Text(
                  'SELECT YOUR GENDER',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GenderSelection(
                nextScreen: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HeightPage(
                    genderHeight: Image.asset(
                        'assets/maleSvg.png',
                      fit: BoxFit.fitHeight,
                    ),
                  )));
                },
                image: Image.asset('assets/maleSvg.png'),
                text: 'Male',
              ),
              GenderSelection(
                nextScreen: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HeightPage(
                    genderHeight: Image.asset(
                        'assets/womanSvg.jpeg',
                      fit: BoxFit.fitHeight,
                    ),
                  )));
                },
                image: Image.asset('assets/womanSvg.jpeg'),
                text: 'Female',
              ),
              GenderSelection(
                nextScreen: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HeightPage(
                    genderHeight: Image.asset('assets/maleSvg.png', fit: BoxFit.fitHeight,),
                  )));
                },
                image: Image.asset('assets/malefemale.png'),
                text: 'Others',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelection extends StatelessWidget {
   GenderSelection({required this.image, required this.text, required this.nextScreen});

  final Image image;
  final String text;
  final VoidCallback  nextScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextScreen,
      child: Container(
        height: 200,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              color: Colors.grey.shade200,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: ClipOval(child: image),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
