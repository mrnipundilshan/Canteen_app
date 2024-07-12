import 'package:flutter/material.dart';

class food_card extends StatefulWidget {
  final String food_name;
  final String price;
  const food_card({super.key, required this.food_name, required this.price});

  @override
  State<food_card> createState() => _food_cardState();
}

class _food_cardState extends State<food_card> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Text(widget.food_name),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
      margin: EdgeInsets.only(left: 18, bottom: 18, right: 18),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(119, 187, 162, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
