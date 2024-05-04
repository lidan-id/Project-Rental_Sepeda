import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login.dart';
import 'package:flutter_application_1/features/profile.dart';
import 'package:flutter_application_1/features/profilefeature/permission.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/features/profilefeature/notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => SaldoProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => PermissionProvider()),
        ChangeNotifierProvider(create: (context) => BikeCategoryProvider()),
        ChangeNotifierProvider(create: (context) => BikesProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xFF2D3250)),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
