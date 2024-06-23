import 'package:flutter/material.dart';

class User {
  String email;
  String username;
  String password;
  User({required this.email, required this.username, required this.password});
}

class RegisterProvider extends ChangeNotifier {
  List<User> users = [
    User(email: 'eden@gmail.com', username: 'eden', password: 'Eden123@'),
    User(email: 'eden1@gmail.com', username: 'e', password: 'e'),
    User(email: 'eden2@gmail.com', username: 'Dummybot', password: 'd'),
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
  double saldo = 350000;

  void topUp(amount) {
    saldo = saldo + amount;
    notifyListeners();
  }

  void bayar(amount) {
    saldo = saldo - amount;
  }
}

class BikesClass {
  String name;
  String picture;
  double price;
  BikesClass({required this.name, required this.picture, required this.price});
}

class BikesProvider extends ChangeNotifier {
  List<BikesClass> cityBikes = [
    BikesClass(name: 'Nakto Classic', picture: "bike10.webp", price: 330000),
    BikesClass(name: 'Evelo', picture: "bike11.webp", price: 330000),
    BikesClass(name: 'RadCity5', picture: "bike12.webp", price: 330000),
    BikesClass(name: 'bikers 331', picture: "bike10.webp", price: 330000),
    BikesClass(name: 'poulu 22', picture: "bike11.webp", price: 330000),
  ];
  List<BikesClass> mountainBikes = [
    BikesClass(name: 'MTB Aro 29', picture: "bike20.webp", price: 330000),
    BikesClass(name: 'Dynacraft', picture: "bike21.webp", price: 330000),
    BikesClass(name: 'lambo 11', picture: "bike22.webp", price: 330000),
    BikesClass(name: 'Phoenix MB26', picture: "bike20.webp", price: 330000),
    BikesClass(name: 'mtn lite 332', picture: "bike21.webp", price: 330000),
  ];
  List<BikesClass> roadBikes = [
    BikesClass(name: 'Bianchi', picture: "bike30.webp", price: 330000),
    BikesClass(name: 'river road', picture: "bike31.webp", price: 330000),
    BikesClass(name: 'roronoa road', picture: "bike32.webp", price: 330000),
    BikesClass(name: 'Canyon', picture: "bike30.webp", price: 330000),
    BikesClass(name: 'Cinelli', picture: "bike31.webp", price: 330000),
  ];
  List<BikesClass> hybridBikes = [
    BikesClass(
        name: 'Pendleton Somerby', picture: "bike40.webp", price: 330000),
    BikesClass(name: 'Trek FX Carbon 4', picture: "bike41.webp", price: 330000),
    BikesClass(name: 'srr 889', picture: "bike42.webp", price: 330000),
    BikesClass(name: 'super main 21', picture: "bike40.webp", price: 330000),
    BikesClass(name: 'Schwinn', picture: "bike41.webp", price: 330000),
  ];
  //  checkInput() {
  //   return null
  // }
}
