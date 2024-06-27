import 'package:canteen/backgrounds/signup_bg.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/widgets.dart';

class menupage extends StatefulWidget {
  final token;
  const menupage({@required this.token, Key? key}) : super(key: key);

  @override
  State<menupage> createState() => _menupageState();
}

class _menupageState extends State<menupage> {
  late String mobile_number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    mobile_number = jwtDecodedToken['mobile_number'];
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [Text(mobile_number)],
          ),
        ),
      ),
    );
  }
}
