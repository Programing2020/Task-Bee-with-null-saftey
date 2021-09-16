import 'package:flutter/material.dart';
import 'widget_container.dart';

// ignore: camel_case_types
class Column_Wallet_Expancies_contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget_Container(
          image: Image.asset(
            'assets/homepage/wallet.png',
            width: 40,
            height: 40,
          ),
          text: 'Wallet',
        ),
        SizedBox(
          height: 15,
        ),
        widget_Container(
          image: Image.asset(
            'assets/homepage/masaref.png',
            height: 40,
            width: 40,
          ),
          text: 'Expancies item',
        ),
        SizedBox(
          height: 15,
        ),
        widget_Container(
          image: Image.asset(
            'assets/homepage/person.png',
            width: 40,
            height: 40,
          ),
          text: 'Contact',
        ),
      ],
    );
  }
}
