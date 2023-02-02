

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../core/view_model/home_view_model.dart';
import '../widget/custom_text.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
  ];
 final categoria = "formaggi latte uova";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Container(
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
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "Categories",
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
                      text: "Best Selling",
                      fontSize: 18,
                    ),
                    CustomText(
                      text: "See all",
                      fontSize: 16,
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

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoriaModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (controller.categoriaModel[index].categoria!.toLowerCase().toString() == categoria) {
              return Column(
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
                      child: Image.network(controller.categoriaModel[index]
                          .immagine.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: controller.categoriaModel[index].categoria.toString(),
                  ),
                ],
              );
            };
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
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
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].immagine.toString(),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].nome.toString(),
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child:
                    CustomText(
                      text: controller.productModel[index].produttore.toString(),
                      color: Colors.orange,
                      alignment: Alignment.bottomLeft,
                    ),
                    ),],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}