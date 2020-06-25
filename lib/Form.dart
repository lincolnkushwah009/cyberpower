import 'package:flutter/material.dart';

class serviceForm extends StatefulWidget {
  @override
  _serviceFormState createState() => _serviceFormState();
}

class _serviceFormState extends State<serviceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 350,
                  child: Card(

                    child:Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Call ID No."),
                              Text("XXXXXXXX"),
                              Text("FSR No."),
                              Text("XXXXXXXX"),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Client Name"),
                              Text("XXXXXXXX"),
                              Text("Date & Time"),
                              Text("XXXXXXXX"),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Client Address"),
                              Text("XXXXXXXXXXXXXX"),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("UPS Rating"),
                              Text("XXXXX"),
                              Text("UPS Model"),
                              Text("XXXXX"),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Serial No."),
                              Text("XXXXX"),
                              Text("Battery Mark"),
                              Text("XXXXX"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(" Battery Rating."),
                              Text("XXXXX"),
                              Text("Battery Qty"),
                              Text("XXXXX"),
                            ],
                          ),
                        ),

                      ],
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

