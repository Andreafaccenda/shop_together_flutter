import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_together_flutter/view/auth/login_view.dart';
import 'package:shop_together_flutter/view/home_view.dart';

import '../../costanti.dart';
import '../../model/user_model.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email , password , name ;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      Get.offAll(HomeView());
    });
  }

  Future<void> signInWithEmailAndPassword() async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());

    }catch(e){
      customSnackBar(
        content: 'Error login'+e.toString(),
      );
  }
  }
  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(LoginView());
    } catch (e) {
      print(e);
      customSnackBar(
        content: 'Error login account'+e.toString(),
      );
    }
}
  Future<void> signOut() async{
    try {
      if (!kIsWeb) {
        await _googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      customSnackBar(
          content: 'Error signing out. Try again.',
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      name: name,
      email: email,
      password: password,
    ));
  }
}


