import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailInput = TextEditingController();
  String emailTempInput = '';
  String? errorText = null;

  void showAutoDismiss(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
          backgroundColor: Color(0xFFF7077A1),
          title: Text("Verification sended to email"),
          content: TextField(
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            decoration: InputDecoration(
                labelText: 'Verification Number',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white))),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back')),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6B17A),
                  foregroundColor: Colors.white),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        foregroundColor: Color(0xFFF6B17A),
        backgroundColor: Color(0xFFF2D3250),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2D3250), Color(0xFF424769)])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    emailInput.text = value.trim();
                    if (emailTempInput != emailInput.text) {
                      errorText = null;
                    }
                  });
                },
                controller: emailInput,
                style: TextStyle(color: Colors.white),
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFFF6B17A)),
                    errorText: errorText,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  showAutoDismiss(context);
                  emailTempInput = emailInput.text;
                  emailInput.text = '';
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF6B17A),
                    foregroundColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
