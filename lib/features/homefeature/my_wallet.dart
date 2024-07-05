import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/topupfeature/toppup.dart';
import 'package:flutter_application_1/provider/provider_bike_user.dart';
import 'package:provider/provider.dart';

class MyWalletBoard extends StatelessWidget {
  const MyWalletBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final double SaldoUser = Provider.of<LoginProvider>(context).currentUser.saldo;
    return Container(
      padding: EdgeInsets.all(25),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Wallet"),
          Container(
          padding: EdgeInsets.all(10),
          // margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
          color: Colors.white),
          height: MediaQuery.of(context).size.height *0.075,
          width: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${SaldoUser}"),
              Row(
                children: [
                  Text("invis"),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopUp()));
                    },
                    child: Text("topup"))
                ],
              )
            ],
          ),
        ),]
      ),
    );
  }


}