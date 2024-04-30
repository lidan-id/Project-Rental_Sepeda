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
          padding: const EdgeInsets.all(25),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.widgets,
                size: 30,
                color: Color(0xFFF6B17A),
              ),
              WelcomeBanner(),
              Text("Categories",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 30,
                  )),
              Text("Top in ... Categories",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 30,
                  )),
            ],
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
    return Text("Hi User, Ready to ride?",
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 5,
          fontFamily: 'Neue',
          fontSize: 30,
        ));
  }
}
