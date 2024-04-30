import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/forgotPassword.dart';
import 'package:flutter_application_1/features/homepage.dart';
import 'package:flutter_application_1/features/register.dart';
import 'package:flutter_application_1/provider/provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color usernameFocus = Colors.white;
  Color passwordFocus = Colors.white;
  IconData visibility = Icons.visibility_off_outlined;
  bool visibilityPassword = true;
  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  String? errorText = null;
  String usernameTempInput = '';
  String passwordTempInput = '';

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
                  'Log',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  ' In',
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
                margin: EdgeInsets.only(left: 40),
                height: 2,
                color: Color(0xFFF6B17A),
                width: 110,
              ),
              SizedBox(
                height: 100,
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
                      if (usernameTempInput != usernameInput.text ||
                          passwordTempInput != passwordInput.text) {
                        errorText = null;
                      }
                    });
                  },
                  controller: usernameInput,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxLength: 10,
                  decoration: InputDecoration(
                      errorText: errorText,
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
                      if (usernameTempInput != usernameInput.text ||
                          passwordTempInput != passwordInput.text) {
                        errorText = null;
                      }
                    });
                  },
                  controller: passwordInput,
                  obscureText: visibilityPassword,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  maxLength: 10,
                  decoration: InputDecoration(
                      errorText: errorText,
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
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (!Provider.of<LoginProvider>(context, listen: false)
                        .checkUser(
                            Provider.of<RegisterProvider>(context,
                                    listen: false)
                                .users,
                            usernameInput.text,
                            passwordInput.text)) {
                      errorText = 'Invalid Username and Password';
                      usernameTempInput = usernameInput.text;
                      passwordTempInput = passwordInput.text;
                    } else {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  });
                },
                child: Text('Log In'),
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
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text('SIGNUP NOW'),
                    style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        padding: EdgeInsets.zero,
                        foregroundColor: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                    },
                    child: Text('Forgot Password ?'),
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
