import 'package:flutter/material.dart';

class food_card extends StatefulWidget {
  final String food_name;
  final int price;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            getImageAsset(widget.food_name),
            width: size.width * 0.2,
          ),
          SizedBox(width: size.width * 0.2),
          Column(children: [
            Text(
              widget.food_name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: const Color.fromRGBO(60, 121, 98, 1.0)),
            ),
            Text(
              widget.price.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: const Color.fromRGBO(60, 121, 98, 1.0)),
            )
          ]),
          SizedBox(width: size.width * 0.2),
          Row(children: [Text("+"), Text("00"), Text("-")]),
        ],
      ),
    );
  }
}

String getImageAsset(String foodName) {
  switch (foodName.toLowerCase()) {
    case 'veg':
      return 'assets/menu/veg.png';
    case 'fish':
      return 'assets/menu/fish.png';
    case 'chicken':
      return 'assets/menu/chicken.png';
    case 'egg':
      return 'assets/menu/egg.png';
    case 'rice':
      return 'assets/menu/rice.png';
    case 'kottu':
      return 'assets/menu/kottu.png';
    // Add more cases as needed
    default:
      return 'assets/menu/default.png'; // Default image if no match is found
  }
}
