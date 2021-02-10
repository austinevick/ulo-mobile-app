import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final Function onEditingComplete;
  final int maxLines;
  final Function(String) onChanged;
  final Function(String) validator;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget icon;
  final TextInputType textInputType;
  final bool readOnly;
  final Function onTap;
  final Iterable<String> autofillHints;

  const TextInputField(
      {Key key,
      this.onEditingComplete,
      this.maxLines = 1,
      this.textInputType,
      this.autofillHints,
      this.onChanged,
      this.onTap,
      this.validator,
      this.textInputAction,
      this.obscureText = false,
      this.readOnly = false,
      this.icon,
      this.controller,
      this.focusNode,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        autofillHints: autofillHints,
        onTap: onTap,
        readOnly: readOnly,
        textCapitalization: TextCapitalization.words,
        keyboardType: textInputType,
        maxLines: maxLines,
        cursorColor: Colors.black,
        cursorWidth: 1,
        style: TextStyle(
          fontSize: 15,
        ),
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xfffdd13f)),
            ),
            disabledBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: icon),
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        textInputAction: textInputAction,
        validator: validator,
      ),
    );
  }
}
