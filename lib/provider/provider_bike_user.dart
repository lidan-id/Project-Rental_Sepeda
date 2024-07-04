import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class User {
  String email;
  String username;
  String password;
  double saldo;
  List<RentedBikes> bikeInRent;
  List<RentedBikes> bookedBike;
  List<RentedBikes> rentCompleteBike;

  User(
      {required this.email,
      required this.username,
      required this.password,
      required this.saldo,
      required this.bikeInRent,
      required this.bookedBike,
      required this.rentCompleteBike});
}

class RegisterProvider extends ChangeNotifier {
  List<User> users = [
    User(
        email: 'eden@gmail.com',
        username: 'eden',
        password: 'Eden123@',
        saldo: 1000000,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
    User(
        email: 'eden1@gmail.com',
        username: 'e',
        password: 'e',
        saldo: 1000000000,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
    User(
        email: 'eden2@gmail.com',
        username: 'Dummybot',
        password: 'd',
        saldo: 1000000,
        bikeInRent: [],
        bookedBike: [],
        rentCompleteBike: []),
  ];
  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  void changeRent(List<RentedBikes> newBooked) {
    users[indexUser].bookedBike = newBooked;
    print(users[indexUser].bookedBike.length);
    print(users[1].bookedBike.length);
    notifyListeners();
  }
}

int indexUser = 0;

class LoginProvider extends ChangeNotifier {
  String user = '';
  File? profilePic;
  User currentUser = User(
      email: 'Guest',
      username: 'Guest',
      password: 'g',
      saldo: 1000000,
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
        currentUser = users[i];
        user = username;
        indexUser = i;

        notifyListeners();
        break;
      } else {
        result = false;
      }
    }
    return result;
  }

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  void topUp(double amount) {
    currentUser.saldo = currentUser.saldo + amount;
    notifyListeners();
  }

  void bayar(double amount) {
    currentUser.saldo = currentUser.saldo - amount;
  }

  void changeProfilePic(newPic) {
    profilePic = newPic;
    notifyListeners();
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

class RentedBikes {
  String rentID;
  String name;
  String picture;
  double paidprice;
  Duration rentduration;
  Duration timetoscheduledtime;
  String rentDate;
  String bookedDate;
  String completeDate;

  RentedBikes({
    required this.rentID,
    required this.name,
    required this.picture,
    required this.paidprice,
    required this.rentduration,
    required this.timetoscheduledtime,
    required this.rentDate,
    required this.bookedDate,
    required this.completeDate,
  });
}

class RentedBikeProvider extends ChangeNotifier {
  List<RentedBikes> bikeInRent = RegisterProvider().users[indexUser].bikeInRent;
  List<RentedBikes> bookedBike = RegisterProvider().users[indexUser].bookedBike;
  List<RentedBikes> rentCompleteBike =
      RegisterProvider().users[indexUser].rentCompleteBike;
  void refreshRent(newBook, newInRent, newCompleteRent) {
    bikeInRent = newInRent;
    bookedBike = newBook;
    rentCompleteBike = newCompleteRent;
    notifyListeners();
  }

  final Map<String, Timer> _timers = {};
  final Map<String, Duration> remainingDurations = {};

  RentedBikeProvider() {
    for (var bike in bookedBike) {
      remainingDurations[bike.rentID] = bike.timetoscheduledtime;
      _startTimer(bike, isBooked: true);
    }
    for (var bike in bikeInRent) {
      remainingDurations[bike.rentID] = bike.rentduration;
      _startTimer(bike, isBooked: false);
    }
  }

  void addNewBookedBike({
    required String rentID,
    required String name,
    required String picture,
    required double paidprice,
    required Duration rentduration,
    required Duration timetoscheduledtime,
  }) {
    final newBike = RentedBikes(
      rentID: rentID,
      name: name,
      picture: picture,
      paidprice: paidprice,
      rentduration: rentduration,
      timetoscheduledtime: timetoscheduledtime,
      rentDate: '',
      bookedDate: '',
      completeDate: '',
    );
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMMM yyyy HH:mm');
    newBike.rentDate = formatter.format(now);
    bookedBike.add(newBike);
    // refreshRented();
    remainingDurations[newBike.rentID] = newBike.timetoscheduledtime;
    _startTimer(newBike, isBooked: true);
    notifyListeners();
  }

  void startRentBike(RentedBikes bike) {
    bookedBike.remove(bike);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMMM yyyy HH:mm');
    bike.rentDate = formatter.format(now);
    bikeInRent.add(bike);
    remainingDurations[bike.rentID] = bike.rentduration;
    _startTimer(bike, isBooked: false);
    notifyListeners();
  }

  void finishRentBike(RentedBikes bike) {
    bikeInRent.remove(bike);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMMM yyyy HH:mm');
    bike.completeDate = formatter.format(now);
    rentCompleteBike.add(bike);
    _timers[bike.rentID]?.cancel();
    notifyListeners();
  }

  void updateRemainingDuration(String rentID, Duration newDuration) {
    remainingDurations[rentID] = newDuration;
    notifyListeners();
  }

  void _startTimer(RentedBikes bike, {required bool isBooked}) {
    _timers[bike.rentID] = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingDurations[bike.rentID]! > Duration.zero) {
        remainingDurations[bike.rentID] =
            remainingDurations[bike.rentID]! - const Duration(seconds: 1);
        notifyListeners();
      } else {
        _timers[bike.rentID]?.cancel();
        if (isBooked) {
          startRentBike(bike);
        } else {
          finishRentBike(bike);
        }
      }
    });
  }

  @override
  void dispose() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    super.dispose();
  }
}
