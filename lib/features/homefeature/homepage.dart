import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/bikes.dart';
import 'package:flutter_application_1/features/profilefeature/profile.dart';
import 'package:flutter_application_1/features/topupfeature/toppup.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';
import 'nav_home_bawah.dart';
import 'top_bike_category.dart';
import 'welcome_board.dart';

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
            children: [WelcomeBoard(), TopBikeCategory()],
          ),
        ),
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
      backgroundColor: const Color(0xFFF6B17A),
      shape: const CircleBorder(),
      child: const Icon(Icons.location_on),
    );
  }
}
