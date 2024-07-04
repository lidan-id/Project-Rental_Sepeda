import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDateTime;
  double _durasi = 0;
  double durasi = 0;
  double _hargaBayar = 0;
  String _selectedOption = 'Hour(s)';
  Duration? _scheduleTimeLeft;

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

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        builder: (context, widget) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Color(0xffF6B17A),
                    surface: Color(0xff2D3250),
                    onSurface: Color(0xffF6B17A),
                  ),
                  dividerTheme:
                      const DividerThemeData(color: Color(0xffF6B17A))),
              child: widget!);
        });

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
            DateTime.now().add(const Duration(hours: 1)),
          ),
          builder: (context, widget) {
            return Theme(
                data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: Color(0xffF6B17A),
                        surface: Color(0xff2D3250),
                        onSurface: Color(0xffF6B17A),
                        secondary: Color(0xffF6B17A)),
                    dividerTheme:
                        const DividerThemeData(color: Color(0xffF6B17A))),
                child: widget!);
          });

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _calculateSchedTimeLeft();
          _dateController.text =
              DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime!);
          _updateHargaBayar(widget.eachbike);
        });
      }
    }
  }

  void _calculateSchedTimeLeft() {
    if (_selectedDateTime != null) {
      final now = DateTime.now();
      setState(() {
        _scheduleTimeLeft = _selectedDateTime!.difference(now);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    LoginProvider balance = Provider.of<LoginProvider>(context);
    return Form(
      key: _rentLaterKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          durationTextField(balance),
          TextFormField(
            style:
                const TextStyle(color: Color(0xFFF6B17A), fontFamily: "Neue"),
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Select scheduled Date & Time (max. 1 month)',
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
              if (_scheduleTimeLeft!.isNegative ||
                  _scheduleTimeLeft!.inMinutes < 59) {
                return "Please enter valid time. At least 1 hour from current time";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
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
          if (_scheduleTimeLeft != null)
            Text(
              'Bike will be delivered on: ${_scheduleTimeLeft!.inDays} Days ${_scheduleTimeLeft!.inHours % 24} hours ${_scheduleTimeLeft!.inMinutes % 60} minutes',
              softWrap: true,
              style: const TextStyle(
                  fontFamily: "Neue", fontSize: 15, color: Color(0xFF424769)),
            ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RentOptionButton(
                eachbike: widget.eachbike,
                buttonlabel: "Rent for later",
                isActive: false,
                bgcolor: const Color(0xFF424769),
                onTap: () {
                  if (_rentLaterKey.currentState!.validate()) {
                    balance.bayar(
                      _hargaBayar,
                    );
                    Provider.of<RentedBikeProvider>(context, listen: false)
                        .addNewBookedBike(
                      rentID: UniqueKey().toString(),
                      name: widget.eachbike.name,
                      picture: widget.eachbike.picture,
                      paidprice: _hargaBayar,
                      rentduration: Duration(hours: durasi.toInt()),
                      timetoscheduledtime: _scheduleTimeLeft!,
                    );
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        showCloseIcon: true,
                        backgroundColor: Colors.white,
                        closeIconColor: Color(0xFF2D3250),
                        duration: Duration(seconds: 8),
                        content: Text(
                          'Bike booked. Thank you for renting with us!',
                          style: TextStyle(
                              fontFamily: "Neue", color: Color(0xFF2D3250)),
                        )));
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
          height: 15,
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
          height: 15,
        ),
      ],
    );
  }
}
