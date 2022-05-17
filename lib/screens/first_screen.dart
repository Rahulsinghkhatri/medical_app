import 'package:flutter/material.dart';

import '../login/login.dart';

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/a1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Find your specialist",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              "Now it's so easy to make an appointment \n      with your doctor",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
            customButton(size, context),
            SizedBox(
              height: size.height / 30,
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => Login())),
      child: Container(
        height: size.height / 15,
        width: size.width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.fromRGBD(255,115,100,1),
        ),
        alignment: Alignment.center,
        child: Text(
          "Get Started",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
