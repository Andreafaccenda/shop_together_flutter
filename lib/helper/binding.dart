import 'package:get/get.dart';
import 'package:shop_together_flutter/core/view_model/home_view_model.dart';
import 'package:shop_together_flutter/view/home_controller.dart';
import '../core/view_model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut<HomeController>(() => HomeController(),);

  }
}