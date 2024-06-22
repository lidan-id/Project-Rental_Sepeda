import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/rentfeature/rent_option_buttons.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

Future<Widget> rentNowComponent(eachbike) async {
  return const Text("Sampleduration * price for now");
}

class RentNowComponent extends StatefulWidget {
  const RentNowComponent({super.key, required this.eachbike});

  final BikesClass eachbike;

  @override
  State<RentNowComponent> createState() => _RentNowComponentState();
}

class _RentNowComponentState extends State<RentNowComponent> {
  final _rentNowKey = GlobalKey<FormState>();
  String _selectedOption = 'Hour(s)';
  @override
  Widget build(BuildContext context) {
    double durasi = 0;
    double hargaBayar = 0;
    double balance = Provider.of<SaldoProvider>(context).saldo;
    return Form(
      key: _rentNowKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) => durasi = double.parse(value),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: const InputDecoration(
                labelText: 'Duration',
                labelStyle:
                    TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
                prefixIcon: Icon(
                  Icons.hourglass_bottom_outlined,
                  color: Color(0xFFF6B17A),
                ),
                hintStyle:
                    TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF6B17A))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF6B17A)))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter rent duration';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField<String>(
            value: _selectedOption,
            items: <String>['Hour(s)', 'Day(s)', 'Week(s)'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Time Units',
              labelStyle:
                  TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
              prefixIcon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFF6B17A),
              ),
              hintStyle:
                  TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF6B17A)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF6B17A)),
              ),
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue!;
                if (newValue == 'Hour(s)') {
                  hargaBayar = durasi * 1;
                }
                if (newValue == 'Day(s)') {
                  hargaBayar = durasi * 24;
                }
                if (newValue == 'Week(s)') {
                  hargaBayar = durasi * 168;
                }
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              if (hargaBayar > balance) {
                return "Not enough balance. Adjust";
              }

              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Rp${hargaBayar.toString()}",
              style: const TextStyle(
                  fontFamily: "Neue", color: Color(0xFF2D3250), fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Your Balance: Rp${balance.toString()}",
            style: const TextStyle(
                fontFamily: "Neue", fontSize: 20, color: Color(0xFF424769)),
          ),
          const SizedBox(
            height: 30,
          ),
          RentOptionButton(
              eachbike: widget.eachbike,
              buttonlabel: "Rent Now",
              isActive: false,
              bgcolor: const Color(0xFF2D3250),
              onTap: () {
                if (_rentNowKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              }),
        ],
      ),
    );
  }
}

/*
- Balance update continuosly
- Validator adjustment
*/