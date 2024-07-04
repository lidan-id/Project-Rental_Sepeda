import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/banktopup.dart
import 'package:flutter_application_1/features/homepage.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
=======
import 'package:flutter_application_1/features/homefeature/homepage.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
>>>>>>> main:lib/features/topupfeature/banktopup.dart
import 'package:provider/provider.dart';

class BankTopUp extends StatefulWidget {
  const BankTopUp({super.key});

  @override
  State<BankTopUp> createState() => _TopUpState();
}

class _TopUpState extends State<BankTopUp> {
  final MoneyMaskedTextController nominalInput = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  bool isPass = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3250),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nominalInput,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Color(0xFFF6B17A), fontFamily: 'Neue'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF22264f), width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  label: Text("Nomimal TopUp"),
                  labelStyle: TextStyle(color: Color(0xFFF6B17A)),
                  hintText: "Masukkan Nominal TopUp",
                  hintStyle: TextStyle(color: Colors.grey),
                  errorText: isPass ? null : "Minimal Top Up Rp 5.000",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await Future.delayed(Duration(seconds: 2));

                    setState(() {
                      String nominalText = nominalInput.text.replaceAll('.', '');
                      double nominal = double.parse(nominalText);
                      if (nominal >= 5000) {
                        Provider.of<SaldoProvider>(context, listen: false)
                            .topUp(nominal);
                        isPass = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Top Up berhasil!'))
                        );
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeMenu()),
                          (route) => false,
                        );
                      } else {
                        isPass = false;
                      }
                      isLoading = false;
                    });
                  },
                  child: Text("Top Up")),
              if (isLoading)
                SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
