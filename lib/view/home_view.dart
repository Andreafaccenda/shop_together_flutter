
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/core/services/home_service.dart';
import 'package:shop_together_flutter/core/view_model/home_view_model.dart';
import 'package:shop_together_flutter/model/prodotti_model.dart';
import 'package:shop_together_flutter/widget/custom_text.dart';

import 'details_view.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  var categoria = "";
  List<ProdottiModel> prodotti = [];
  Rx<List<ProdottiModel>> fuondProdotti = Rx<List<ProdottiModel>>([]);


  @override
  Widget build(BuildContext context) {
    prodotti=getList();
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>
      controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Categorie",
                      fontSize: 16,
                    ),
                    CustomText(
                      text: "vedi tutto..",
                      fontSize: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _listViewCategory(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Prodotti",
                      fontSize: 16,
                    ),
                    CustomText(
                      text: "vedi tutto..",
                      fontSize: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>
          Container(
            height: 100,
            child: ListView.separated(
              itemCount: controller.categoriaModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      categoria =
                          controller.categoriaModel[index].categoria.toString();

                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(controller
                                .categoriaModel[index].immagine.toString(),
                                fit: BoxFit.contain),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.categoriaModel[index].categoria
                              .toString(),
                          fontSize: 12,
                        ),
                      ],
                    ));
              },
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: 20,
                  ),
            ),
          ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>
          Container(
            height: 350,
            child: ListView.separated(
              itemCount: controller.productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsView(
                      model: controller.productModel[index],
                    ));
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .4,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Container(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image.network(
                                    controller.productModel[index].immagine
                                        .toString(),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: controller.productModel[index].nome.toString(),
                          alignment: Alignment.bottomLeft,
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: controller.productModel[index].categoria
                              .toString(),
                          color: Colors.grey,
                          fontSize: 12,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: 10,
                  ),
            ),
          ),
    );
  }

  List<ProdottiModel> getList(){
    HomeService().getProduts().then((value) {
      for (int i = 0; i < value.length; i++) {
        prodotti.add(
            ProdottiModel.fromJson(value[i].data() as Map<dynamic, dynamic>));}
    });
    return prodotti;
  }

}
