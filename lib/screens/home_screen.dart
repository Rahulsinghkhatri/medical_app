import 'dart:js';

import 'package:flutter/material.dart';
import 'package:medical_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final List<Data> itemdata = [
    Data(
      "Home visit", //text
      "assets/a1.jpg", //imageUrl
    ),
    Data(
      "Clinic visit", //text
      "assets/back.png", //imageUrl
    ),
    Data(
      "Ambulance", //text
      "assets/bg.jpg", //imageUrl
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      drawer: MyDrawer(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height / 8,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.menu,
                    color: Color.fromRGBO(55, 82, 178, 1),
                  ),
                ),
                Container(
                    height: size.height / 12,
                    width: size.width / 12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/chest.png')))),
              ],
            ),
          ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Appointment with \n a doctor",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: searchField(size)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: size.width / 1.1,
              child: Text(
                "How can we help you?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          helpWidgetBuilder(size),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              width: size.width / 1.1,
              child: Text(
                "Popular Categories",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          categoriesBuilder(size),
        ],
      ),
    ));
  }

  Widget categoriesBuilder(Size size) {
    return Container(
      height: size.height / 5,
      width: size.width,
      child: Row(children: [
        categoriesItems(size, "assets/a1.jpg", "cardeology", Colors.white),
        categoriesItems(size, "assets/chest.png", "Pulmonology",
            Color.fromRGBO(55, 82, 178, 1)),
      ]),
    );
  }

  Widget categoriesItems(Size size, String imageUrl, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: color,
        child: Container(
          height: size.height / 5,
          width: size.width / 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height / 12,
                width: size.height / 15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imageUrl),
                )),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color != Colors.white ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget helpWidgetBuilder(Size size) {
    return Container(
      height: size.height / 8,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemdata.length,
          itemBuilder: (context, index) {
            return items(size, index);
          }),
    );
  }

  Widget items(Size size, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: size.height / 8,
          width: size.width / 3.5,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: size.height / 12,
              width: size.width / 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(itemdata[index].imageUrl),
                ),
              ),
            ),
            Text(
              itemdata[index].text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget searchField(Size size) {
    return Container(
      height: size.height / 12,
      width: size.width / 1.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search your symptoms..."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.height / 14,
              width: size.width / 14,
              decoration: BoxDecoration(
                color: Color.fromRGBO(55, 82, 178, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Data {
  final String imageUrl, text;
  Data(this.imageUrl, this.text);
}
