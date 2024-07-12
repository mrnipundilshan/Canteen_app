import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/pages/menu/food_card.dart';
import 'package:canteen/pages/menu/food_class.dart';
import 'package:flutter/material.dart';
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
  List<Menu> menus = getmenu();

  static List<Menu> getmenu() {
    const data = [
      {
        "name": "veg",
        "price": "100",
      },
      {
        "name": "Mas",
        "price": "100",
      }
    ];
    return data.map<Menu>(Menu.fromJson).toList();
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
    print("Item count: ${menus.length}");
    for (var menu in menus) {
      print("Menu item: ${menu.name}, Price: ${menu.price}");
    }
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: size.height,
              child: buildmenus(menus)),
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
