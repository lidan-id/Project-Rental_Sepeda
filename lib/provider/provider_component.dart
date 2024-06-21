import 'package:flutter/material.dart';

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

class PermissionProvider with ChangeNotifier {
  bool cameraEnabled = false;
  bool locationEnabled = true;
  bool microphoneEnabled = false;
  bool historyEnabled = false;

  void toggleCamera() {
    cameraEnabled = !cameraEnabled;
    notifyListeners();
  }

  void toggleLocation() {
    locationEnabled = !locationEnabled;
    notifyListeners();
  }

  void toggleMicrophone() {
    microphoneEnabled = !microphoneEnabled;
    notifyListeners();
  }

  void toggleHistory() {
    historyEnabled = !historyEnabled;
    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  int _notificationRadio = 0;
  int get notificationRadio => _notificationRadio;
  bool transactionsChecked = false;
  bool nearYouChecked = false;
  bool weeklySummaryChecked = false;
  bool specialOffersChecked = false;
  bool eventChecked = false;
  bool appUpdatesChecked = false;

  void setNotificationRadio(int value) {
    _notificationRadio = value;
    notifyListeners();
  }

  void setTransactionsChecked(bool value) {
    transactionsChecked = value;
    notifyListeners();
  }

  void setNearYouChecked(bool value) {
    nearYouChecked = value;
    notifyListeners();
  }

  void setWeeklySummaryChecked(bool value) {
    weeklySummaryChecked = value;
    notifyListeners();
  }

  void setSpecialOffersChecked(bool value) {
    specialOffersChecked = value;
    notifyListeners();
  }

  void setEventChecked(bool value) {
    eventChecked = value;
    notifyListeners();
  }

  void setAppUpdatesChecked(bool value) {
    appUpdatesChecked = value;
    notifyListeners();
  }
}
