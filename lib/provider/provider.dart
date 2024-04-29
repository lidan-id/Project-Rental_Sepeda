import 'package:flutter/cupertino.dart';

class User {
  String email;
  String username;
  String password;
  User({required this.email, required this.username, required this.password});
}

class RegisterProvider extends ChangeNotifier {
  List<User> users = [
    User(email: 'eden@gmail.com', username: 'eden', password: 'Eden123@'),
    User(
        email: 'lidannn012@gmail.com', username: 'kevin', password: 'Kevin123@')
  ];
  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}

class LoginProvider extends ChangeNotifier {
  String user = '';
  bool checkUser(List users, String username, String password) {
    bool result = false;
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == username && users[i].password == password) {
        result = true;
        user = username;
        break;
      } else {
        result = false;
      }
    }
    return result;
  }
}

class ForgotPasswordProvider extends ChangeNotifier {
  int? userChangePassword = null;
  void checkUserEmail(List users, String email) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].email == email) {
        userChangePassword = i;
      }
    }
    notifyListeners();
  }

  void resetUserChangePassword() {
    userChangePassword = null;
    notifyListeners();
  }
}

class SaldoProvider extends ChangeNotifier {
  double saldo = 250000;

  void topUp(amount) {
    saldo = saldo + amount;
    notifyListeners();
  }
}
