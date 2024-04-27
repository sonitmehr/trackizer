import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackizer/models/user_model.dart';

class FireStoreServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> loadBillDetails(String userID) async {
    DocumentSnapshot userBillsSnapshot =
        await _firebaseFirestore.collection('bills').doc(userID).get();
  }

  Future<void> loadTransactionDetails(String userID) async {
    DocumentSnapshot userBillsSnapshot =
        await _firebaseFirestore.collection('transactions').doc(userID).get();
  }

  Future<UserModel> loadUserDetails(String userID) async {
    UserModel user = UserModel.empty();
    DocumentSnapshot userSnapshot =
        await _firebaseFirestore.collection('users').doc(userID).get();

    CollectionReference<Map<String, dynamic>> bills =
        _firebaseFirestore.collection('bills').doc(userID).collection('bills');
    QuerySnapshot<Map<String, dynamic>> billSnapshot = await bills.get();

    return UserModel.fromJson(userSnapshot, billSnapshot, userID);
  }
}

class CollectionSnapshot {}
