import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/pages/userorder/ordercard.dart';
import 'package:flutter/material.dart';

class orderpage extends StatefulWidget {
  const orderpage({super.key});

  @override
  State<orderpage> createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Background(
            child: SingleChildScrollView(
                child: Container(
                    width: double.infinity,
                    height: size.height,
                    child: Column(
                      children: <Widget>[
                        order_card(),
                      ],
                    )))));
  }
}
