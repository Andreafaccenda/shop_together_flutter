import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_together_flutter/routes/route_manager.dart';

import '../misc/constants.dart';
import '../misc/validators.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}):super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm>{
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState(){
    super.initState();
    emailController = TextEditingController();
    passwordController= TextEditingController();
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            const SizedBoxH30(),
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration('Email address',Icons.mail_outline,
            ),),
            const SizedBoxH10(),
            TextFormField(
              textInputAction: TextInputAction.done,
              validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration('Password',Icons.lock_outline,
              ),),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed:(){},
                    child:  const Text('Forgot password?',style: style16Black,)),
              ],
            ),
            //Sign in button
            const SizedBoxH20(),
            CupertinoButton(
                borderRadius:  const BorderRadius.all(Radius.circular(20)),
                color: Colors.orange,
                child: const Text('Sign in',style: style16White,), onPressed: (){}),
            const SizedBoxH20(),
            CupertinoButton(
                borderRadius:  const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
                child: const Text('Sign up',
                style: style16Orange,),onPressed: (){
              Navigator.popAndPushNamed(context, RouteManager.registerPage);},)
          ],
        ),
      ));
  }


}