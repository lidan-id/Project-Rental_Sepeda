import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bikes.dart';
import 'package:flutter_application_1/features/profile.dart';
import 'package:flutter_application_1/features/toppup.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  static const List<Widget> menus = [
    HomePage(),
    Bikes(),
    TopUp(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: menus.elementAt(bottomNavProvider.selectedIndex),
      bottomNavigationBar: const NavHomeBawah(),
    );
  }
}

class NavHomeBawah extends StatelessWidget {
  const NavHomeBawah({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: const Color(0xFF2D3250),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  label: "Home", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                label: ("Bikes"),
                icon: Icon(
                  Icons.pedal_bike_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: "Top Up",
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
              ),
            ],
            showUnselectedLabels: false,
            iconSize: MediaQuery.of(context).size.height * 0.05,
            selectedFontSize: MediaQuery.of(context).size.height * 0.02,
            unselectedFontSize: MediaQuery.of(context).size.height * 0.02,
            selectedLabelStyle: const TextStyle(fontFamily: 'Neue'),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Neue'),
            fixedColor: const Color(0xFFF6B17A),
            backgroundColor: const Color(0xFF424769),
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavProvider.selectedIndex,
            onTap: (index) {
              bottomNavProvider.onItemTapped(index);
            }),
      ),
    );
  }
}

class FabHome extends StatelessWidget {
  const FabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Color(0xFFFF6B17A),
      shape: CircleBorder(),
      child: Icon(Icons.location_on),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FabHome(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF2D3250),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [WelcomeBoard(), BikeCategory()],
          ),
        ),
      ),
    );
  }
}

class WelcomeBoard extends StatelessWidget {
  const WelcomeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/banner.jpg",
          width: MediaQuery.of(context).size.width,
          filterQuality: FilterQuality.high,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: const Color(0xFF2D3250).withOpacity(0.85),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.widgets,
                    size: 30,
                    color: Color(0xFFF6B17A),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Text("Hello,",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 25,
                  )),
              Text(Provider.of<LoginProvider>(context).user,
                  style: const TextStyle(
                    color: Color(0xFFF6B17A),
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 35,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class BikeCategory extends StatelessWidget {
  const BikeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bikecategory = [
      "City Bikes",
      "Mountain Bikes",
      "Road Bikes",
      "Sport Bikes",
    ];
    final bikeCategoryProvider = Provider.of<BikeCategoryProvider>(context);
    final isActive0 = bikeCategoryProvider.selectedCategoryIndex == 0;
    final isActive1 = bikeCategoryProvider.selectedCategoryIndex == 1;
    final isActive2 = bikeCategoryProvider.selectedCategoryIndex == 2;
    final isActive3 = bikeCategoryProvider.selectedCategoryIndex == 3;

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive0
                ? null
                : () {
                    bikeCategoryProvider.setSelectedCategoryIndex(0);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_city),
                Spacer(),
                Text(
                  "City Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive1
                ? null
                : () {
                    bikeCategoryProvider.setSelectedCategoryIndex(1);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.landscape),
                Spacer(),
                Text(
                  "Mountain Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive2
                ? null
                : () {
                    bikeCategoryProvider.setSelectedCategoryIndex(2);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.sports_motorsports),
                Spacer(),
                Text(
                  "Road Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive3
                ? null
                : () {
                    bikeCategoryProvider.setSelectedCategoryIndex(3);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.directions_bike),
                Spacer(),
                Text(
                  "Sport Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Top ${bikecategory[Provider.of<BikeCategoryProvider>(context).selectedCategoryIndex]}",
            style: const TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
          ),
          const BikeList(),
        ],
      ),
    );
  }
}

class BikeList extends StatelessWidget {
  const BikeList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bikeList =
        Provider.of<BikeCategoryProvider>(context).currentCategory;

    return SizedBox(
      height: 250,
      width: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bikeList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            // decoration: BoxDecoration(
            //   color: const Color(0xFF424769),
            //   borderRadius: BorderRadius.circular(15),
            // ),
            color: const Color(0xFF424769),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/${bikeList[index]['bikepic']}",
                  height: 160,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  bikeList[index]['bikename'],
                  style: const TextStyle(
                    fontFamily: 'Neue',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
