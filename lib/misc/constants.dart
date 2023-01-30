import 'package:flutter/material.dart';

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
    enabledBorder: enableBorder,
    focusedBorder: focusedBorder,
    errorBorder: errorBorder,
  );
}

const enableBorder = UnderlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15),),
  borderSide: BorderSide(width: 1, color: Colors.orangeAccent,));

const focusedBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10),),
    borderSide: BorderSide(width: 2, color: Colors.orangeAccent,));

const errorBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10),),
    borderSide: BorderSide(width: 2, color: Colors.red,));

class SizedBoxH10 extends StatelessWidget{
  const SizedBoxH10({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class SizedBoxH20 extends StatelessWidget{
  const SizedBoxH20({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class SizedBoxH30 extends StatelessWidget{
  const SizedBoxH30({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}

const TextStyle style16Orange = TextStyle(
  color: Colors.orange,
  fontSize: 16,
  fontWeight: FontWeight.w300);

const TextStyle style16White = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w300);

const TextStyle style16Black = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w300);

const TextStyle titleStyleOrange = TextStyle(
    color: Colors.orange,
    fontSize: 32,
    fontWeight: FontWeight.w400);