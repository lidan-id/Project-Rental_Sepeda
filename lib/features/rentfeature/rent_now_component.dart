import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/rentfeature/rent_option_buttons.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:intl/intl.dart';
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
  double durasi = 0;
  double _hargaBayar = 0;

  void _updateHargaBayar(eachbike) {
    setState(() {
      if (_selectedOption == 'Hour(s)') {
        durasi = _durasi * 1;
        _hargaBayar = durasi * eachbike.price * 90 / 100;
        return;
      }
      if (_selectedOption == 'Day(s)') {
        durasi = _durasi * 24;
        _hargaBayar = durasi * eachbike.price;
        return;
      }
      if (_selectedOption == 'Week(s)') {
        durasi = _durasi * 168;
        _hargaBayar = durasi * eachbike.price;
        return;
      }
    });
  }

  // void _handleSubmit() {
  //   if (_rentNowKey.currentState?.validate() ?? false) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Processing Data')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    LoginProvider balance = Provider.of<LoginProvider>(context);
    return Form(
      key: _rentNowKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          durationTextField(balance),
          const Text(
            "App Discount: 10%",
            style: TextStyle(fontFamily: "Neue", color: Colors.white),
          ),
          Center(
            child: Text(
              currencyFormat.format(_hargaBayar),
              style: const TextStyle(
                  fontFamily: "Neue", color: Color(0xFF2D3250), fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Your Balance: ${currencyFormat.format(balance.currentUser.saldo)}",
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
                  if (_rentNowKey.currentState?.validate() ?? false) {
                    balance.bayar(_hargaBayar);
                    Provider.of<RentedBikeProvider>(context, listen: false)
                        .addNewBookedBike(
                      rentID: UniqueKey().toString(),
                      name: widget.eachbike.name,
                      picture: widget.eachbike.picture,
                      paidprice: _hargaBayar,
                      rentduration: Duration(hours: durasi.toInt()),
                      timetoscheduledtime: const Duration(seconds: 0),
                    );
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.white,
                          closeIconColor: Color(0xFF2D3250),
                          duration: Duration(seconds: 8),
                          showCloseIcon: true,
                          content: Text(
                            'Thank you for renting with us. Enjoy your ride!',
                            style: TextStyle(
                                fontFamily: "Neue", color: Color(0xFF2D3250)),
                          )),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  Column durationTextField(LoginProvider loginProvider) {
    return Column(
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
              labelStyle:
                  const TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
              prefixIcon: const Icon(
                Icons.hourglass_bottom_outlined,
                color: Color(0xFFF6B17A),
              ),
              hintStyle:
                  const TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF6B17A))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFF6B17A)))),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter rent duration';
            }
            if (_hargaBayar > loginProvider.currentUser.saldo) {
              return "Not enough balance. Please top-up or adjust";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField<String>(
          value: _selectedOption,
          dropdownColor: const Color(0xFF2D3250),
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
            labelStyle: TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
            prefixIcon: Icon(
              Icons.timer_outlined,
              color: Color(0xFFF6B17A),
            ),
            hintStyle: TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
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
            if (_hargaBayar > loginProvider.currentUser.saldo) {
              return "Not enough balance. Please top-up or adjust";
            }

            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
