import 'package:flutter/material.dart';

class serviceForm extends StatefulWidget {
  @override
  _serviceFormState createState() => _serviceFormState();
}

class _serviceFormState extends State<serviceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
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


            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Engineer Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Engineer Contact',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Customer Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Customer Contact',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("LOAD %"),
                        Container(
                          height: 40,
                          width: 70,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'R',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Y',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'B',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Battery charging Volt"),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Total Battery Volt',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: ' Charging Volt',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Volt After 5 mins',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.grey)) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: ' Volt After 10 mins',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])) ,

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.red[700])),
                            ),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),



                  ],
                ),
              ),
            ),



          ],
        ),

      ),
    );
  }
}




