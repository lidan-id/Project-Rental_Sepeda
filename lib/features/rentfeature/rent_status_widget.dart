import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class CountdownTimerWidget extends StatelessWidget {
  final String rentID;

  const CountdownTimerWidget({super.key, required this.rentID});

  @override
  Widget build(BuildContext context) {
    return Consumer<RentedBikeProvider>(
      builder: (context, provider, child) {
        final remainingDuration =
            provider.remainingDurations[rentID] ?? Duration.zero;

        return Text(
          'Remaining: ${remainingDuration.inHours}:${(remainingDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(remainingDuration.inSeconds % 60).toString().padLeft(2, '0')}',
        );
      },
    );
  }
}

class BikeInRentList extends StatelessWidget {
  const BikeInRentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RentedBikeProvider>(
      builder: (context, rentedBikeProvider, _) {
        final inRentBikeProvider = rentedBikeProvider.bikeInRent;

        return Card(
          color: const Color(0xFFF6B17A),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.directions_bike),
                textColor: Color(0xFFF6B17A),
                title: Text(
                  "Bike in Rent",
                  style: TextStyle(fontFamily: "Neue"),
                ),
              ),
              inRentBikeProvider.isNotEmpty
                  ? SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                          itemCount: inRentBikeProvider.length,
                          itemBuilder: (context, index) {
                            final bike = inRentBikeProvider[index];

                            return ListTile(
                              key: ValueKey(bike.rentID),
                              leading:
                                  Image.asset('assets/bikes/${bike.picture}'),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(bike.name),
                                  Text(
                                      'Paid: \$${bike.paidprice.toStringAsFixed(2)}'),
                                  CountdownTimerWidget(rentID: bike.rentID),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : const Text(
                      "No Bike in Rent",
                      style: TextStyle(
                        fontFamily: "Neue",
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class BookedBikeList extends StatelessWidget {
  const BookedBikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RentedBikeProvider>(
      builder: (context, rentedBikeProvider, _) {
        final bookedBikeProvider = rentedBikeProvider.bookedBike;

        return Card(
          color: const Color(0xFF7077A1),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.timer),
                textColor: Color(0xFFF6B17A),
                title: Text(
                  "Booked Bike",
                  style: TextStyle(fontFamily: "Neue"),
                ),
              ),
              bookedBikeProvider.isNotEmpty
                  ? SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                          itemCount: bookedBikeProvider.length,
                          itemBuilder: (context, index) {
                            final bike = bookedBikeProvider[index];

                            return ListTile(
                              key: ValueKey(bike.rentID),
                              leading:
                                  Image.asset('assets/bikes/${bike.picture}'),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(bike.name),
                                  Text(
                                      'Paid: \$${bike.paidprice.toStringAsFixed(2)}'),
                                  CountdownTimerWidget(rentID: bike.rentID),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : const Text(
                      "No booked bike",
                      style: TextStyle(
                        fontFamily: "Neue",
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class RentCompleteBikeList extends StatelessWidget {
  const RentCompleteBikeList({super.key});

  @override
  Widget build(BuildContext context) {
    final rentCompleteBikeProvider =
        Provider.of<RentedBikeProvider>(context).rentCompleteBike;
    return Card(
      color: const Color(0xFF424769),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.history),
            textColor: Color(0xFFF6B17A),
            title: Text(
              "Rent History",
              style: TextStyle(fontFamily: "Neue"),
            ),
          ),
          rentCompleteBikeProvider.isNotEmpty
              ? SingleChildScrollView(
                  child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    itemCount: rentCompleteBikeProvider.length,
                    itemBuilder: (context, index) {
                      final bike = rentCompleteBikeProvider[index];
                      return ListTile(
                        leading: Image.asset('assets/bikes/${bike.picture}'),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bike.name),
                            Text(
                                'Paid: \$${bike.paidprice.toStringAsFixed(2)}'),
                          ],
                        ),
                      );
                    },
                  ),
                ))
              : const Text(
                  "No rent history",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, color: Colors.grey),
                )
        ],
      ),
    );
  }
}
