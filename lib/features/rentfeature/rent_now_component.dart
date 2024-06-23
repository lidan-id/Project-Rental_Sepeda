import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/rentfeature/rent_option_buttons.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class RentNowComponent extends StatefulWidget {
  const RentNowComponent({super.key, required this.eachbike});

  final BikesClass eachbike;

  @override
  State<RentNowComponent> createState() => _RentNowComponentState();
}

class _RentNowComponentState extends State<RentNowComponent> {
  final _rentNowKey = GlobalKey<FormState>();
  String _selectedOption = 'Hour(s)';
  double _durasi = 0;
  double _hargaBayar = 0;

  void _updateHargaBayar(eachbike) {
    setState(() {
      if (_selectedOption == 'Hour(s)') {
        _hargaBayar = _durasi * eachbike.price * 1;
      } else if (_selectedOption == 'Day(s)') {
        _hargaBayar = _durasi * eachbike.price * 24;
      } else if (_selectedOption == 'Week(s)') {
        _hargaBayar = _durasi * eachbike.price * 168;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double balance = Provider.of<SaldoProvider>(context).saldo;
    return Form(
      key: _rentNowKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                _durasi = double.tryParse(value) ?? 0;
                _updateHargaBayar(widget.eachbike);
              });
            },
            cursorColor: const Color(0xFF2D3250),
            style: const TextStyle(
                color: Color(0xFF2D3250), fontFamily: "Neue", letterSpacing: 3),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: InputDecoration(
                suffixText: _selectedOption,
                labelText: 'Duration',
                labelStyle: const TextStyle(
                    color: Color(0xFF2D3250), fontFamily: "Neue"),
                prefixIcon: const Icon(
                  Icons.hourglass_bottom_outlined,
                  color: Color(0xFFF6B17A),
                ),
                hintStyle: const TextStyle(
                    color: Color(0xFFF6B17A), fontFamily: "Neue"),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF6B17A))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF6B17A)))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter rent duration';
              }
              if (_hargaBayar > balance) {
                return "Not enough balance. Please adjust accordingly";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField<String>(
            value: _selectedOption,
            dropdownColor: Color(0xFF2D3250),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFFF6B17A),
            ),
            items: <String>['Hour(s)', 'Day(s)', 'Week(s)'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      color: Color(0xFFF6B17A),
                      fontFamily: "Neue",
                      letterSpacing: 3),
                ),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Time Units',
              labelStyle:
                  TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
              prefixIcon: Icon(
                Icons.timer_outlined,
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
                _updateHargaBayar(widget.eachbike);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              if (_hargaBayar > balance) {
                return "Not enough balance. Please adjust accordingly";
              }

              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Rp${_hargaBayar.toString()}",
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
          Center(
            child: RentOptionButton(
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
          ),
        ],
      ),
    );
  }
}
