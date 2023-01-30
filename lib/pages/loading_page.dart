import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_together_flutter/misc/constants.dart';
import 'package:shop_together_flutter/routes/route_manager.dart';
import '../widget/app_progress_indicator.dart';

class LoadingPage extends StatefulWidget{
  const LoadingPage({Key? key}): super(key : key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState(){
    Timer(
      const Duration(seconds: 5), (){
        Navigator.popAndPushNamed(context, RouteManager.loginPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Speed market",
            style: titleStyleOrange,
            ),
            SizedBoxH20(),
            AppProgressIndicator(),
          ],
        )),
    );
  }
}