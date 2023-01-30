import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_together_flutter/pages/loading_page.dart';
import 'package:shop_together_flutter/pages/login_page.dart';
import 'package:shop_together_flutter/pages/register_page.dart';

class RouteManager{
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String registerPage = 'registerPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case loadingPage:
        return MaterialPageRoute(
            builder:(context) => const LoadingPage());
      case loginPage:
        return MaterialPageRoute(
            builder: (context) => const LoginPage());
      case registerPage:
        return MaterialPageRoute(
            builder: (context) => const RegisterPage());
      default:
        throw Exception("no route found");
    }
  }
}