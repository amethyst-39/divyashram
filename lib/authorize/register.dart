import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divya_shramik/home.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Register"),
        // ),
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: w - 20,
            decoration: BoxDecoration(
              color: Color(0xff02D1DD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
                child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "First name",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                        controller: firstNameInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return "Please enter a valid first name.";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.grey[400]),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.grey[400]),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Last name",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 13.0, horizontal: 20.0),
                          ),
                          controller: lastNameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Please enter a valid last name.";
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Email ID",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Password",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 45, left: 45),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Confirm Password",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 20.0),
                        ),
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 40,
                    width: 110,
                    child: RaisedButton(
                      padding: EdgeInsets.all(4),
                      child: Text('Register'),
                      color: Color(0xff414040),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      ),
                      onPressed: () {
                        if (_registerFormKey.currentState.validate()) {
                          if (pwdInputController.text ==
                              confirmPwdInputController.text) {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailInputController.text,
                                    password: pwdInputController.text)
                                .then((currentUser) => Firestore.instance
                                    .collection("employees")
                                    .document(currentUser.uid)
                                    .setData({
                                      "uid": currentUser.uid,
                                      "fname": firstNameInputController.text,
                                      "surname": lastNameInputController.text,
                                      "email": emailInputController.text,
                                    })
                                    .then((result) => {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                        uid: currentUser.uid,
                                                      )),
                                              (_) => false),
                                          firstNameInputController.clear(),
                                          lastNameInputController.clear(),
                                          emailInputController.clear(),
                                          pwdInputController.clear(),
                                          confirmPwdInputController.clear()
                                        })
                                    .catchError((err) => print(err)))
                                .catchError((err) {
                              String errorMsg;
                              print(err);
                              if (err.code == "ERROR_EMAIL_ALREADY_IN_USE") {
                                errorMsg =
                                    "Email is already in use. Login or create an account with a new email id.";
                              }
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(errorMsg),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            });
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text("The passwords do not match"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Already have an account?"),
                  FlatButton(
                    child: Text(
                      "Login here!",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ))),
      ],
    ));
  }
}
