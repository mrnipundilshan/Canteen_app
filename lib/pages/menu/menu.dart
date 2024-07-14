import 'dart:convert';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/pages/menu/food_card.dart';
import 'package:canteen/pages/menu/food_class.dart';
import 'package:canteen/pages/menu/food_item.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:canteen/config/config.dart';
import 'package:provider/provider.dart';

class Totalprovider with ChangeNotifier {
  int total = 0;

  inctotal(int price) {
    total = total + price;
    notifyListeners();
  }

  dectotal(int price) {
    total = total - price;
    notifyListeners();
  }
}

class menupage extends StatefulWidget {
  final token;
  const menupage({
    @required this.token,
    Key? key,
  }) : super(key: key);

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

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    mobile_number = jwtDecodedToken['mobile_number'];
    getmenu();
  }

  @override
  Widget build(BuildContext context) {
    void placeorder(int total) async {
      var regbody = {
        "mobile_number": mobile_number,
        "total": total,
        "veg_count": food_item.veg_count,
        "veg_price": food_item.veg_price,
        "egg_count": food_item.egg_count,
        "egg_price": food_item.egg_price,
        "chicken_count": food_item.chicken_count,
        "chicken_price": food_item.chicken_price,
        "rice_count": food_item.rice_count,
        "rice_price": food_item.rice_price,
        "kottu_count": food_item.kottu_count,
        "kottu_price": food_item.kottu_price,
        "fish_count": food_item.fish_count,
        "fish_price": food_item.fish_price,
      };

      try {
        var response = await http.post(Uri.parse(placeorderapi),
            headers: {"content-Type": "application/json"},
            body: jsonEncode(regbody));

        if (response.statusCode == 200) {
          var jsonResponce = jsonDecode(response.body);
          print("Response status: ${jsonResponce['status']}");
        } else {
          print("Server returned an error: ${response.statusCode}");
          print("Response body: ${response.body}");
        }
      } catch (e) {
        print("Place order failed: $e");
      }
    }

    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => Totalprovider(),
      child: Scaffold(
        body: Background(
          child: Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: size.height * 0.01,
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.12,
                    ),
                    Text(
                      'Hi $mobile_number',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                    Image.asset(
                      "assets/profile.png",
                      width: size.width * 0.12,
                    ),
                    SizedBox(
                      width: size.height * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  "2024.06.24 Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.06,
                      color: const Color.fromRGBO(60, 121, 98, 1.0)),
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
                Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(width: size.width * 0.04),
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width * 0.03,
                              top: size.width * 0.02,
                              bottom: size.width * 0.02,
                              right: size.width * 0.03),
                          width: size.width * 0.25,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(119, 187, 162, 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                              color: const Color.fromARGB(255, 11, 105, 69),
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              icon: const Icon(Icons.backspace_sharp)),
                        ),
                        Consumer<Totalprovider>(
                          builder: (context, totalprovider, child) => Container(
                            padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.width * 0.02,
                                bottom: size.width * 0.02,
                                right: size.width * 0.03),
                            width: size.width * 0.35,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(119, 187, 162, 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Rs. ${totalprovider.total}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                  color:
                                      const Color.fromRGBO(60, 121, 98, 1.0)),
                            ),
                          ),
                        ),
                        Consumer<Totalprovider>(
                          builder: (context, totalprovider, child) => Container(
                            padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.width * 0.02,
                                bottom: size.width * 0.02,
                                right: size.width * 0.03),
                            width: size.width * 0.25,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(119, 187, 162, 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: IconButton(
                                color: const Color.fromARGB(255, 11, 105, 69),
                                onPressed: () {
                                  placeorder(totalprovider.total);
                                },
                                icon: const Icon(Icons.double_arrow)),
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                      ],
                    ),
                    SizedBox(height: size.height * 0.15),
                  ],
                )
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
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    itemCount: menus.length,
    itemBuilder: (context, index) {
      final Menu = menus[index];

      return food_card(food_name: Menu.name, price: Menu.price);
    },
  );
}
