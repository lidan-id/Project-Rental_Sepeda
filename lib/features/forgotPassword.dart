import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int validVerifNumber = 0;
  TextEditingController emailInput = TextEditingController();
  TextEditingController verifNumberInput = TextEditingController();
  String emailTempInput = '';
  String? errorText = null;
  Future sendEmail({required int verifNumber}) async {
    final serviceId = 'service_lbrucr8';
    final templateId = 'template_o6d0rat';
    final userId = '3xJ0zN-aTPGUous8n';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': 'kevinlidan12@gmail.com',
            'to_email': emailInput.text,
            'user_subject': 'Verification Number Re:Bike',
            'user_message': verifNumber,
          }
        }));
    return response.statusCode;
  }

  void showAutoDismissAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(minutes: 1), () {
          validVerifNumber = 0;
          Navigator.of(context).pop();
        });

        return AlertDialog(
          backgroundColor: Color(0xFFF7077A1),
          title: Text("Verification sended to email"),
          content: TextField(
            controller: verifNumberInput,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
            decoration: InputDecoration(
                labelText: 'Verification Number',
                labelStyle: TextStyle(color: Color(0xFFF6B17A)),
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
                  validVerifNumber = 0;
                },
                child: Text('Back')),
            ElevatedButton(
              onPressed: () {
                if (verifNumberInput.text == validVerifNumber.toString()) {
                  print('betullll');
                } else {
                  print("salahhh");
                }
              },
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
                  Provider.of<ForgotPasswordProvider>(context, listen: false)
                      .checkUserEmail(
                          Provider.of<RegisterProvider>(context, listen: false)
                              .users,
                          emailInput.text);
                  if (Provider.of<ForgotPasswordProvider>(context,
                              listen: false)
                          .userChangePassword ==
                      null) {
                    errorText = "Can't find the email";
                  } else {
                    Random random = new Random();
                    int randomNumber = random.nextInt(99999) + 99999;
                    validVerifNumber = randomNumber;
                    FocusScope.of(context).unfocus();
                    showAutoDismissAlert(context);
                    emailTempInput = emailInput.text;
                    // emailInput.text = '';
                    sendEmail(verifNumber: randomNumber);
                    Provider.of<ForgotPasswordProvider>(context, listen: false)
                        .resetUserChangePassword();
                  }
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
