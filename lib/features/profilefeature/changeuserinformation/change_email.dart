import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class ChangeEmail extends StatefulWidget{
  const ChangeEmail ({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  TextEditingController editEmail = TextEditingController();
  bool EmailError = false;
  String EmailTempInput = '';

  bool validateEmail(String value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email"),
        leading: Builder(builder: (BuildContext) {
          return IconButton(
            onPressed: () {
              if (validateEmail(editEmail.text)) {
                Provider.of<LoginProvider>(context, listen: false).changeEmail(editEmail.text);
              Navigator.of(context).pop();
              }
              else {
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.arrow_back));
        }),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, top: 10, right: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              TextFormField(
                    onChanged: (value) {
                      setState(() {
                      
                      if (validateEmail(editEmail.text)) {
                        EmailError = false;
                      }
                      else {
                        EmailError = true;
                      }
                      });
                    },
                    controller: editEmail,
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                    maxLength: 20,
                    decoration: InputDecoration(
                        labelText: Provider.of<LoginProvider>(context).currentUser.email,
                        labelStyle: TextStyle(),
                        errorText: EmailError? "email not valid" : null,
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(width: 5,)
            ],
          ),
        ),
      ),
    );
  }
}