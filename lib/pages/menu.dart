import 'dart:convert';

import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:canteen/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/widgets.dart';

class menuitem {
  late final String id;
  late final String name;
  late final String price;
  late final int visible;

  menuitem(
      {required this.id,
      required this.name,
      required this.price,
      required this.visible});

  factory menuitem.fromJson(Map<String, dynamic> json) {
    return menuitem(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      visible: json['visible'],
    );
  }
}

Future<List<menuitem>> fetchmenuitems() async {
  final response = await http.get(Uri.parse(menulist));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => menuitem.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load menu items');
  }
}

class menupage extends StatefulWidget {
  const menupage({super.key});

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  late Future<List<menuitem>> futuremenuitems;

  @override
  void initstate() {
    super.initState();
    futuremenuitems = fetchmenuitems();
  }

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
                Column(
                  children: <Widget>[
                    Text(
                      "2024.06.24 Menu",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.08,
                          color: const Color.fromRGBO(60, 121, 98, 1.0)),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.05),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(119, 187, 162, 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
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
// class menupage extends StatefulWidget {
//   final token;
//   const menupage({@required this.token, Key? key}) : super(key: key);

//   @override
//   State<menupage> createState() => _menupageState();
// }

// class _menupageState extends State<menupage> {
//   late String mobile_number;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

//     mobile_number = jwtDecodedToken['mobile_number'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//       child: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: size.height,
//           child: Column(
//             children: <Widget>[
//               //Text(mobile_number),
//               Text("sfdsd"),
//               Text(
//                 "Login",
//                 style: TextStyle(
//                     fontSize: size.width * 0.1,
//                     fontWeight: FontWeight.bold,
//                     color: const Color.fromRGBO(60, 121, 98, 1.0)),
//               ),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
