import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/profile.dart';
import 'package:flutter_application_1/features/toppup.dart';

class Menus {
  String menu;
  String fileName;
  Widget widget;

  Menus({required this.menu, required this.fileName, required this.widget});
}

var p1 =
    Menus(menu: "Profile", fileName: "profile.webp", widget: const Profile());

var p2 = Menus(menu: "Top-Up", fileName: "topup.webp", widget: const TopUp());

// Ubah widget sesuai Widget Rent
var p3 = Menus(menu: "Rent", fileName: "logo.png", widget: const Profile());
