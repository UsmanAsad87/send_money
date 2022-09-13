import 'package:flutter/cupertino.dart';
import '../Models/UserModel.dart';
import '../resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user = UserModel(
      address: '',
      contact: '',
      name: '',
      email: '',
      uid: '');
  final AuthMethods _authMethods = AuthMethods();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
