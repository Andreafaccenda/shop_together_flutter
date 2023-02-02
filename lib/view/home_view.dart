
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shop_together_flutter/view/home_controller.dart';

import '../widget/custom_text.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Filter'),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => controller.filterProdotti(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.searchProdotti.value.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      controller.searchProdotti.value[index].nome.toString(),
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                    Text(controller.searchProdotti.value[index].categoria.toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}