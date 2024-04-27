import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackizer/models/bill_model.dart';
import 'package:trackizer/models/transaction_model.dart';

class UserModel {
  String userID;
  String name;
  String email;
  double budgetUsed;
  double totalBudget;
  int nextDue;
  List<BillModel> bills;
  List<TransactionModel> transactions;

  // Constructor
  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.budgetUsed,
    required this.totalBudget,
    required this.nextDue,
    required this.bills,
    required this.transactions,
  });

// Update the factory method to accept a DocumentSnapshot
  factory UserModel.fromJson(DocumentSnapshot snapshot,
      QuerySnapshot<Map<String, dynamic>> billSnapshot, String userID) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
    String date = data['next_due'] ?? "";
    int nextDue = 0;
    List<BillModel> bills = [];
    if (date != "") {
      DateTime? inputDate = DateTime.tryParse(date);
      if (inputDate != null) {
        DateTime now = DateTime.now();

        // Calculate the difference in days
        nextDue = inputDate.difference(now).inDays;
      }
    }
    billSnapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
      // Access document data using doc.data()
      Map<String, dynamic>? data = doc.data();
      addNewBill(bills, data, userID);
    });

    return UserModel(
      userID: data['userID'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      budgetUsed: (data['budget_used'] ?? 0.0).toDouble(),
      totalBudget: (data['total_budget'] ?? 0.0).toDouble(),
      nextDue: nextDue,
      bills: bills, // Initialize empty, you'll need to populate this separately
      transactions: [], // Initialize empty, you'll need to populate this separately
    );
  }

  // Method to convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'budgetUsed': budgetUsed,
      'totalBudget': totalBudget,
      'nextDue': nextDue,
      'bills': bills,
      'transactions': transactions,
    };
  }

  factory UserModel.empty() {
    return UserModel(
      userID: 'test@gmail.com',
      name: '',
      email: '',
      budgetUsed: 0.0,
      totalBudget: 0.0,
      nextDue: 0,
      bills: [],
      transactions: [],
    );
  }
  static void addNewBill(
      List<BillModel> bills, Map<String, dynamic>? data, String userID) {
    bills.add(BillModel.fromJson(data!, userID));
  }
}
