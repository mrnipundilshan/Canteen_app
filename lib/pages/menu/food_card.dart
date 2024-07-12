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
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          top: size.width * 0.03,
          bottom: size.width * 0.03,
          right: size.width * 0.03),
      margin: EdgeInsets.only(
          left: size.width * 0.03,
          bottom: size.width * 0.03,
          right: size.width * 0.03),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(119, 187, 162, 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/menu/veg.png",
            width: size.width * 0.2,
          ),
          SizedBox(
            width: size.width * 0.2,
          ),
          Column(
            children: [Text(widget.food_name), Text(widget.price)],
          ),
          SizedBox(
            width: size.width * 0.2,
          ),
          Column(
            children: [Text(widget.food_name), Text(widget.price)],
          ),
        ],
      ),
    );
  }
}
