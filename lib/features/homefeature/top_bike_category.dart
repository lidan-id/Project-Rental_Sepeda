import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class TopBikeCategory extends StatelessWidget {
  const TopBikeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bikecategory = [
      "City Bikes",
      "Mountain Bikes",
      "Road Bikes",
      "Hybrid Bikes",
    ];
    final topBikeCategoryProvider =
        Provider.of<TopBikeCategoryProvider>(context);
    final isActive0 = topBikeCategoryProvider.selectedCategoryIndex == 0;
    final isActive1 = topBikeCategoryProvider.selectedCategoryIndex == 1;
    final isActive2 = topBikeCategoryProvider.selectedCategoryIndex == 2;
    final isActive3 = topBikeCategoryProvider.selectedCategoryIndex == 3;

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive0
                ? null
                : () {
                    topBikeCategoryProvider.setSelectedCategoryIndex(0);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_city),
                Spacer(),
                Text(
                  "City Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive1
                ? null
                : () {
                    topBikeCategoryProvider.setSelectedCategoryIndex(1);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.landscape),
                Spacer(),
                Text(
                  "Mountain Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive2
                ? null
                : () {
                    topBikeCategoryProvider.setSelectedCategoryIndex(2);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.sports_motorsports),
                Spacer(),
                Text(
                  "Road Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: isActive3
                ? null
                : () {
                    topBikeCategoryProvider.setSelectedCategoryIndex(3);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              disabledBackgroundColor: const Color(0xFF424769),
              disabledForegroundColor: Colors.grey,
              backgroundColor: const Color(0xFF7077A1),
              foregroundColor: Colors.white,
              fixedSize: const Size.fromHeight(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.directions_bike),
                Spacer(),
                Text(
                  "Hybrid Bikes",
                  style: TextStyle(
                      fontFamily: "Neue", fontSize: 20, letterSpacing: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Top ${bikecategory[Provider.of<TopBikeCategoryProvider>(context).selectedCategoryIndex]}",
            style: const TextStyle(
              color: Color(0xFFF6B17A),
              fontFamily: 'Neue',
              fontSize: 20,
            ),
          ),
          const TopBikeCategoryList(),
        ],
      ),
    );
  }
}

class TopBikeCategoryList extends StatelessWidget {
  const TopBikeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> bikeList =
        Provider.of<TopBikeCategoryProvider>(context).currentCategory;

    return SizedBox(
      height: 250,
      // width: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bikeList.length,
        itemBuilder: (context, index) {
          final imageDirectory = "assets/bikes/${bikeList[index]['bikepic']}";
          final bikeName = bikeList[index]['bikename'];
          final bikeCat = bikeList[index]['bikecat'];
          final bikeDesc = bikeList[index]['bikedesc'];
          final heroTag = "TBCinfo_$bikeName";
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => tbcInfo(
                        context,
                        bikeName,
                        bikeCat,
                        bikeDesc,
                        imageDirectory,
                        heroTag,
                      )));
            },
            child: Hero(
              tag: heroTag,
              child: Card(
                // decoration: BoxDecoration(
                //   color: const Color(0xFF424769),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                color: const Color(0xFF424769),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imageDirectory,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bikeName,
                      style: const TextStyle(
                        fontFamily: 'Neue',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget tbcInfo(BuildContext context, String bikeName, String bikeCat,
        String bikeDesc, String imageDirectory, String heroTag) =>
    Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF7077A1),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Bike info',
          style: TextStyle(fontFamily: 'Neue', fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Hero(
          // transitionOnUserGestures: true,
          tag: heroTag,
          child: Center(
            child: Container(
              color: const Color(0xFF2D3250),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      imageDirectory,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Card(
                        color: const Color(0xFF424769),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(bikeName,
                                style: const TextStyle(
                                    fontFamily: 'Neue',
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFF6B17A),
                                    fontSize: 50)),
                            // Spacer(),
                            Text(bikeCat,
                                style: const TextStyle(
                                    fontFamily: 'Neue',
                                    color: Colors.white,
                                    fontSize: 20)),
                            Text(bikeDesc,
                                style: const TextStyle(
                                  fontFamily: 'Neue',
                                  color: Colors.white,
                                )),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
