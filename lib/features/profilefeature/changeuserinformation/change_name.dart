import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  TextEditingController editName = TextEditingController();
  bool NameError = false;
  String NameTempInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Name",
          style: TextStyle(fontFamily: 'Neue'),
        ),
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext) {
          return IconButton(
              onPressed: () {
                if (editName.text.isNotEmpty) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .changeName(editName.text);
                  Navigator.of(context).pop();
                } else {
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
                    if (editName.text.isNotEmpty) {
                      NameError = false;
                    } else {
                      NameError = true;
                    }
                  });
                },
                controller: editName,
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                maxLength: 20,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFF6B17A)),
                    labelText:
                        Provider.of<LoginProvider>(context).currentUser.name,
                    labelStyle: TextStyle(color: Color(0xFFF6B17A)),
                    errorText: NameError ? "Name cannot be empty" : null,
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
