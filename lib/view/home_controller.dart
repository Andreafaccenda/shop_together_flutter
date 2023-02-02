

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop_together_flutter/core/view_model/home_view_model.dart';
import 'package:shop_together_flutter/model/categoria_model.dart';

import '../core/services/home_service.dart';
import '../model/prodotti_model.dart';

class HomeController extends GetxController {
  var categoria = "";
  final List<ProdottiModel> allProdotti = HomeViewModel().productModel;
  Rx<List<ProdottiModel>> searchProdotti = Rx<List<ProdottiModel>>([]);

  @override
  void onInit() {
    super.onInit();
    searchProdotti.value=allProdotti;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void filterProdotti(String prodottoNome){
    List<ProdottiModel> result = [];
    if (prodottoNome.isEmpty) {
      result = allProdotti;
    } else {
      result = allProdotti
          .where((element) =>
          element.nome
              .toString()
              .toLowerCase()
              .startsWith(prodottoNome.toLowerCase()))
          .toList();
    }
      searchProdotti.value = result;
  }
}
