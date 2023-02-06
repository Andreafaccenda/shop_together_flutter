import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_together_flutter/view/auth/login_view.dart';
import 'package:shop_together_flutter/view/catalogo/prodotti_view.dart';
import '../../model/user_model.dart';
import '../../repository/auth_repository.dart';

class AuthViewModel extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FireStoreUser _user = FireStoreUser();

  late List userList;


  late String email , password , name;

  Future<void> signInWithEmailAndPassword(bool store) async {
    try{
      if (store) {
        userList = await _user.getUserFromFireStore();
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        var user = getUserFromEmail(email);
        if (user != null)
          storeSession(user);
        Get.offAll(HomeView());
      } else {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Login',
          'Login andato a buon fine',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAll(HomeView());
      }

    }catch(e){
      Get.snackbar('Errore login',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
  }
  }
  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        Get.snackbar('Account',
          'account creato correttamente',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
      });

      Get.offAll(LoginView());
    } catch (e) {
      print(e);
      Get.snackbar('Errore creazione account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
}

  Future<UserModel?> getUserFormId(String id) async {
    userList = await _user.getUserFromFireStore();
    for (var user in await userList) {
      for (var value in user.values) {
        if (value == id) {
          return UserModel.fromJson(user);
        }
      }
    }
    return null;
  }

  UserModel? getUserFromEmail(String email) {
    for (var user in userList) {
      for (var value in user.values) {
        if (value == email) {
          return UserModel.fromJson(user);
        }
      }
    }
    return null;
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      nome: name,
      email: email,
      password: password,
    ));
  }

  storeSession(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.userId.toString());
    prefs.setString('name', user.nome.toString());
    prefs.setString('email', user.email.toString());
    prefs.setString('password', user.password.toString());
  }

  Future<String> getIdSession() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('userId') ?? "";
    return user;
  }

  Future<void> removeSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('password');
  }
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((_) {
      Get.snackbar('Reset password',
        'Email per resettare la password è stata inviata!',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }).catchError((error) {
      Get.snackbar('Reset password',
        error.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      });
  }

}


