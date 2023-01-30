import 'package:flutter/material.dart';

import '../widget/login_form.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                const Text("Accedi",
                style: TextStyle(
                  //fontFamily: "Montserrat",
                  fontSize: 40.0,
                  color: Colors.orange,
                  fontWeight: FontWeight.w300,
                 ),),
               ],
              ),
              const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child:LoginForm(),
                    ),
                  ),)
            ]
          ),
        )),
    );
  }
}