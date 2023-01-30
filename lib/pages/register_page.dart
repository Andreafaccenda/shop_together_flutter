import 'package:flutter/material.dart';
import 'package:shop_together_flutter/misc/constants.dart';
import '../routes/route_manager.dart';
import '../widget/register_form.dart';

class RegisterPage  extends StatelessWidget{
  const RegisterPage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, RouteManager.loginPage);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
        color: Colors.white,)),
        backgroundColor: Colors.orange,
        title: const Text("Registrazione account",
          style: style16White,),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
            children: const [
              Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: SingleChildScrollView(
                child: RegisterForm()),
              ),)
            ],
          )),
    );
  }
}