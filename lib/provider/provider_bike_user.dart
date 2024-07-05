import 'dart:async';
// import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class User {
  String email;
  String username;
  String name;
  String password;
  String gender;
  DateTime tglLahir;
  double noTlp;
  double saldo;
  List<RentedBikes> bikeInRent;
  List<RentedBikes> bookedBike;
  List<RentedBikes> rentCompleteBike;

  User(
      {required this.email,
      required this.username,
      required this.name,
      required this.password,
      required this.saldo,
      required this.gender,
      required this.tglLahir,
      required this.noTlp,
      required this.bikeInRent,
      required this.bookedBike,
      required this.rentCompleteBike});
}

class RegisterProvider extends ChangeNotifier {
  List<User> users = [
    User(
        email: 'eden@gmail.com',
        username: 'eden',
        name: "eden",
        password: 'Eden123@',
        saldo: 1000000,
        gender: "Laki-Laki",
        tglLahir: DateTime(2022, 2, 2),
        noTlp: 0812345678,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
    User(
        email: 'eden1@gmail.com',
        username: 'e',
        name: "e",
        password: 'e',
        saldo: 1000000000,
        gender: "",
        tglLahir: DateTime(0, 0, 0),
        noTlp: 0812345678,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
    User(
        email: 'eden2@gmail.com',
        username: 'Dummybot',
        name: 'Dummybot',
        password: 'd',
        saldo: 1000000,
        gender: "Perempuan",
        tglLahir: DateTime(2011, 3, 3),
        noTlp: 0812345678,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
  ];
  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}

class LoginProvider extends ChangeNotifier {
  String user = '';
  File? profilePic;
  User currentUser = User(
      email: 'Guest',
      username: 'Guest',
      name: 'Guest',
      password: 'g',
      saldo: 1000000,
      gender: "Perempuan",
        tglLahir: DateTime(2011, 3, 3),
        noTlp: 0812345678,
      bikeInRent: [],
      bookedBike: [
        RentedBikes(
            rentID: "AD2",
            name: 'Bike A',
            picture: 'bike40.webp',
            paidprice: 33000,
            rentduration: const Duration(seconds: 10),
            timetoscheduledtime: const Duration(seconds: 10),
            rentDate: "10 January 2021",
            bookedDate: '30 December 2024 15:15',
            completeDate: '11 January 23'),
      ],
      rentCompleteBike: []);

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

  void changeProfilePic(newPic) {
    profilePic = newPic;
    notifyListeners();
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
