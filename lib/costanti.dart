import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'misc/constants.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1);

InputDecoration formDecoration(String labelText,IconData iconData) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 10),
    prefixIcon: Icon(
      iconData,
      color: Colors.orangeAccent,
    ),
    errorMaxLines: 3,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );
}
const TextStyle style16Orange = TextStyle(
    color: Colors.orange,
    fontSize: 16,);

const TextStyle style16White = TextStyle(
    color: Colors.white,
    fontSize: 16,);

const TextStyle style16Black = TextStyle(
    color: Colors.black,
    fontSize: 16,);

SnackBar customSnackBar({required String content}) {
return SnackBar(
backgroundColor: Colors.black,
content: Text(
content,
style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),),);
}

