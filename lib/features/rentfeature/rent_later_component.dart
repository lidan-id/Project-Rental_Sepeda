import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/rent_option_buttons.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';

class RentLaterComponent extends StatefulWidget {
  const RentLaterComponent({super.key, required this.eachbike});

  final BikesClass eachbike;

  @override
  State<RentLaterComponent> createState() => _RentLaterComponentState();
}

class _RentLaterComponentState extends State<RentLaterComponent> {
  final _rentLaterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _rentLaterKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Date & Time',
                labelStyle:
                    TextStyle(color: Color(0xFF2D3250), fontFamily: "Neue"),
                prefixIcon: Icon(
                  Icons.date_range,
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
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
