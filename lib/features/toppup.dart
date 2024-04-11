import 'package:flutter/material.dart';

class TopUp extends StatelessWidget {
  const TopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: const Color(0xFF2D3250),
        title: const Hero(
          tag: 'Top-Up',
          child: SizedBox(
            child: Text(
              'Top-Up',
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
