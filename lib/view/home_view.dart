
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/core/services/home_service.dart';
import 'package:shop_together_flutter/core/view_model/home_view_model.dart';
import 'package:shop_together_flutter/model/prodotti_model.dart';
import 'package:shop_together_flutter/widget/custom_text.dart';

import 'details_view.dart';

// ignore: must_be_immutable
class HomeView extends GetxController {
  var categoria = "";
  List<ProdottiModel> allProdotti = [];
  Rx<List<ProdottiModel>> searchProdotti = Rx<List<ProdottiModel>>([]);

  @override
  void onInit() {
    super.onInit();
    allProdotti=getList();
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
    if(prodottoNome.isEmpty){
      result = allProdotti;
    }else{
      result = allProdotti
          .where((element) =>)
    }
  }
  List<ProdottiModel> getList(){
    HomeService().getProduts().then((value) {
      for (int i = 0; i < value.length; i++) {
        allProdotti.add(
            ProdottiModel.fromJson(value[i].data() as Map<dynamic, dynamic>));}
    });
    return allProdotti;
  }
}
