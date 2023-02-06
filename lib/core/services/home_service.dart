import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_together_flutter/model/prodotti_model.dart';


class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categorie');

  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Prodotti');

  final _db = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduts() async {
      var value = await _productCollectionRef.get();

      return value.docs;
  }
  Future<void> updateProduts(ProdottiModel prodotto) async {
     await _db.collection("Prodotti").doc(prodotto.id).update(prodotto.toJson());

  }



}