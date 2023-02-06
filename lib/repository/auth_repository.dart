import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<List> getUserFromFireStore() async {
    QuerySnapshot querySnapshot = await _userCollectionRef.get();
    final allUsers = querySnapshot.docs.map((doc) => doc.data()).toList();
    return await allUsers;
  }

}