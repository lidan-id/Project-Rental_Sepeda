import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class CountdownTimerWidget extends StatelessWidget {
  final String rentID;
  final String prolog;
  final String epilogue;

  const CountdownTimerWidget(
      {super.key,
      required this.rentID,
      required this.prolog,
      required this.epilogue});

  @override
  Widget build(BuildContext context) {
    return Consumer<RentedBikeProvider>(
      builder: (context, provider, child) {
        final remainingDuration =
            provider.remainingDurations[rentID] ?? Duration.zero;

        return Text(
          '$prolog ${remainingDuration.inHours}:${(remainingDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(remainingDuration.inSeconds % 60).toString().padLeft(2, '0')} $epilogue',
          maxLines: 1,
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
                textColor: Color(0xFF424769),
                title: Text(
                  "Bike in Rent",
                  style: TextStyle(fontFamily: "Neue"),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: inRentBikeProvider.isNotEmpty
                      ? ListView.builder(
                          itemCount: inRentBikeProvider.length,
                          itemBuilder: (context, index) {
                            final bike = inRentBikeProvider[index];

                            return ListTile(
                              key: ValueKey(bike.rentID),
                              leading: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      'assets/bikes/${bike.picture}')),
                              title: Text(bike.name),
                              titleTextStyle: const TextStyle(
                                  fontFamily: "neue",
                                  color: Color(0xFF424769),
                                  fontSize: 20),
                              subtitle: Text(
                                "Rent start on ${bike.rentDate}",
                                maxLines: 1,
                              ),
                              subtitleTextStyle: const TextStyle(
                                fontFamily: "neue",
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF424769),
                              ),
                              trailing: CountdownTimerWidget(
                                rentID: bike.rentID,
                                prolog: "",
                                epilogue: "time left",
                              ),
                              titleAlignment: ListTileTitleAlignment.center,
                              leadingAndTrailingTextStyle: const TextStyle(
                                  fontFamily: "neue",
                                  color: Color(0xFF424769),
                                  fontSize: 15),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "No Bike in Rent",
                            style: TextStyle(
                              fontFamily: "Neue",
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
              )
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
                leading: Icon(
                  Icons.timer,
                  color: Color(0xFF2D3250),
                ),
                textColor: Color(0xFF2D3250),
                title: Text(
                  "Booked Bike",
                  style: TextStyle(
                    fontFamily: "Neue",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: bookedBikeProvider.isNotEmpty
                      ? ListView.builder(
                          itemCount: bookedBikeProvider.length,
                          itemBuilder: (context, index) {
                            final bike = bookedBikeProvider[index];

                            return ListTile(
                              key: ValueKey(bike.rentID),
                              leading: ClipRRect(
                                  clipBehavior: Clip.hardEdge,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      'assets/bikes/${bike.picture}')),
                              title: Text(bike.name),
                              titleTextStyle: const TextStyle(
                                  fontFamily: "neue",
                                  color: Color(0xFF2D3250),
                                  fontSize: 20),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Booked on  ${bike.bookedDate}",
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  CountdownTimerWidget(
                                    rentID: bike.rentID,
                                    prolog: "rent will start in ",
                                    epilogue: "",
                                  ),
                                ],
                              ),
                              titleAlignment: ListTileTitleAlignment.center,
                              isThreeLine: true,
                              subtitleTextStyle: const TextStyle(
                                fontFamily: "neue",
                                color: Color(0xFF2D3250),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "No booked bike",
                            style: TextStyle(
                              fontFamily: "Neue",
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
              )
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
            leading: Icon(
              Icons.history,
              color: Colors.white,
            ),
            textColor: Colors.white,
            title: Text(
              "Rent History",
              style: TextStyle(fontFamily: "Neue"),
            ),
          ),
          SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: rentCompleteBikeProvider.isNotEmpty
                ? ListView.builder(
                    itemCount: rentCompleteBikeProvider.length,
                    itemBuilder: (context, index) {
                      final bike = rentCompleteBikeProvider[index];
                      return ListTile(
                        leading: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                                fit: BoxFit.cover,
                                'assets/bikes/${bike.picture}')),
                        title: Text(bike.name),
                        titleTextStyle: const TextStyle(
                            fontFamily: "neue",
                            color: Colors.white,
                            fontSize: 20),
                        subtitle: Text(
                          "Completed on ${bike.completeDate}",
                          maxLines: 1,
                        ),
                        subtitleTextStyle: const TextStyle(
                          fontFamily: "neue",
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        trailing: Text(
                          "Rp${bike.paidprice}",
                          maxLines: 1,
                        ),
                        titleAlignment: ListTileTitleAlignment.center,
                        leadingAndTrailingTextStyle: const TextStyle(
                            fontFamily: "neue",
                            color: Colors.white,
                            fontSize: 15),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No rent history",
                      style: TextStyle(
                        fontFamily: "Neue",
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          ))
        ],
      ),
    );
  }
}
