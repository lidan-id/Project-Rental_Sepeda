import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class WelcomeBoard extends StatelessWidget {
  const WelcomeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/banner.jpg",
          width: MediaQuery.of(context).size.width,
          filterQuality: FilterQuality.high,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: const Color(0xFF2D3250).withOpacity(0.85),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.widgets,
                    size: 30,
                    color: Color(0xFFF6B17A),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Text("Hello",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 25,
                  )),
              Text(
                  Provider.of<LoginProvider>(context).user.isEmpty
                      ? "DummyBot"
                      : Provider.of<LoginProvider>(context).user,
                  style: const TextStyle(
                    color: Color(0xFFF6B17A),
                    letterSpacing: 5,
                    fontFamily: 'Neue',
                    fontSize: 35,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
