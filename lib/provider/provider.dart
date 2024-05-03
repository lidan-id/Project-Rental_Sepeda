import 'dart:ui';

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

class SaldoProvider extends ChangeNotifier {
  double saldo = 250000;

  void topUp(amount) {
    saldo = saldo + amount;
    notifyListeners();
  }
}

class BottomNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class BikeCategoryProvider extends ChangeNotifier {
  int _selectedCategoryIndex = 0;
  final List<List<Map<String, dynamic>>> _categories = [
    [
      {'bikepic': 'bike1.webp', 'bikename': 'City'},
      {'bikepic': 'bike1.webp', 'bikename': 'Bi'},
      {'bikepic': 'bike1.webp', 'bikename': 'Ke'},
    ],
    [
      {'bikepic': 'bike2.webp', 'bikename': 'Road'},
      {'bikepic': 'bike2.webp', 'bikename': 'bi'},
      {'bikepic': 'bike2.webp', 'bikename': 'ke'},
    ],
    [
      {'bikepic': 'bike3.webp', 'bikename': 'Sepe'},
      {'bikepic': 'bike3.webp', 'bikename': 'bi'},
      {'bikepic': 'bike3.webp', 'bikename': 'ke'},
    ],
    [
      {'bikepic': 'bike3.webp', 'bikename': 'Sepe'},
      {'bikepic': 'bike2.webp', 'bikename': 'bi'},
      {'bikepic': 'bike1.webp', 'bikename': 'ke'},
    ],
  ];

  int get selectedCategoryIndex => _selectedCategoryIndex;

  void setSelectedCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> get currentCategory =>
      _categories[_selectedCategoryIndex];
}

class BikesClass {
  String name;
  String picture;
  String price;
  BikesClass({required this.name, required this.picture, required this.price});
}

class BikesProvider extends ChangeNotifier {
  List<BikesClass> cityBikes = [
    BikesClass(name: 'c', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'c', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'c', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'c', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'c', picture: "bike1.webp", price: '330000'),
  ];
  List<BikesClass> mountainBikes = [
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'm', picture: "bike1.webp", price: '330000'),
  ];
  List<BikesClass> roadBikes = [
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'r', picture: "bike1.webp", price: '330000'),
  ];
  List<BikesClass> sportBikes = [
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 's', picture: "bike1.webp", price: '330000'),
  ];
}
