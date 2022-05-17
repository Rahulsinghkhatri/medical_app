// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import '../screens/home_screen.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";

  final newPassControler = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser;
  changePasswrd() async {
    try {
      await currentUser?.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 24, 22, 22),
          content: Text(
            "Password changed successfully",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          )));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(14),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'New password: ',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: newPassControler,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter new password";
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          newPassword = newPassControler.text;
                        });
                        changePasswrd();
                      }
                    },
                    child: Text("Change Password")),

                    FloatingActionButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                    },
                    child: Icon(Icons.home),
                    )
              ],
            )));
  }
}
