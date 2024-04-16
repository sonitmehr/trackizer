class UserModel {
  String userID;
  String name;
  String email;
  double budgetUsed;
  double totalBudget;
  int nextDue;

  // Constructor
  UserModel({
    required this.userID,
    required this.name,
    required this.email,
    required this.budgetUsed,
    required this.totalBudget,
    required this.nextDue,
  });

  // Factory method to create a UserModel instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['userID'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      budgetUsed: (json['budgetUsed'] ?? 0.0).toDouble(),
      totalBudget: (json['totalBudget'] ?? 0.0).toDouble(),
      nextDue: json['nextDue'] ?? 0,
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
    };
  }
}
