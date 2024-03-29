import 'dart:convert';

import 'package:flutter/material.dart';
import 'config/AppConfig.dart';
import 'package:cyberpower/service/login_service.dart';
import 'package:cyberpower/util/http_exception_dialog.dart';
import 'package:cyberpower/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = true;


  snackBar(String  message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  bool _loading = false;
  final LoginService loginservice = new LoginService();

  void userLogin(String userEmail, String userPassword) async {
    //  SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setString('emailAddress', userEmail);
    setState(() {
      _loading = true;
    });

    var url = AppConfig.apiUrl + AppConfig.login;

    Map<String, String> headers = {};
    Map<String, String> body = {
      'emailAddress': userEmail,
      'password': userPassword
    };

    var data;

    try {
      data = await loginservice.getUserLogin(url, headers, body, context);
      data = await data.transform(utf8.decoder).join();
    } catch (e) {}

    print(data);

    HttpExceptionDialog httpExceptionDialog = new HttpExceptionDialog();

    if (data == null) {
      print("the error is coming here");
      httpExceptionDialog.showAlertDialog(context, "Http Request Failed.");
    }

    Map<String, dynamic> user = jsonDecode(data);
    print(user);
    AppConfig.loginData = data;
    if (user['success'] == false) {
      //// need to change things on this checkpoint
      setState(() {
        print("Login Failed");
        _loading = false;

      snackBar("email or password is incorrect");
      });
      print("userrrr");
      print(user);
    } else {
      await _saveCredentisla(
          loginEmailController.text, loginPasswordController.text);
      setState(() async {
        print("Login Success");
        AppConfig.userID = user['id'].toString();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userid', AppConfig.userID);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  _saveCredentisla(email, pass) async {
    if (_rememberMe) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('emailAddress', email);
      await prefs.setString('pass', pass);
    }

    return true;
  }

  Widget _entryFieldEmail(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (input) {
              if (input.isEmpty & !input.contains('@')) {
                return 'Provide an email';
              }
            },
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black)),
            ),
            controller: loginEmailController,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _entryFieldPassword(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black)),
            ),
            controller: loginPasswordController,
            obscureText: isPassword,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ButtonTheme(
      height: 40,
      minWidth: 150,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          userLogin(loginEmailController.text, loginPasswordController.text);
        },
        color: Colors.red[800],
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      child: Image.asset(
        "images/cyberpower-logo.jpg",
        height: 200,
        width: 200,
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryFieldEmail(
          "Email id",
        ),
        _entryFieldPassword("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _logo(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
