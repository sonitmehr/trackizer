class BillModel {
  String createdAt;
  int amount;
  String dueDate;
  String userID;

  // Constructor
  BillModel({
    required this.userID,
    required this.createdAt,
    required this.amount,
    required this.dueDate,
  });

  // Factory method to create a BillModel instance from JSON
  factory BillModel.fromJson(Map<String, dynamic> json, String userID) {
    return BillModel(
      userID: userID,
      createdAt: json['created_at'] ?? '',
      amount: json['amount'] ?? '',
      dueDate: json['due_date'] ?? '',
    );
  }

  // Method to convert BillModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'amount': amount,
      'due_date': dueDate,
      'user_id': userID
    };
  }
}
