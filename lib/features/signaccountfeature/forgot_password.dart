import 'package:flutter/material.dart';

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
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
          backgroundColor: const Color(0xFFF7077A1),
          title: const Text("Verification sended to email"),
          content: const TextField(
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
                child: const Text('Back')),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B17A),
                  foregroundColor: Colors.white),
              child: const Text('Submit'),
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
        title: const Text('Forgot Password'),
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: const Color(0xFFF2D3250),
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
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Color(0xFFF6B17A)),
                    errorText: errorText,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  showAutoDismiss(context);
                  emailTempInput = emailInput.text;
                  emailInput.text = '';
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6B17A),
                    foregroundColor: Colors.white),
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
