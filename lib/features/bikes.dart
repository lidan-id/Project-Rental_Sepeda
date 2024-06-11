import 'package:flutter/material.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFF2D3250),
        appBar: AppBar(
          foregroundColor: const Color(0xFFF6B17A),
          backgroundColor: const Color(0xFF2D3250),
          title: Focus(
            onFocusChange: (value) {
              setState(() {});
            },
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchInput,
              style: const TextStyle(color: Colors.white),
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
                    borderSide: const BorderSide(color: Color(0xff424769)),
                    borderRadius: BorderRadius.circular(100)),
                filled: true,
                fillColor: const Color(0XFF424769),
                labelText: 'Search',
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                labelStyle: const TextStyle(color: Colors.white),
                floatingLabelBehavior: FloatingLabelBehavior.never,
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
              Tab(
                text: 'City',
              ),
              Tab(
                text: 'Mountain',
              ),
              Tab(
                text: 'Road',
              ),
              Tab(
                text: 'Sport',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "City Bikes",
                  style: TextStyle(
                      color: Color(0xFFF6B17A),
                      fontSize: 25,
                      fontFamily: 'Neue'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: Provider.of<BikesProvider>(context)
                      .cityBikes
                      .map((e) => isSearched(e)
                          ? Column(children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                // borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xFF424769),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/bikes/${e.picture}'))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name : ${e.name}",
                                              style: const TextStyle(
                                                  color: Color(0xFFF6B17A)),
                                            ),
                                            Text('Price : ${e.price}',
                                                style: const TextStyle(
                                                    color: Color(0xFFF6B17A)))
                                          ])
                                    ],
                                  ),
                                ),
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
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mountain Bikes',
                  style: TextStyle(
                      color: Color(0xFFF6B17A),
                      fontSize: 25,
                      fontFamily: 'neue'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: Provider.of<BikesProvider>(context)
                      .mountainBikes
                      .map((e) => e.name.contains(searchInput.text)
                          ? Column(children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                // borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xFF424769),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/bikes/${e.picture}'))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name : ${e.name}",
                                              style: const TextStyle(
                                                  color: Color(0xFFF6B17A)),
                                            ),
                                            Text('Price : ${e.price}',
                                                style: const TextStyle(
                                                    color: Color(0xFFF6B17A)))
                                          ])
                                    ],
                                  ),
                                ),
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
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Road Bikes',
                  style: TextStyle(
                      color: Color(0xFFF6B17A),
                      fontSize: 25,
                      fontFamily: 'neue'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: Provider.of<BikesProvider>(context)
                      .roadBikes
                      .map((e) => e.name.contains(searchInput.text)
                          ? Column(children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                // borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xFF424769),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/bikes/${e.picture}'))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name : ${e.name}",
                                              style: const TextStyle(
                                                  color: Color(0xFFF6B17A)),
                                            ),
                                            Text('Price : ${e.price}',
                                                style: const TextStyle(
                                                    color: Color(0xFFF6B17A)))
                                          ])
                                    ],
                                  ),
                                ),
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
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sport Bikes',
                  style: TextStyle(
                      color: Color(0xFFF6B17A),
                      fontSize: 25,
                      fontFamily: 'neue'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: Provider.of<BikesProvider>(context)
                      .sportBikes
                      .map((e) => e.name.contains(searchInput.text)
                          ? Column(children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                // borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xFF424769),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/bikes/${e.picture}'))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name : ${e.name}",
                                              style: const TextStyle(
                                                  color: Color(0xFFF6B17A)),
                                            ),
                                            Text('Price : ${e.price}',
                                                style: const TextStyle(
                                                    color: Color(0xFFF6B17A)))
                                          ])
                                    ],
                                  ),
                                ),
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
          ),
        ]),
      ),
    );
  }
}
