import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class Bikes extends StatefulWidget {
  const Bikes({super.key});

  @override
  State<Bikes> createState() => _BikesState();
}

class _BikesState extends State<Bikes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3250),
      appBar: AppBar(
          foregroundColor: const Color(0xFFF6B17A),
          backgroundColor: const Color(0xFF2D3250),
          title: const Text('Bikes', style: TextStyle(fontFamily: 'Neue'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'City Bikes',
              style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: Provider.of<BikesProvider>(context)
                  .cityBikes
                  .map((e) => Column(children: [
                        Card(
                          // padding: EdgeInsets.all(10),
                          clipBehavior: Clip.hardEdge,
                          color: const Color(0xFF424769),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/bikes/${e.picture}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 5,
                        )
                      ]))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Mountain Bikes',
              style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: Provider.of<BikesProvider>(context)
                  .mountainBikes
                  .map((e) => Column(children: [
                        Card(
                          // padding: EdgeInsets.all(10),
                          clipBehavior: Clip.hardEdge,
                          color: const Color(0xFF424769),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/bikes/${e.picture}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 5,
                        )
                      ]))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Road Bikes',
              style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: Provider.of<BikesProvider>(context)
                  .roadBikes
                  .map((e) => Column(children: [
                        Card(
                          // padding: EdgeInsets.all(10),
                          clipBehavior: Clip.hardEdge,
                          color: const Color(0xFF424769),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/bikes/${e.picture}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 5,
                        )
                      ]))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sport Bikes',
              style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: Provider.of<BikesProvider>(context)
                  .sportBikes
                  .map((e) => Column(children: [
                        Card(
                          // padding: EdgeInsets.all(10),
                          clipBehavior: Clip.hardEdge,
                          color: const Color(0xFF424769),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/bikes/${e.picture}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(
                          height: 5,
                        )
                      ]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
