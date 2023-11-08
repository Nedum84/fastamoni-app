import 'package:fasta_moni_test/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void setUser(User? u) {
    _user = u;
    notifyListeners();
  }

  // Future<User?> findMe() async {
  //   if (_user == null) {
  //     User? me = await AuthService.findMe();
  //     if (me != null) {
  //       setUser(me);
  //     }
  //   }

  //   return _user;
  // }
}
