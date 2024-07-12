import 'dart:convert';

import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/pages/menu/food_card.dart';
import 'package:canteen/pages/menu/food_class.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:canteen/config/config.dart';

class menupage extends StatefulWidget {
  // final token;
  // const menupage({@required this.token, Key? key}) : super(key: key);

  final String user;
  const menupage({required this.user, Key? key}) : super(key: key);

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  Future<List<Menu>> menus = getmenu();

  static Future<List<Menu>> getmenu() async {
    final response = await http.get(Uri.parse(menulist));
    final body = json.decode(response.body);
    return body.map<Menu>(Menu.fromJson).toList();
  }

  late String mobile_number;

  // @override
  // void initState() {
  // TODO: implement initState
  //   super.initState();
  //   Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

  //   mobile_number = jwtDecodedToken['mobile_number'];
  //getmenu();
  //}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.height * 0.01,
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.15,
                    ),
                    SizedBox(
                      width: size.height * 0.03,
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.15,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2024.06.24 Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.08,
                        color: const Color.fromRGBO(60, 121, 98, 1.0)),
                  ),
                ),
                Expanded(
                    child: FutureBuilder<List<Menu>>(
                        future: menus,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator.adaptive();
                          } else if (snapshot.hasData) {
                            final menus = snapshot.data!;

                            return buildmenus(menus);
                          } else {
                            return const Text("No Menu data");
                          }
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildmenus(List<Menu> menus) {
  return ListView.builder(
    itemCount: menus.length,
    itemBuilder: (context, index) {
      final Menu = menus[index];

      return food_card(food_name: Menu.name, price: Menu.price);
    },
  );
}
