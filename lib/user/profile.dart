// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser?.email;
  final creationTime = FirebaseAuth.instance.currentUser?.metadata.creationTime;
  @override
  Widget build(BuildContext context) {
    return Material(
    
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 86, 125, 190),
        child: Column(children: [
          Card(
            child: Text("User id:      $uid "),
            borderOnForeground: true,
            shadowColor: Color.fromARGB(255, 16, 17, 19),
            elevation: 12,
            margin: EdgeInsets.all(10),
            semanticContainer: true,
          ),
          Card(
            child: Text("User Email-id:    $email"),
          ),
          Card(
            child: Text("Created on:    $creationTime "),
          ),
          FloatingActionButton(onPressed: () {
              Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
          },child: Icon(Icons.home),)
        ]),
      ),
    );
  }
}
