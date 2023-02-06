import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop_together_flutter/model/categoria_model.dart';
import 'package:shop_together_flutter/model/prodotti_model.dart';
import '../services/home_service.dart';

class HomeViewModel extends GetxController {
  final homeService = HomeService();
  List<CategoriaModel> get categoriaModel => _categoriaModel;
  List<CategoriaModel> _categoriaModel = [];

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProdottiModel> get productModel => _productModel;
  List<ProdottiModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoriaModel.add(CategoriaModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
  getProducts() async {
    _loading.value = true;
    HomeService().getProduts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProdottiModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
  updateProduct(ProdottiModel prodotto) async{
    await homeService.updateProduts(prodotto);
  }
}
