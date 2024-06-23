import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/rentfeature/rent_later_component.dart';
import 'package:flutter_application_1/features/rentfeature/rent_now_component.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';

class RentsButton extends StatefulWidget {
  const RentsButton({super.key, required this.eachbike});
  final BikesClass eachbike;
  @override
  State<RentsButton> createState() => _RentsButtonState();
}

class _RentsButtonState extends State<RentsButton> {
  Widget? _targetComponent;
  String _activeButton = '';

  void _showComponent(String buttonLabel, Widget component) {
    setState(() {
      _activeButton = buttonLabel;
      _targetComponent = component;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RentOptionButton(
              eachbike: widget.eachbike,
              isActive: _activeButton == "Rent for later",
              buttonlabel: "Rent for later",
              bgcolor: const Color(0xFF424769),
              onTap: () => _showComponent(
                  "Rent for later",
                  // rentLaterComponent(widget.eachbike) as Widget
                  RentLaterComponent(eachbike: widget.eachbike)),
            ),
            RentOptionButton(
              eachbike: widget.eachbike,
              buttonlabel: "Rent Now",
              isActive: _activeButton == "Rent Now",
              bgcolor: const Color(0xFF2D3250),
              onTap: () => _showComponent(
                  "Rent Now", RentNowComponent(eachbike: widget.eachbike)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RentOptionShow(
          targetComponent: _targetComponent,
          eachbike: widget.eachbike,
        ),
      ],
    );
  }
}

class RentOptionButton extends StatelessWidget {
  const RentOptionButton({
    super.key,
    required this.bgcolor,
    required this.buttonlabel,
    required this.isActive,
    required this.onTap,
    required this.eachbike,
  });

  final Color bgcolor;
  final bool isActive;
  final String buttonlabel;
  final VoidCallback onTap;
  final BikesClass eachbike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isActive ? const Color(0xFF7077A1) : bgcolor,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(buttonlabel,
                style: TextStyle(
                    fontFamily: "Neue",
                    color: isActive
                        ? const Color(0xFF7077A1)
                        : const Color(0xFFF6B17A),
                    fontSize: 20)),
          )),
    );
  }
}

class RentOptionShow extends StatelessWidget {
  const RentOptionShow(
      {super.key, this.targetComponent, required this.eachbike});

  final Widget? targetComponent;
  final BikesClass eachbike;

  @override
  Widget build(BuildContext context) {
    return targetComponent != null
        ? Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: targetComponent,
          )
        : const SizedBox.shrink();
  }
}
