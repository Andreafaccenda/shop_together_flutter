import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../misc/constants.dart';
import '../misc/validators.dart';

class RegisterForm extends StatefulWidget{
  const RegisterForm({Key? key}) : super(key : key);

  @override
  State<StatefulWidget> createState()=> _RegisterFormState();
  }
  class _RegisterFormState extends State<RegisterForm>{
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;

  @override
  void initState(){
    super.initState();
    nameController= TextEditingController();
    passwordController= TextEditingController();
    confirmPasswordController= TextEditingController();
    emailController= TextEditingController();
  }
  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Crea account",
            style:  titleStyleOrange,),
            const SizedBoxH30(),
            TextFormField(
              validator: validateName,
              controller: nameController,
              decoration: formDecoration("Name",Icons.person_outline,
            ),),
            const SizedBoxH10(),
            TextFormField(
              validator: validateEmail,
              controller: emailController,
              decoration: formDecoration("Email",Icons.mail_outline,
              ),),
            const SizedBoxH10(),
            TextFormField(
              validator: validatePassword,
              controller: passwordController,
              decoration: formDecoration("Password",Icons.lock_outline,
              ),),
            const SizedBoxH10(),
            TextFormField(
              validator: validateConfirmPassword,
              controller: confirmPasswordController,
              decoration: formDecoration("Conferma password",Icons.person_outline,
              ),),
            const SizedBoxH30(),
            CupertinoButton(
                borderRadius:  const BorderRadius.all(Radius.circular(20)),
                color: Colors.orange,
                child: const Text('Sign up',style: style16White,), onPressed: (){}),
          ],
        ),));

  }

}