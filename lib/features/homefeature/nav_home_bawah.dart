import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class NavHomeBawah extends StatelessWidget {
  const NavHomeBawah({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.095,
      color: const Color(0xFF2D3250),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(25)),
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
            iconSize: MediaQuery.of(context).size.height * 0.04,
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
