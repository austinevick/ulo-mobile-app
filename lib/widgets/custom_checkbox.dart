import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final Color color;

  const CustomCheckBox({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        child: Center(
          child: Icon(
            Icons.done,
            size: 18,
            color: Colors.white,
          ),
        ),
        height: 22,
        width: 22,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
