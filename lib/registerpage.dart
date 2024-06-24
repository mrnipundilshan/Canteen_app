import 'package:flutter/material.dart';
import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:http/http.dart' as http;

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? selectedOption;
  List<String> options = ["FAS", "BS", "TECH"];

  @override
  Widget build(BuildContext context) {
    TextEditingController mobiletextcontroller = TextEditingController();
    TextEditingController nametextcontroller = TextEditingController();
    TextEditingController passwordtextcontroller = TextEditingController();
    TextEditingController addresstextcontroller = TextEditingController();

    void registeruser() async {
      if (mobiletextcontroller.text.isNotEmpty &&
          nametextcontroller.text.isNotEmpty &&
          passwordtextcontroller.text.isNotEmpty &&
          addresstextcontroller.text.isNotEmpty &&
          selectedOption!.isNotEmpty) {
        var regbody = {
          "mobile_number": mobiletextcontroller.text,
          "name": nametextcontroller.text,
          "faculty": selectedOption,
          "address": addresstextcontroller.text,
          "password": passwordtextcontroller.text
        };
      }
    }

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
              Positioned(
                top: size.width * 0.5,
                right: 5,
                left: 5000,
                child: Image.asset(
                  "assets/profile.png",
                  width: size.width * 0.4,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "Register",
                style: TextStyle(
                    fontSize: size.width * 0.1,
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
                height: size.height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 187, 162, 1.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: nametextcontroller,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(60, 121, 98, 1.0),
                      fontSize: size.height * 0.02),
                  textAlign: TextAlign.center,
                  cursorColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  decoration: const InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(60, 121, 98, 1.0),
                        fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.center,
                width: size.width * 0.8,
                height: size.height * 0.055,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 187, 162, 1.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedOption,
                    hint: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.23),
                      child: const Text(
                        "Select Faculty",
                        style: TextStyle(
                          color: Color.fromRGBO(60, 121, 98, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Color.fromRGBO(60, 121, 98, 1.0)),
                    dropdownColor: const Color.fromRGBO(119, 187, 162, 1.0),
                    items: options.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Color.fromRGBO(60, 121, 98, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
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
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(119, 187, 162, 1.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: addresstextcontroller,
                  maxLines: 2,
                  minLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(60, 121, 98, 1.0),
                      fontSize: size.height * 0.02),
                  textAlign: TextAlign.center,
                  cursorColor: const Color.fromRGBO(60, 121, 98, 1.0),
                  decoration: const InputDecoration(
                    hintText: "Adress",
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
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(60, 121, 98, 1.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.13, vertical: 15)),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
