import 'package:flutter/material.dart';
import 'package:trackizer/models/user_model.dart';
import 'package:trackizer/services/firestore_services.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel.empty();
  final FireStoreServices _fireStoreServices = FireStoreServices();
  UserModel get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _fireStoreServices.loadUserDetails(_user.userID);
    _user = user;
    notifyListeners();
  }
}
