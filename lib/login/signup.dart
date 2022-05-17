// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  var confirmPass = "";

  final emailContrl = TextEditingController();
  final passContrl = TextEditingController();
  final confirmpassContrl = TextEditingController();

  @override
  void dispose() {
    //clean the controller when widget is finished
    emailContrl.dispose();
    passContrl.dispose();
    confirmpassContrl.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmPass) {
      try {
        UserCredential usercred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 24, 22, 22),
            content: Text(
              "Registration Successful,Please Login",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            )));

        await Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, a, b) => Login(),
              transitionDuration: Duration(seconds: 2),
            ),
            (route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color.fromARGB(255, 24, 22, 22),
              content: Text(
                "Provided Password is too weak",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Color.fromARGB(255, 24, 22, 22),
              content: Text(
                "Email already in used ,Please use different email",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              )));
        }
      }
      ;
    } else {
      // print("passwords donot matches");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Passwords not matched",
        style: TextStyle(color: Colors.redAccent, fontSize: 25),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user sign up"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'email: ',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: emailContrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email";
                      } else if (!value.contains("@")) {
                        return "enter valid mail";
                      }
                      return null;
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Password: ',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: passContrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }
                      return null;
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password: ',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    controller: confirmpassContrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password again";
                      }
                      return null;
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailContrl.text;
                            password = passContrl.text;
                            confirmPass = confirmpassContrl.text;
                          });
                          registration();
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Login(),
                              transitionDuration: Duration(seconds: 2),
                            ),
                            (route) => false)
                      },
                      child: Text("Go to Login page"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
