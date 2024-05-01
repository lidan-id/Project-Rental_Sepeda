import 'package:flutter/material.dart';
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
    Profile(),
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
                label: ("Rent"),
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
            backgroundColor: const Color(0xFF7077A1),
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavProvider.selectedIndex,
            onTap: (index) {
              bottomNavProvider.onItemTapped(index);
            }),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          color: const Color(0xFF2D3250),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [WelcomeBanner(), BikeCategory()],
          ),
        ),
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/banner.jpg",
          width: MediaQuery.of(context).size.width,
          filterQuality: FilterQuality.high,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
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
                height: 30,
              ),
              const Text("Hello,",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 20,
                  )),
              Text(Provider.of<LoginProvider>(context).user,
                  style: const TextStyle(
                    color: Color(0xFFF6B17A),
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 34,
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
            onPressed: () {},
            child: const Text(
              "City Bikes",
              style: TextStyle(fontFamily: "Neue", fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Road Bikes",
              style: TextStyle(fontFamily: "Neue", fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Mountain Bikes",
              style: TextStyle(fontFamily: "Neue", fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Sport Bikes",
              style: TextStyle(fontFamily: "Neue", fontSize: 20),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Top Bikes",
            style: TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
            //tampilan disini
          )
        ],
      ),
    );
  }
}
/* TO DO:
1. Add Logic Bike List Card
2. Style Button
 */