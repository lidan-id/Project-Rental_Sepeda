import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/rent_status_page.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final rentedBikeProvider =
        Provider.of<RentedBikeProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Dashboard",
            style: TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RentStatusPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashItem(rentedBikeProvider.bikeInRent.length, "Bike in rent"),
                dashItem(rentedBikeProvider.bookedBike.length, "Booked bike"),
                dashItem(rentedBikeProvider.rentCompleteBike.length,
                    "Completed Rent"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column dashItem(int total, String tipe) {
    return Column(
      children: [
        Text(
          total.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Neue',
            fontSize: 30,
          ),
        ),
        Text(
          tipe,
          style: const TextStyle(
            color: Color(0xFF7077A1),
            fontFamily: 'Neue',
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
