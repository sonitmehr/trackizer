import 'package:cloud_firestore/cloud_firestore.dart';

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
}
