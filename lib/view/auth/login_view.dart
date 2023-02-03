import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/core/view_model/auth_view_model.dart';
import 'package:shop_together_flutter/widget/costanti.dart';
import 'package:shop_together_flutter/widget/validators.dart';
import 'package:shop_together_flutter/view/auth/register_view.dart';
import '../../widget/custom_text.dart';


class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final viewModel = AuthViewModel();
  var disabilita = false;
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
    AutoLogin();

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        builder: (controller) {
          // Some code that use viewModel
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: AbsorbPointer(
                absorbing: disabilita,
                child: Padding(
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
                          controller: _controllerEmail,
                          textInputAction: TextInputAction.next,
                          validator: validateEmail,
                          onSaved:(value) {
                            controller.email=value!;
                          },
                          decoration: formDecoration('Indirizzo email',Icons.mail_outline,
                          ),),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _controllerPassword,
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
                              controller.signInWithEmailAndPassword(true);
                            }
                          },
                          color: Colors.orange,
                          child: const Text('Accedi',
                            style: style16White,),
                        ),
                      ],
                    ),
                  ),),
              ),
            ),);
        });
  }

  AutoLogin() async {
    var prefId = await viewModel.getIdSession();
    if (prefId != "") {
      setState(() {
        disabilita=true;
      });
      var user = await viewModel.getUserFormId(prefId);
      if (user != null) {
        viewModel.email= user.email!;
        viewModel.password = user.password!;
        _controllerEmail.text = user.email!;
        _controllerPassword.text = user.password!;
        viewModel.signInWithEmailAndPassword(false);

      }
    }
  }

}