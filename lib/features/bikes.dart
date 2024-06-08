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
      backgroundColor: Color(0xFF2D3250),
      appBar: AppBar(
          foregroundColor: const Color(0xFFF6B17A),
          backgroundColor: const Color(0xFF2D3250),
          title: Text('Bikes', style: TextStyle(fontFamily: 'Neue'))),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'City Bikes',
                style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: Provider.of<BikesProvider>(context)
                    .cityBikes
                    .map((e) => Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color(0xFFF424769),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : " + e.name,
                                        style:
                                            TextStyle(color: Color(0xFFF6B17A)),
                                      ),
                                      Text('Price : ' + e.price,
                                          style: TextStyle(
                                              color: Color(0xFFF6B17A)))
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Mountain Bikes',
                style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: Provider.of<BikesProvider>(context)
                    .mountainBikes
                    .map((e) => Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color(0xFFF424769),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : " + e.name,
                                        style:
                                            TextStyle(color: Color(0xFFF6B17A)),
                                      ),
                                      Text('Price : ' + e.price,
                                          style: TextStyle(
                                              color: Color(0xFFF6B17A)))
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Road Bikes',
                style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: Provider.of<BikesProvider>(context)
                    .roadBikes
                    .map((e) => Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color(0xFFF424769),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : " + e.name,
                                        style:
                                            TextStyle(color: Color(0xFFF6B17A)),
                                      ),
                                      Text('Price : ' + e.price,
                                          style: TextStyle(
                                              color: Color(0xFFF6B17A)))
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sport Bikes',
                style: TextStyle(color: Color(0xFFF6B17A), fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: Provider.of<BikesProvider>(context)
                    .sportBikes
                    .map((e) => Column(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color(0xFFF424769),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name : " + e.name,
                                        style:
                                            TextStyle(color: Color(0xFFF6B17A)),
                                      ),
                                      Text('Price : ' + e.price,
                                          style: TextStyle(
                                              color: Color(0xFFF6B17A)))
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
