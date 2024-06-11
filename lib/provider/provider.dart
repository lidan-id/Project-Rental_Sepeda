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
    User(email: 'eden1@gmail.com', username: 'e', password: 'e'),
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

class TopBikeCategoryProvider extends ChangeNotifier {
  int _selectedCategoryIndex = 0;
  final List<List<Map<String, dynamic>>> _categories = [
    [
      //City Bikes"
      {
        'bikepic': 'bike10.webp',
        'bikename': 'Nakto Classic',
        'bikecat': 'City Bikes'
      },
      {'bikepic': 'bike11.webp', 'bikename': 'Evelo', 'bikecat': 'City Bikes'},
      {
        'bikepic': 'bike12.webp',
        'bikename': 'RadCity5',
        'bikecat': 'City Bikes'
      },
    ],
    [
      //Mountain Bikes
      {
        'bikepic': 'bike20.webp',
        'bikename': 'MTB Aro 29',
        'bikecat': 'Mountain Bikes'
      },
      {
        'bikepic': 'bike21.webp',
        'bikename': 'Phoenix MB26',
        'bikecat': 'Mountain Bikes'
      },
      {
        'bikepic': 'bike22.webp',
        'bikename': 'Dynacraft',
        'bikecat': 'Mountain Bikes'
      },
    ],
    [
      //Road Bikes
      {
        'bikepic': 'bike30.webp',
        'bikename': 'Bianchi',
        'bikecat': 'Road Bikes'
      },
      {
        'bikepic': 'bike31.webp',
        'bikename': 'Cinelli',
        'bikecat': 'Road Bikes'
      },
      {'bikepic': 'bike32.webp', 'bikename': 'Canyon', 'bikecat': 'Road Bikes'},
    ],
    [
      //Hybrid Bikes
      {
        'bikepic': 'bike40.webp',
        'bikename': 'Pendleton Somerby',
        'bikecat': 'Hybrid Bikes'
      },
      {
        'bikepic': 'bike41.webp',
        'bikename': 'Trek FX Carbon 4',
        'bikecat': 'Hybrid Bikes'
      },
      {
        'bikepic': 'bike42.webp',
        'bikename': 'Schwinn',
        'bikecat': 'Hybrid Bikes'
      },
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
    BikesClass(name: 'citie 223', picture: "bike10.webp", price: '330000'),
    BikesClass(name: 'masive city', picture: "bike11.webp", price: '330000'),
    BikesClass(name: 'futuries', picture: "bike12.webp", price: '330000'),
    BikesClass(name: 'bikers 331', picture: "bike10.webp", price: '330000'),
    BikesClass(name: 'poulu 22', picture: "bike11.webp", price: '330000'),
  ];
  List<BikesClass> mountainBikes = [
    BikesClass(name: 'mountain 223', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'mutual bike', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'lambo 11', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'bikes 2000cc', picture: "bike1.webp", price: '330000'),
    BikesClass(
        name: 'mountains lite 332', picture: "bike1.webp", price: '330000'),
  ];
  List<BikesClass> roadBikes = [
    BikesClass(name: 'road 7', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'river road', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'roronoa road', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'paradise', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'hell', picture: "bike1.webp", price: '330000'),
  ];
  List<BikesClass> sportBikes = [
    BikesClass(name: 'sprite', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'sport bike 22', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'srr 889', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'super main 21', picture: "bike1.webp", price: '330000'),
    BikesClass(name: 'paramedic', picture: "bike1.webp", price: '330000'),
  ];
  //  checkInput() {
  //   return null
  // }
}
