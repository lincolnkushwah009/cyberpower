import 'dart:convert';

import 'package:flutter/material.dart';
import 'config/AppConfig.dart';
import 'package:cyberpower/service/login_service.dart';
import 'package:cyberpower/util/http_exception_dialog.dart';
import 'package:cyberpower/home.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
   bool _loading = false;
  final LoginService loginservice = new LoginService();

   void userLogin(String userEmail, String userPassword) async {
    

    setState(() {
      _loading = true;
    });

    var url = AppConfig.apiUrl + AppConfig.login;

    Map<String, String> headers = {
    };
    Map<String, String> body = {
      'emailAddress' : userEmail,
      'password' : userPassword
    };


    var data;
    print(url);
    print(body);
    print(headers);
    print(context);
    print("All the data is coming here");


    try {
      data = await loginservice.getUserLogin(url, headers, body, context);
      data = await data.transform(utf8.decoder).join();
    } catch(e) {
      print('not working');
      print('error caught: $e');
    }

    print(data);


    HttpExceptionDialog httpExceptionDialog = new HttpExceptionDialog();

    if (data == null) {
      print("the error is coming here");
      httpExceptionDialog.showAlertDialog(context, "Http Request Failed.");
    }

    Map<String, dynamic> user = jsonDecode(data);
    print(user);
    // AppConfig.loginData = data;
    // if(user['errorMessage'] != null) { //// need to change things on this checkpoint
    //       setState(() {
    //         print("Login Failed");
    //         _loading = false;
    //       });
    //       print("userrrr");
    //       print(user);
    // } else {

    //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

      
    // }
  }

  Widget _entryFieldEmail(String title, {bool isPassword = false}) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  borderSide: BorderSide(color: Colors.grey)) ,

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                     borderSide: BorderSide(color: Colors.grey)) ,

                 focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                     borderSide: BorderSide(color: Colors.black)),
               ),

               controller: loginPasswordController,
               obscureText: isPassword,
             style: TextStyle( fontSize: 15),

           )
         ],
       ),
     );
   }


  Widget _submitButton() {
    return Container(
     height: 40,
      width: 150,

      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(1, 2),
                blurRadius: 5,
                spreadRadius: 2)
          ],
         color: Colors.red
      ),
      child: GestureDetector(
        onTap: (){
           userLogin(loginEmailController.text,loginPasswordController.text);
           print(loginEmailController.text);
           print(loginPasswordController.text);
           print("dataaaaaaaaaaaaaaaaa");
        },

              child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }



  Widget _logo() {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

        },
          child: Image.asset("images/cyberpower-logo.jpg",height: 200,width: 200,)),
    );
  }


  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryFieldEmail("Email id",),
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
