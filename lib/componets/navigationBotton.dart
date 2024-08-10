import 'package:flutter/material.dart';

class height_button extends StatelessWidget {
  const height_button({required this.text, required this.backtoHome, required this.buttonIcon});

  final String text;
  final VoidCallback backtoHome;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: backtoHome,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              color: Colors.grey.shade200,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonIcon,
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
