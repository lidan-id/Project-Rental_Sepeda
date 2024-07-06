import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/topupfeature/toppup.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyWalletBoard extends StatelessWidget {
  const MyWalletBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final double saldo = Provider.of<LoginProvider>(context).currentUser.saldo;

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "My Balance",
          style: TextStyle(
            color: Color(0xFFF6B17A),
            fontFamily: 'Neue',
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF424769)),
          ),
          child: ShowHideBalance(currencyFormat: currencyFormat, saldo: saldo),
        ),
      ]),
    );
  }
}

class ShowHideBalance extends StatefulWidget {
  const ShowHideBalance({
    super.key,
    required this.currencyFormat,
    required this.saldo,
  });

  final NumberFormat currencyFormat;
  final double saldo;

  @override
  State<ShowHideBalance> createState() => _ShowHideBalanceState();
}

class _ShowHideBalanceState extends State<ShowHideBalance> {
  bool showSaldo = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showSaldo
                  ? widget.currencyFormat.format(widget.saldo)
                  : '* * * * * * * * * *',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Neue',
                fontSize: 30,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  showSaldo = !showSaldo;
                });
              },
              icon: Icon(
                showSaldo
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: const Color(0xFF7077A1),
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const TopUpButton(),
          ],
        )
      ],
    );
  }
}

class TopUpButton extends StatelessWidget {
  const TopUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const TopUp()));
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF7077A1)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.white,
            ),
            Text(
              "Top-up",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Neue',
              ),
            )
          ],
        ),
      ),
    );
  }
}
