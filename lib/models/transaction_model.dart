class TransactionModel {
  String createdAt;
  String type; // Expense or Income
  String category; // Like entertainment or Transport
  String userID;
  double amount;
  String title;
  String description;

  // Constructor
  TransactionModel({
    required this.createdAt,
    required this.type,
    required this.category,
    required this.userID,
    required this.amount,
    required this.title,
    required this.description,
  });

  // Factory method to create a TransactionModel instance from JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      createdAt: json['createdAt'] ?? '',
      type: json['type'] ?? '',
      category: json['category'] ?? '',
      userID: json['userID'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  // Method to convert TransactionModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'type': type,
      'category': category,
      'userID': userID,
      'amount': amount,
      'title': title,
      'description': description,
    };
  }
}
