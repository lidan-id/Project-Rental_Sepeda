import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:flutter_application_1/provider/provider_component.dart';
import 'package:flutter_application_1/features/signaccountfeature/login.dart';

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
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => PermissionProvider()),
        ChangeNotifierProvider(create: (context) => TopBikeCategoryProvider()),
        ChangeNotifierProvider(create: (context) => BikesProvider()),
        ChangeNotifierProvider(create: (context) => RentedBikeProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF2D3250)),
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}
