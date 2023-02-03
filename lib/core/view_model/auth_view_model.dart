import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_together_flutter/view/auth/login_view.dart';
import 'package:shop_together_flutter/view/Home/home_view.dart';
import '../../widget/costanti.dart';
import '../../model/user_model.dart';
import '../services/firestore_user.dart';

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
        customSnackBar(content: "Login andato a buon fine!");
        Get.offAll(HomeView());
      }

    }catch(e){
      customSnackBar(
        content: 'Errore login.Controlla email e password!',
      );
  }
  }
  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
        customSnackBar(content: "Account creato");
      });

      Get.offAll(LoginView());
    } catch (e) {
      print(e);
      customSnackBar(
        content: 'Errore creazione account',
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

}


