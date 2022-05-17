// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Ajay Negi',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'negiajay354@gmail.com',
        ),
        backgroundColor: Colors.teal,
        body: ContactUs(
            cardColor: Colors.white,
            textColor: Colors.teal.shade900,
            logo: AssetImage('bg.jpg'),
            email: 'negiajay354@gmail.com',
            companyName: 'Ajay Negi',
            companyColor: Colors.teal.shade100,
            dividerThickness: 2,
            phoneNumber: '+919756630184',
            website: 'https://ajaynegi.godaddysites.com',
            githubUserName: 'Ajay9758',
            linkedinURL: 'https://www.linkedin.com/in/ajay-negi-9652b3217',
            tagLine: 'Flutter Developer',
            taglineColor: Colors.teal.shade100,
            twitterHandle: 'Ajaynegi',
            instagram: '_ajaynegi',
            facebookHandle: '_ajaynegi'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(Icons.home, color: Colors.redAccent),
        ),
      ),
    );
  }
}


//