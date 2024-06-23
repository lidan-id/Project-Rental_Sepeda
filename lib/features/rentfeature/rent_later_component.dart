import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/rentfeature/rent_option_buttons.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class RentLaterComponent extends StatefulWidget {
  const RentLaterComponent({super.key, required this.eachbike});

  final BikesClass eachbike;

  @override
  State<RentLaterComponent> createState() => _RentLaterComponentState();
}

class _RentLaterComponentState extends State<RentLaterComponent> {
  final _rentLaterKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDateTime;
  double _durasi = 0;
  double _hargaBayar = 0;
  String _selectedOption = 'Hour(s)';

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

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _dateController.text =
              DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime!);
          _updateHargaBayar(widget.eachbike);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double balance = Provider.of<SaldoProvider>(context).saldo;
    return Form(
      key: _rentLaterKey,
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

          TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Select Date & Time',
              labelStyle:
                  TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
              prefixIcon: Icon(Icons.calendar_today, color: Color(0xFFF6B17A)),
              hintStyle:
                  TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF6B17A)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF6B17A)),
              ),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await _selectDateTime(context);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose date & time';
              }
              if (_hargaBayar > balance) {
                return "Not enough balance. Please adjust accordingly";
              }
              return null;
            },
          ),

          //END
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
                buttonlabel: "Rent for later",
                isActive: false,
                bgcolor: const Color(0xFF424769),
                onTap: () {
                  if (_rentLaterKey.currentState!.validate()) {
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
