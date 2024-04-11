import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: const Color(0xFF2D3250),
        title: const Hero(
          tag: 'Profile',
          child: SizedBox(
            child: Text(
              'Profile',
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF2D3250),
      ),
    );
  }
}
