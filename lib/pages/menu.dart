import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class menupage extends StatefulWidget {
  const menupage({super.key});

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [Text("hgbf")],
          ),
        ),
      ),
    );
  }
}
