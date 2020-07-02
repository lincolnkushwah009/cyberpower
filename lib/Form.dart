import 'package:flutter/material.dart';
import 'package:cyberpower/testForm.dart';
import 'package:image_picker/image_picker.dart';

class serviceForm extends StatefulWidget {
  var listData;
  serviceForm({this.listData});

  @override
  _serviceFormState createState() => _serviceFormState();
}

class _serviceFormState extends State<serviceForm> {
  List<String> _locations = ['Dusty', 'Dust Free', 'AC']; // Option 2
  String _selectedLocation; // Option 2


  @override
  Widget build(BuildContext context) {
    print(" list data insde single tab");
    print(widget.listData);
    return Scaffold(

      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Image.asset(
          "images/cyberpower-logo.jpg",
          width: 150,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DropdownScreen()));
            },
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,20,8,20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Serial No."),
                          Text("123456789"),

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


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Battery Charging Volt",style: TextStyle(color: Colors.redAccent[700],fontWeight: FontWeight.bold),),
                      SizedBox(height: 10),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)),
                                    borderSide:
                                    BorderSide(color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Input Voltage",style: TextStyle(color: Colors.redAccent[700],fontWeight: FontWeight.bold),),


                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,100,0),
                              child: Text("R-N"),
                            ),
                            Container(
                                height: 30,
                               width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                          ],
                        ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("Y-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("B-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("N-E"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("R-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("Y-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("B-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text(""),
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                child: Text('')
                              ),
                            ],
                          ),

                        ],
                      ),


                      SizedBox(height: 10),

                      Text("Output Voltage",style: TextStyle(color: Colors.redAccent[700],fontWeight: FontWeight.bold),),

                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("N-R"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("N-S"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("N-T"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("N-E"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("R-T"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("S-T"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text("R-T"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                        BorderSide(color: Colors.redAccent[700])),
                                  ),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,100,0),
                                child: Text(""),
                              ),
                              Container(
                                  height: 30,
                                  width: 150,
                                  child: Text('')
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: <Widget>[
                          DropdownButton(
                            hint: Text('Site Condition'), // Not necessary for Option 1
                            value: _selectedLocation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation = newValue;
                              });
                            },
                            items: _locations.map((location) {
                              print(_selectedLocation);
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),

                          Text("")
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red[800],
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
