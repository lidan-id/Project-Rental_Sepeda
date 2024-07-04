import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/rent_status_widget.dart';

class RentStatusPage extends StatelessWidget {
  const RentStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Rent Activity",
          style: TextStyle(fontFamily: "Neue"),
        ),
        foregroundColor: const Color(0xFFF6B17A),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            BikeInRentList(),
            Divider(),
            BookedBikeList(),
            Divider(),
            RentCompleteBikeList()
          ],
        ),
      ),
    );
  }
}
