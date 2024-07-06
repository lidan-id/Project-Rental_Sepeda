import 'package:flutter/material.dart';

class ChangeName extends StatelessWidget{
  const ChangeName ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
        leading: Builder(builder: (BuildContext) {
          return IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: Icon(Icons.arrow_back));
        }),
      ),
      body: Container(
        child: Text("Test"),
      ),
    );
  }
}