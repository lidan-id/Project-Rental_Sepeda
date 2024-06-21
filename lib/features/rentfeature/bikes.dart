import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/rent_bottom_sheet.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class Bikes extends StatefulWidget {
  const Bikes({super.key});

  @override
  State<Bikes> createState() => _BikesState();
}

class _BikesState extends State<Bikes> {
  TextEditingController searchInput = TextEditingController();
  bool isSearched(e) {
    if (e.name.contains(searchInput.text)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BikesClass> providerCity =
        Provider.of<BikesProvider>(context).cityBikes;
    List<BikesClass> providerMountain =
        Provider.of<BikesProvider>(context).mountainBikes;
    List<BikesClass> providerRoad =
        Provider.of<BikesProvider>(context).roadBikes;
    List<BikesClass> providerHybrid =
        Provider.of<BikesProvider>(context).hybridBikes;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFF2D3250),
        appBar: AppBar(
          foregroundColor: const Color(0xFFF6B17A),
          backgroundColor: const Color(0xFF2D3250),
          toolbarHeight: 70,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Focus(
              onFocusChange: (value) {
                setState(() {});
              },
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchInput,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Neue", letterSpacing: 3),
                maxLength: 20,
                maxLines: 1,
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff424769)),
                      borderRadius: BorderRadius.circular(100)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 51, 63, 143)),
                      borderRadius: BorderRadius.circular(100)),
                  filled: true,
                  fillColor: const Color(0XFF424769),
                  label: const Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Neue", letterSpacing: 3),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  labelStyle: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Neue",
                      letterSpacing: 3),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ),
          bottom: const TabBar(
            splashFactory: NoSplash.splashFactory,
            indicatorColor: Color(0xFFF6B17A),
            labelColor: Color(0xFFF6B17A),
            unselectedLabelColor: Color.fromARGB(255, 122, 101, 83),
            dividerColor: Color(0xFF2D3250),
            tabs: [
              KategoriTab(
                kategoriTabName: "City",
              ),
              KategoriTab(
                kategoriTabName: "Mountain",
              ),
              KategoriTab(
                kategoriTabName: "Road",
              ),
              KategoriTab(
                kategoriTabName: "Hybrid",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          kategoriBikeList(context, "City Bikes", providerCity),
          kategoriBikeList(context, "Mountain Bikes", providerMountain),
          kategoriBikeList(context, "Road Bikes", providerRoad),
          kategoriBikeList(context, "Hybrid Bikes", providerHybrid),
        ]),
      ),
    );
  }

  SingleChildScrollView kategoriBikeList(BuildContext context,
      String namakategori, List<BikesClass> providerKategori) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            namakategori,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontFamily: 'Neue'),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: providerKategori
                .map((eachbike) => isSearched(eachbike)
                    ? Column(children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return rentBottomSheet(
                                      context, eachbike, namakategori);
                                });
                          },
                          child: kategoriCard(eachbike),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ])
                    : const SizedBox())
                .toList(),
          ),
        ],
      ),
    );
  }

  Card kategoriCard(BikesClass e) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFF424769),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/bikes/${e.picture}'))),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Name : ${e.name}",
                style: const TextStyle(
                    fontSize: 20, fontFamily: 'Neue', color: Color(0xFFF6B17A)),
              ),
              Text('Price : ${e.price}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Neue',
                      color: Color(0xFFF6B17A)))
            ])
          ],
        ),
      ),
    );
  }
}

class KategoriTab extends StatelessWidget {
  const KategoriTab({super.key, required this.kategoriTabName});
  final String kategoriTabName;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        kategoriTabName,
        style: const TextStyle(fontFamily: "Neue", fontSize: 18),
      ),
    );
  }
}
