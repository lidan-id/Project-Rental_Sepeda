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
      //City Bikes"
      {'bikepic': 'bike10.webp', 'bikename': 'Nakto Classic'},
      {'bikepic': 'bike11.webp', 'bikename': 'Evelo'},
      {'bikepic': 'bike12.webp', 'bikename': 'RadCity5'},
    ],
    [
      //Mountain Bikes
      {'bikepic': 'bike20.webp', 'bikename': 'MTB Aro 29'},
      {'bikepic': 'bike21.webp', 'bikename': 'Phoenix MB26'},
      {'bikepic': 'bike22.webp', 'bikename': 'Dynacraft'},
    ],
    [
      //Road Bikes
      {'bikepic': 'bike30.webp', 'bikename': 'Bianchi'},
      {'bikepic': 'bike31.webp', 'bikename': 'Cinelli'},
      {'bikepic': 'bike32.webp', 'bikename': 'Canyon'},
    ],
    [
      //Hybrid Bikes
      {'bikepic': 'bike40.webp', 'bikename': 'Pendleton Somerby'},
      {'bikepic': 'bike41.webp', 'bikename': 'Trek FX Carbon 4'},
      {'bikepic': 'bike42.webp', 'bikename': 'Schwinn'},
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
