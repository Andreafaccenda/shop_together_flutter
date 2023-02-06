import 'package:get/get.dart';
import 'package:shop_together_flutter/view/catalogo/prodotti_view_model.dart';
import '../view/auth/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}