// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/login/signup.dart';
import '../screens/home_screen.dart';
import 'forget_pass.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailContrl = TextEditingController();
  final passContrl = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           backgroundColor: Color.fromARGB(255, 24, 22, 22),
            content: Text(
          "Logged in",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        )));

      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, a, b) => HomePage(),
            transitionDuration: Duration(seconds: 0),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) 
    {
      if(e.code =='user-not-found')
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           backgroundColor: Color.fromARGB(255, 24, 22, 22),
            content: Text(
          "No User found for this email-id",
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        )));
      }
      else if(e.code =='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           backgroundColor: Color.fromARGB(255, 24, 22, 22),
            content: Text(
          "Wrong password",
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        )));

      }
    }
  }

  @override
  void dispose() {
    //clean the controller when widget is finished
    emailContrl.dispose();
    passContrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user login"),
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
                  autofocus: true,
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
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  autofocus: true,
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
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailContrl.text;
                            password = passContrl.text;
                          });
                          userLogin();
                        }

                        // Validate returns true if the form is valid, otherwise false.
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPass(),
                          ),
                        )
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont have an account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text("Sign up"),
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
