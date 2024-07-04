import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/banktopup.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFF6B17A),
        backgroundColor: const Color(0xFF2D3250),
        title: const Hero(
          tag: 'Top-Up',
          child: SizedBox(
            child: Text(
              'Top-Up',
              style: TextStyle(fontFamily: 'Neue'),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF2D3250),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF2D3250),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Saldo(),
              Garis(),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BankTopUp())
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("BCA",
                    style: TextStyle(
                        color: Color(0xFFF6B17A),
                        fontSize: 30,
                        fontFamily: 'Neue'
                    ),
                  ),
                    Image(image: AssetImage("assets/logo_BCA.png"),width: 60,fit: BoxFit.cover,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BankTopUp())
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("BRI",
                    style: TextStyle(
                        color: Color(0xFFF6B17A),
                        fontSize: 30,
                        fontFamily: 'Neue'
                    ),
                  ),
                    Image(image: AssetImage("assets/Logo_BRI.png"),width: 60,fit: BoxFit.cover,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BankTopUp())
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Mandiri",
                    style: TextStyle(
                        color: Color(0xFFF6B17A),
                        fontSize: 30,
                        fontFamily: 'Neue'
                    ),
                  ),
                    Image(image: AssetImage("assets/Logo_Mandiri.png"),width: 60,fit: BoxFit.cover,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Saldo extends StatefulWidget {
  const Saldo({super.key});

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  Widget build(BuildContext context) {
    final _saldo = Provider.of<SaldoProvider>(context, listen: false).saldo;
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return SizedBox(
      child: (
          Row(
            children: [
              const Text("Saldo",
                style: TextStyle(
                    color: Color(0xFFF6B17A),
                    fontSize: 30,
                    fontFamily: 'Neue'
                ),
              ),
              const SizedBox(width: 10,),
              Text(currencyFormat.format(_saldo),
                style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                    fontFamily: 'Neue'
                ),
              ),
            ],
          )
      ),
    );
  }
}

class Garis extends StatelessWidget {
  const Garis({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      endIndent: 80,
      thickness: 2,
      color: Color(0xFFF6B17A),
    );
  }
}


