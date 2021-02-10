import 'package:flutter/material.dart';

class DateTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onTap;

  const DateTextFieldWidget({Key key, this.controller, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        padding: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: TextField(
          style: TextStyle(fontSize: 18, color: Colors.black),
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
