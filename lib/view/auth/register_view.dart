import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/misc/validators.dart';
import '../../core/view_model/auth_view_model.dart';
import '../../costanti.dart';
import '../../widget/custom_text.dart';
import 'login_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text("Registrazione account",
          style: style16White,),
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
              CustomText(
                text: "Crea account,",
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateName,
                onSaved:(value) {
                  controller.name=value!;
                },
                decoration: formDecoration('Nome',Icons.person,
                ),),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateEmail,
                onSaved:(value) {
                  controller.email=value!;
                },
                decoration: formDecoration('Indirizzo email',Icons.mail_outline,
                ),),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                validator: validatePassword,
                onSaved:(value) {
                  controller.password=value!;
                },
                decoration: formDecoration('Password',Icons.lock_outline,
                ),),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                validator: validateConfirmPassword,
                onSaved:(value) {
                  controller.password=value!;
                },
                decoration: formDecoration('Conferma password',Icons.lock_outline,
                ),),
              SizedBox(
                height: 30,
              ),
              CupertinoButton(
                borderRadius:  const BorderRadius.all(Radius.circular(10)),
                onPressed: () {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
                color: Colors.orange,
                child: const Text('Registrati',
                  style: style16White,),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}