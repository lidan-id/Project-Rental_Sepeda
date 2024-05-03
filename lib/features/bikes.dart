import 'package:flutter/cupertino.dart';
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Provider.of<BikesProvider>(context)
                      .cityBikes
                      .map((e) => Container(
                            height: 100,
                            width: 100,
                            color: Colors.red,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
