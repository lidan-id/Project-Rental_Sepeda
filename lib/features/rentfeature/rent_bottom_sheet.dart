import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'rent_option_buttons.dart';

Widget rentBottomSheet(BuildContext context, eachbike, namakategori) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      color: const Color(0xFF7077A1),
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 5,
              color: const Color(0xFF2D3250),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: RentBikeInfo(
              eachbike: eachbike,
              namakategori: namakategori,
            ),
          ),
        ],
      ),
    ),
  );
}

class RentBikeInfo extends StatelessWidget {
  const RentBikeInfo({
    super.key,
    required this.eachbike,
    required this.namakategori,
  });

  final BikesClass eachbike;
  final String namakategori;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage("assets/bikes/${eachbike.picture}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namakategori,
                style: const TextStyle(
                    fontFamily: "Neue",
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
              Text(
                eachbike.name,
                style: const TextStyle(
                    fontFamily: "Neue", fontSize: 35, color: Color(0xFF2D3250)),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      RentsButton(eachbike: eachbike),
      RentOptionShow(
        eachbike: eachbike,
      ),
    ]);
  }
}
