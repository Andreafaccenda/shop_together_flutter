import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/core/view_model/auth_view_model.dart';
import 'package:shop_together_flutter/costanti.dart';
import 'package:shop_together_flutter/misc/validators.dart';
import 'package:shop_together_flutter/view/auth/register_view.dart';

import '../../widget/custom_text.dart';


class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
          child: Form(
            key: _formKey,
          child: Column(
                  children: [
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Benvenuto",
                            fontSize: 30,),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            child: CustomText(
                              text: "Registrati",
                              color: Colors.orange,
                              fontSize: 18,
                            ),),
                        ],
                      ),
              CustomText(
                text: "Accedi per continuare",
                color: Colors.grey,
                fontSize: 14,
              ),
              SizedBox(height: 30,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                      onSaved:(value) {
                        controller.email=value!;
                      },
                      decoration: formDecoration('Indirizzo email',Icons.mail_outline,
                      ),),
              SizedBox(height: 30,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: validatePassword,
                      onSaved:(value) {
                        controller.password=value!;
                      },
                      decoration: formDecoration('Password',Icons.mail_outline,
                      ),),
              SizedBox(height: 20,)   ,
              CustomText(
                text: 'Password dimenticata?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 20,),
              CupertinoButton(
                      borderRadius:  const BorderRadius.all(Radius.circular(10)),
                      onPressed: (){
                        _formKey.currentState!.save();
                        if(_formKey.currentState!.validate()){
                          controller.signInWithEmailAndPassword();
                        }
                      },
                      color: Colors.orange,
                      child: const Text('Accedi',
                        style: style16White,),
              ),
              SizedBox(height: 20,),
              CustomText(
                text: "-Oppure-",
                alignment: Alignment.center,
              ),
              SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade50,
                ),
               child: CupertinoButton(
                onPressed: (){
                  controller.googleSignInMethod();
                },
                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                child: Row(
                  children: [
                    Image.asset('assets/images/google.png'),
                    SizedBox(width: 90,),
                    CustomText(
                      text: 'Accedi con Google',
                    )
                  ],
                ),
              ),
              ),
              SizedBox(height: 20,),
              Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade50,
                      ),
                      child: CupertinoButton(
                        onPressed: (){},
                        borderRadius:  const BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          children: [
                            Image.asset('assets/images/facebook.png'),
                            SizedBox(width: 90,),
                            CustomText(
                              text: 'Accedi con Facebook',
                            )
                          ],
                        ),
                      ),
                    ),
        ],
      ),
          ),),);
  }
}