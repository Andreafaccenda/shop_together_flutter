import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../core/view_model/auth_view_model.dart';
import '../../core/view_model/home_view_model.dart';
import '../../model/prodotti_model.dart';
import '../../widget/custom_text.dart';
import 'dettagli_prodotto_view.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView>{
  final viewModel = HomeViewModel();
  List<ProdottiModel> lista = [];
  final viewModelAuth = AuthViewModel();
  String benvenuto = "Benvenuto" ;

  @override
  void initState() {
    super.initState();
    lista = HomeViewModel().productModel;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>
      controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
        body: SingleChildScrollView(
          child: WillPopScope(
            onWillPop: showExitDialog,
            child: Container(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: benvenuto,fontSize: 20,color: Colors.black,),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.orange, borderRadius:
                        BorderRadius.circular(10),),

                        child: Padding(

                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [

                              Icon(Icons.login_outlined,color:Colors.white,size: 15,),
                              GestureDetector(
                                onTap: () async {
                                  await viewModelAuth.removeSession();
                                  exit(0);
                                },
                              child: Padding(padding: const EdgeInsets.only(left: 5),
                                child: CustomText(text: "Esci",color: Colors.white,fontSize: 14,),),
                              ),
                            ],
                          ),
                        ),),
                    ],
                  ),
                  SizedBox(height: 40,),
                  searchText(),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Categorie:", fontSize: 16,),
                      CustomText(text: "vedi tutto", fontSize: 12,color: Colors.orange,),],),
                  SizedBox(height: 20,),
                  _listViewCategory(),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Prodotti:", fontSize: 16,)],),
                  _listViewProducts(),
                ],),),
          ),),),);
  }

  Widget searchText(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,),
      child: TextFormField(
        onChanged: (value) =>{filtraLista(value),
          setState(() {}), },
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search, color: Colors.black,),),),);
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
                       filtraListaCat(controller.categoriaModel[index].categoria.toString());
                       setState(() {
                       });},
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,),
                        height: 60,
                        width: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(controller.categoriaModel[index]
                              .immagine.toString()),),),
                      SizedBox(height: 10,),
                      CustomText(text: controller.categoriaModel[index].categoria.toString(), fontSize: 10,),],),);
              },
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: 12,
                  ),
            ),
          ),
    );
  }

  Widget _listViewProducts() {
    return Container(
            height: 350,
            child: ListView.separated(
              itemCount: lista.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      Get.to(DettagliProdottoView(
                        model: lista[index],
                      ));
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 20),
                      child: AspectRatio(
                        aspectRatio: 3/1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              AspectRatio(aspectRatio: 1/1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(lista[index].immagine.toString(),
                                    fit: BoxFit.cover,),
                                ),),
                              SizedBox(width: 10 ,),
                              AspectRatio(aspectRatio: 4/3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(lista[index].nome.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 5,),
                                    Text("${lista[index]
                                        .prezzo_unitario}€/kg",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),
                                    Text("${lista[index]
                                        .quantita}kg",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),],),),
                              IconButton(onPressed: (){Get.to(DettagliProdottoView(model: lista[index],));},
                                  icon: Icon(Icons.add_circle,color: Colors.brown[600],size: 30,)),
                            ],),),),
                    ),
                  );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(
                    width: 20,),),
          );
  }
  void filtraListaCat(String categoria) {
    List<ProdottiModel> listaCompleta = viewModel.productModel;
    List<ProdottiModel> listaFiltrata = [];
    for (int i = 0; i < listaCompleta.length; i++) {
      if (listaCompleta[i].categoria.toString().toLowerCase() ==
          categoria.toLowerCase()) {
        listaFiltrata.add(listaCompleta[i]);
      }
    }
    setState(() {
      lista = listaFiltrata;
    });
  }
    void filtraLista(String text) {
      List<ProdottiModel> listaCompleta = viewModel.productModel;
      List<ProdottiModel> listaFiltrata = [];
      for (int i = 0; i < listaCompleta.length; i++) {
        if (listaCompleta[i].nome.toString().toLowerCase().startsWith(
            text.toLowerCase())) {
          listaFiltrata.add(listaCompleta[i]);
        }
      }
      setState(() {
        lista = listaFiltrata;
      });
    }

  Future<bool> showExitDialog()async {
    return await showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text("Uscita app"),
          content: const Text("Vuoi uscire dall'applicazione ?"),
          actions: [
            ElevatedButton(style: ElevatedButton.styleFrom( primary: Colors.orange),
              onPressed: (){
              Navigator.of(context).pop(false);
            }, child: const Text("No"),),
            ElevatedButton(style: ElevatedButton.styleFrom( primary: Colors.orange),
                onPressed: (){
              Navigator.of(context).pop(true);
            }, child: const Text("SI"))
          ],
        ));
  }

}


