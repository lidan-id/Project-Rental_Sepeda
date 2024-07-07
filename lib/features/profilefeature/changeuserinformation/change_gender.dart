import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class ChangeGender extends StatelessWidget {
  const ChangeGender({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: const Color(0xff7077A1),
      title: Text(
        "Gender",
        style: TextStyle(color: Colors.white),
      ),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Provider.of<LoginProvider>(context, listen: false)
                .changeGender("Male");
            Navigator.of(context).pop();
          },
          child: Text("Male", style: TextStyle(color: Colors.white)),
        ),
        SimpleDialogOption(
          onPressed: () {
            Provider.of<LoginProvider>(context, listen: false)
                .changeGender("Female");
            Navigator.of(context).pop();
          },
          child: Text(
            "Female",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      elevation: 10,
    );
  }
}
