import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/signaccountfeature/login.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: CircleAvatar(
                  // maxRadius: MediaQuery.of(context).size.height * 0.1,
                  backgroundImage: AssetImage("assets/banner.jpg"),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              UserProfileMenuWidget(leadingTitle: "Name", menuTitle: "COba",onPress: () {}),
              UserProfileMenuWidget(leadingTitle: "Gender", menuTitle: "COba",onPress: () {}),
              UserProfileMenuWidget(leadingTitle: "Birth Date", menuTitle: "COba",onPress: () {}),
              UserProfileMenuWidget(leadingTitle: "Phone Number", menuTitle: "COba",onPress: () {}),
              UserProfileMenuWidget(leadingTitle: "Email", menuTitle: "COba",onPress: () {}),

            ],
            ),
        ),
      ),
    );
  }
}

class UserProfileMenuWidget extends StatelessWidget {
  const UserProfileMenuWidget({
    super.key,
    required this.leadingTitle,
    required this.menuTitle,
    required this.onPress,
    this.endIcon = true,
  });

  final String leadingTitle;
  final String menuTitle;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Text(leadingTitle,
      style: const TextStyle(
            color: Colors.white, fontSize: 30, fontFamily: 'Neue'),),
      title: Text(textAlign: TextAlign.end,
        menuTitle,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontFamily: 'Neue'),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 50,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(
                color: Colors.grey,
              ))),
              child: const Icon(
                Icons.arrow_right,
                color: Color(0xFFF6B17A),
              ),
            )
          : null,
    );
  }
}