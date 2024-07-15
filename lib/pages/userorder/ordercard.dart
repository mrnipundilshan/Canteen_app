import 'package:flutter/material.dart';

class order_card extends StatefulWidget {
  final int total;
  final int veg_count;
  final int veg_price;
  final int egg_count;
  final int egg_price;
  final int chicken_count;
  final int chicken_price;
  final int rice_count;
  final int rice_price;
  final int kottu_count;
  final int kottu_price;
  final int fish_count;
  final int fish_price;

  const order_card(
      {super.key,
      required this.total,
      required this.veg_count,
      required this.veg_price,
      required this.egg_count,
      required this.egg_price,
      required this.chicken_count,
      required this.chicken_price,
      required this.rice_count,
      required this.rice_price,
      required this.kottu_count,
      required this.kottu_price,
      required this.fish_count,
      required this.fish_price});
  @override
  State<order_card> createState() => _order_cardState();
}

class _order_cardState extends State<order_card> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          top: size.width * 0.02,
          bottom: size.width * 0.02,
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
      child: Column(
        children: <Widget>[
          Text(
            "Order 01",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                color: const Color.fromRGBO(60, 121, 98, 1.0)),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Order 01",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "02",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "200",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Order 01",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "02",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "200",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Order 01",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "02",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                  Text(
                    "200",
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ],
              ),
              Text(
                "Total",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: const Color.fromRGBO(60, 121, 98, 1.0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
