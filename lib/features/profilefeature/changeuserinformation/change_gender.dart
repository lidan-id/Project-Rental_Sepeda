import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class ChangeGender extends StatelessWidget{
  const ChangeGender ({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Gender"),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Provider.of<LoginProvider>(context, listen: false).changeGender("Male");
            Navigator.of(context).pop();

          },
          child: Text("Male"),
        ),
        SimpleDialogOption(
          onPressed: () {
            Provider.of<LoginProvider>(context, listen: false).changeGender("Female");
            Navigator.of(context).pop();
          },
          child: Text("Female"),
        ),
      ],
      elevation: 10,
    );
  }
}