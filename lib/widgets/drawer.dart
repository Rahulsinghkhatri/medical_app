// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:about/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import '../screens/contact_us.dart';
import '../user/change_password.dart';
import '../user/profile.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var mail = FirebaseAuth.instance.currentUser!.email;
  var id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName: Text("id: $id"),
                  accountEmail: Text("$mail"),
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/user.jpg"),
                  ))),
          ListTile(
            leading: Icon(Icons.person_off_outlined),
            title: Text("Profile",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                  (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text("Change password",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            onTap: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePassword()),
                  (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: const Text(
              'About us',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              showAboutPage(
                context: context,
                applicationIcon: Icon(Icons.flutter_dash),
                applicationName: "Healthfiy",
                title: Text("About Healthfiy"),
                applicationLegalese: "Developed by ajay for Gehu..",
                children: <Widget>[
                  Text(
                      "This is the detailed description about our healt application whic is developed in flutter")
                ],
                applicationVersion: "1.1.0",
                applicationDescription: Text("This is a health application"),
                dialog: true,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: const Text(
              'Contact us',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Log-out",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Color.fromARGB(255, 24, 22, 22),
                  content: Text(
                    "Signout successfully....",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )));

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}
