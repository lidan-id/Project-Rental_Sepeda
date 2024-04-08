import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/home.dart';
import 'package:flutter_application_1/features/login.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color usernameFocus = Colors.white;
  Color passwordFocus = Colors.white;
  Color confirmPasswordFocus = Colors.white;
  IconData visibility = Icons.visibility_off_outlined;
  IconData visibility2 = Icons.visibility_off_outlined;
  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();
  String? usernameErrorText = null;
  String? passwordErrorText = null;
  String? confirmPasswordErrorText = null;
  bool error = true;
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String usernameTempInput = '';
  String passwordTempInput = '';
  String confirmPasswordTempInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2D3250), Color(0xFF424769)])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Icon(
                    Icons.pedal_bike,
                    color: Color(0xFFF6B17A),
                  ),
                  Text(
                    '  Re:Bike',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: 'Neue'),
                  )
                ],
              ),
              Row(children: [
                Text(
                  'Sign',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  ' Up',
                  style: TextStyle(
                      color: Color(0xFFF6B17A),
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                height: 2,
                color: Color(0xFFF6B17A),
                width: 130,
              ),
              SizedBox(
                height: 60,
              ),
              Focus(
                onFocusChange: (value) {
                  setState(() {
                    if (value) {
                      usernameFocus = Color(0xFFF6B17A);
                    } else {
                      usernameFocus = Colors.white;
                    }
                  });
                },
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      usernameInput.text = value.trim();
                      if (usernameTempInput != usernameInput.text) {
                        usernameErrorText = null;
                      }
                    });
                  },
                  controller: usernameInput,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxLength: 10,
                  decoration: InputDecoration(
                      errorText: usernameErrorText,
                      labelText: 'Username',
                      labelStyle: TextStyle(color: usernameFocus),
                      prefixIcon: Icon(
                        Icons.person_3_outlined,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Focus(
                onFocusChange: (value) {
                  setState(() {
                    if (value) {
                      passwordFocus = Color(0xFFF6B17A);
                    } else {
                      passwordFocus = Colors.white;
                    }
                  });
                },
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      passwordInput.text = value.trim();
                      if (passwordTempInput != passwordInput.text) {
                        passwordErrorText = null;
                      }
                    });
                  },
                  controller: passwordInput,
                  obscureText: visibilityPassword,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxLength: 10,
                  decoration: InputDecoration(
                      errorText: passwordErrorText,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: passwordFocus),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (visibility == Icons.visibility_off_outlined) {
                              visibilityPassword = false;
                              visibility = Icons.visibility_outlined;
                            } else {
                              visibilityPassword = true;
                              visibility = Icons.visibility_off_outlined;
                            }
                          });
                        },
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Focus(
                onFocusChange: (value) {
                  setState(() {
                    if (value) {
                      confirmPasswordFocus = Color(0xFFF6B17A);
                    } else {
                      confirmPasswordFocus = Colors.white;
                    }
                  });
                },
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      confirmPasswordInput.text = value.trim();
                      if (confirmPasswordTempInput !=
                          confirmPasswordInput.text) {
                        confirmPasswordErrorText = null;
                      }
                    });
                  },
                  controller: confirmPasswordInput,
                  obscureText: visibilityConfirmPassword,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxLength: 10,
                  decoration: InputDecoration(
                      errorText: confirmPasswordErrorText,
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: confirmPasswordFocus),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          visibility2,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (visibility2 == Icons.visibility_off_outlined) {
                              visibilityConfirmPassword = false;
                              visibility2 = Icons.visibility_outlined;
                            } else {
                              visibilityConfirmPassword = true;
                              visibility2 = Icons.visibility_off_outlined;
                            }
                          });
                        },
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    usernameTempInput = usernameInput.text;
                    passwordTempInput = passwordInput.text;
                    confirmPasswordTempInput = confirmPasswordInput.text;
                    if (usernameInput.text.length < 3 ||
                        usernameInput.text == '') {
                      usernameErrorText = 'username must be 3 characters long';
                      error = true;
                    } else {
                      usernameErrorText = null;
                      error = false;
                    }
                    if (!validateStructure(passwordInput.text)) {
                      passwordErrorText =
                          'password must contains [(!@#\$&*~), 8 characters, uppercase, lowercase]';
                      error = true;
                    } else {
                      passwordErrorText = null;
                    }
                    if (passwordInput.text != confirmPasswordInput.text) {
                      confirmPasswordErrorText = 'password does not match';
                      error = true;
                    } else {
                      confirmPasswordErrorText = null;
                    }
                    if (!error) {
                      Provider.of<RegisterProvider>(context, listen: false)
                          .addUser(User(
                              username: usernameInput.text,
                              password: passwordInput.text));
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  });
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    backgroundColor: Color(0xFFF6B17A),
                    foregroundColor: Colors.white),
              )),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text('LOGIN NOW'),
                    style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        padding: EdgeInsets.zero,
                        foregroundColor: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}