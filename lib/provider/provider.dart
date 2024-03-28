import 'package:flutter/cupertino.dart';

class User {
  String username;
  String password;
  User({required this.username, required this.password});
}

class RegisterProvider extends ChangeNotifier {
  List<User> users = [User(username: 'eden', password: 'Eden123@')];
  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}

class LoginProvider extends ChangeNotifier {
  bool checkUser(List users, String username, String password) {
    bool result = false;
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == username && users[i].password == password) {
        result = true;
        break;
      } else {
        result = false;
      }
    }
    return result;
  }
}
