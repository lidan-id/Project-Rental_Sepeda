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
        'bikecat': 'City Bikes',
        'bikedesc':
            'The Nakto Classic is a stylish and reliable city bike, perfect for renters seeking a smooth urban ride. Its sturdy steel frame and comfortable upright riding position make it easy to navigate through city streets. With a convenient front basket and easy step-through design, the Nakto Classic is ideal for running errands or leisurely rides around town. Renters will appreciate its blend of functionality and classic aesthetics for their daily commutes.'
      },
      {
        'bikepic': 'bike11.webp',
        'bikename': 'Evelo',
        'bikecat': 'City Bikes',
        'bikedesc':
            'The Evelo city bike is designed for urban adventurers looking for a hassle-free rental experience. Its sleek design and lightweight frame ensure a comfortable ride, while the powerful motor provides an extra boost for tackling inclines and longer journeys. Integrated lights and a durable build make the Evelo a reliable choice for city exploration. Perfect for those who value efficiency and style in their rental bike.'
      },
      {
        'bikepic': 'bike12.webp',
        'bikename': 'RadCity5',
        'bikecat': 'City Bikes',
        'bikedesc':
            'The RadCity5 is the perfect rental option for those who want a high-performance city bike. Equipped with a powerful motor and long-lasting battery, it can handle longer distances and steeper hills with ease. The ergonomic design, featuring adjustable handlebars and a cushioned saddle, ensures maximum comfort for renters. With built-in safety features like integrated lights and a sturdy frame, the RadCity5 is ideal for navigating urban environments.'
      },
    ],
    [
      //Mountain Bikes
      {
        'bikepic': 'bike20.webp',
        'bikename': 'MTB Aro 29',
        'bikecat': 'Mountain Bikes',
        'bikedesc':
            'The MTB Aro 29 is the ultimate rental choice for thrill-seekers and nature enthusiasts. Its 29-inch wheels provide excellent stability and traction, making it perfect for tackling rugged trails. The durable frame and responsive suspension absorb shocks, ensuring a smooth ride even on the toughest terrains. Ideal for adventurous renters looking to explore mountain trails and off-road paths with confidence.'
      },
      {
        'bikepic': 'bike21.webp',
        'bikename': 'Phoenix MB26',
        'bikecat': 'Mountain Bikes',
        'bikedesc':
            'The Phoenix MB26 is a versatile mountain bike that caters to various terrains, making it a great rental option. Its sturdy frame and reliable suspension handle rough trails and smooth paths with ease. The 26-inch wheels offer agility and precision, suitable for both beginners and seasoned riders. Renters will appreciate the comfortable riding position and reliable brakes, making the Phoenix MB26 a dependable choice for outdoor adventures.'
      },
      {
        'bikepic': 'bike22.webp',
        'bikename': 'Dynacraft',
        'bikecat': 'Mountain Bikes',
        'bikedesc':
            'The Dynacraft mountain bike is built for renters who crave outdoor exploration. Its durable frame and robust suspension are designed to handle the most challenging trails, providing a reliable and enjoyable riding experience. With high-quality components and a focus on comfort, the Dynacraft ensures longevity and performance. Perfect for renters looking to navigate rocky paths or forest trails with ease.'
      },
    ],
    [
      //Road Bikes
      {
        'bikepic': 'bike30.webp',
        'bikename': 'Bianchi',
        'bikecat': 'Road Bikes',
        'bikedesc':
            'The Bianchi road bike is an excellent rental for cyclists who demand speed and performance. Known for its lightweight frame and aerodynamic design, it offers exceptional agility on paved roads. Smooth gear shifts and responsive handling make it ideal for competitive cyclists and serious enthusiasts. Renters will appreciate the combination of Italian craftsmanship and high-quality components that define the Bianchi road bike.'
      },
      {
        'bikepic': 'bike31.webp',
        'bikename': 'Cinelli',
        'bikecat': 'Road Bikes',
        'bikedesc':
            "Cinelli road bikes are perfect for renters seeking a blend of innovation and tradition. Designed for speed and efficiency, these bikes feature lightweight frames and advanced aerodynamics. The precise construction ensures a smooth and fast ride, ideal for racing and long-distance cycling. Cinelli's commitment to quality makes their road bikes a preferred rental choice for cyclists who seek both style and performance."
      },
      {
        'bikepic': 'bike32.webp',
        'bikename': 'Canyon',
        'bikecat': 'Road Bikes',
        'bikedesc':
            'Canyon road bikes are celebrated for their cutting-edge technology and performance-oriented design, making them a top rental option. Lightweight materials and optimized speed offer an exhilarating riding experience. With excellent power transfer and stability, Canyon bikes are favored by competitive riders. Renters will appreciate the innovative features and high-quality construction that make Canyon a leader in road cycling.'
      },
    ],
    [
      //Hybrid Bikes
      {
        'bikepic': 'bike40.webp',
        'bikename': 'Pendleton Somerby',
        'bikecat': 'Hybrid Bikes',
        'bikedesc':
            'The Pendleton Somerby is a charming hybrid bike, perfect for renters looking for both comfort and style. Ideal for leisurely rides and city commutes, it features a lightweight frame and an upright riding position. Practical elements like a rear rack and front basket make it easy to carry groceries or picnic supplies. Renters will enjoy the blend of aesthetics and functionality for everyday journeys.'
      },
      {
        'bikepic': 'bike41.webp',
        'bikename': 'Trek FX Carbon 4',
        'bikecat': 'Hybrid Bikes',
        'bikedesc':
            'The Trek FX Carbon 4 hybrid bike combines performance with versatility, making it an ideal rental choice. Its carbon frame ensures a lightweight and responsive ride, perfect for fitness enthusiasts and urban commuters. The ergonomic design and quality components provide a smooth and efficient ride, whether navigating city streets or exploring bike paths. Renters seeking a high-performing hybrid bike will find the Trek FX Carbon 4 to be an excellent option.'
      },
      {
        'bikepic': 'bike42.webp',
        'bikename': 'Schwinn',
        'bikecat': 'Hybrid Bikes',
        'bikedesc':
            'The Schwinn hybrid bike offers a perfect blend of road bike speed and mountain bike durability, making it a versatile rental choice. Its robust frame and comfortable riding position are suitable for various terrains. Whether commuting to work or going on a weekend adventure, the Schwinn hybrid bike provides a reliable and enjoyable ride. Renters of all levels will appreciate its practical design and quality construction.'
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
    BikesClass(name: 'Nakto Classic', picture: "bike10.webp", price: '330000'),
    BikesClass(name: 'Evelo', picture: "bike11.webp", price: '330000'),
    BikesClass(name: 'RadCity5', picture: "bike12.webp", price: '330000'),
    BikesClass(name: 'bikers 331', picture: "bike10.webp", price: '330000'),
    BikesClass(name: 'poulu 22', picture: "bike11.webp", price: '330000'),
  ];
  List<BikesClass> mountainBikes = [
    BikesClass(name: 'MTB Aro 29', picture: "bike20.webp", price: '330000'),
    BikesClass(name: 'Dynacraft', picture: "bike21.webp", price: '330000'),
    BikesClass(name: 'lambo 11', picture: "bike22.webp", price: '330000'),
    BikesClass(name: 'Phoenix MB26', picture: "bike20.webp", price: '330000'),
    BikesClass(
        name: 'mountains lite 332', picture: "bike21.webp", price: '330000'),
  ];
  List<BikesClass> roadBikes = [
    BikesClass(name: 'Bianchi', picture: "bike30.webp", price: '330000'),
    BikesClass(name: 'river road', picture: "bike31.webp", price: '330000'),
    BikesClass(name: 'roronoa road', picture: "bike32.webp", price: '330000'),
    BikesClass(name: 'Canyon', picture: "bike30.webp", price: '330000'),
    BikesClass(name: 'Cinelli', picture: "bike31.webp", price: '330000'),
  ];
  List<BikesClass> hybridBikes = [
    BikesClass(
        name: 'Pendleton Somerby', picture: "bike40.webp", price: '330000'),
    BikesClass(
        name: 'Trek FX Carbon 4', picture: "bike41.webp", price: '330000'),
    BikesClass(name: 'srr 889', picture: "bike42.webp", price: '330000'),
    BikesClass(name: 'super main 21', picture: "bike40.webp", price: '330000'),
    BikesClass(name: 'Schwinn', picture: "bike41.webp", price: '330000'),
  ];
  //  checkInput() {
  //   return null
  // }
}
