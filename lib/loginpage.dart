import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController mobiletextcontroller = TextEditingController();
  TextEditingController passwordtextcontroller = TextEditingController();

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
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Image.asset(
                          "assets/profile.png",
                          width: size.width * 0.4,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(60, 121, 98, 1.0)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(119, 187, 162, 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: TextField(
                            controller: mobiletextcontroller,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: const Color.fromRGBO(60, 121, 98, 1.0),
                                fontSize: size.height * 0.02),
                            textAlign: TextAlign.center,
                            cursorColor: const Color.fromRGBO(60, 121, 98, 1.0),
                            decoration: const InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(60, 121, 98, 1.0),
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(119, 187, 162, 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: TextField(
                            controller: passwordtextcontroller,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: const Color.fromRGBO(60, 121, 98, 1.0),
                                fontSize: size.height * 0.02),
                            textAlign: TextAlign.center,
                            cursorColor: const Color.fromRGBO(60, 121, 98, 1.0),
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(60, 121, 98, 1.0),
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Doesn't has account? Register Now",
                              style: TextStyle(
                                color: const Color.fromRGBO(60, 121, 98, 1.0),
                                fontSize: size.width * 0.04,
                              ),
                            ))
                      ],
                    )))));
  }
}
