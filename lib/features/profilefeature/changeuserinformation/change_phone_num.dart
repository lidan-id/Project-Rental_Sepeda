import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class changePhoneNumber extends StatefulWidget {
  const changePhoneNumber({super.key});

  @override
  State<changePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<changePhoneNumber> {
  TextEditingController editNoTlp = TextEditingController();
  bool NoTlpError = false;
  int NoTlpTempInput = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Phone Number",
          style: TextStyle(fontFamily: 'Neue'),
        ),
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext) {
          return IconButton(
              onPressed: () {
                if (editNoTlp.text.isNotEmpty &&
                    !(editNoTlp.text.length < 12)) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .changePhoneNumber(int.parse(editNoTlp.text));
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
                    if (editNoTlp.text.isNotEmpty) {
                      NoTlpError = false;
                    } else {
                      NoTlpError = true;
                    }
                  });
                },
                controller: editNoTlp,
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                maxLength: 20,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFF6B17A)),
                    labelText: "0" +
                        Provider.of<LoginProvider>(context)
                            .currentUser
                            .noTlp
                            .toString(),
                    labelStyle: TextStyle(color: Color(0xFFF6B17A)),
                    errorText: NoTlpError ? "Phone number not valid" : null,
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
