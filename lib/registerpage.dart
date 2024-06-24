import 'package:flutter/material.dart';
import 'package:canteen/backgrounds/signup_bg.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
          child: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            Positioned(
              top: size.width * 0.5,
              right: 5,
              left: 5000,
              child: Image.asset(
                "assets/profile.png",
                width: size.width * 0.4,
              ),
            ),
            Text(
              "Register",
              style: TextStyle(
                  fontSize: size.width * 0.1,
                  color: const Color.fromRGBO(60, 121, 98, 1.0)),
            ),
          ],
        ),
      )),
    );
  }
}
