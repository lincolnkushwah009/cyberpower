import 'dart:convert';
import 'package:cyberpower/home.dart';
import 'package:cyberpower/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'config/AppConfig.dart';
import 'package:cyberpower/service/login_service.dart';
import 'service/buy_fragment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar.dart';
import 'package:multi_image_picker/multi_image_picker.dart';



String _value;

class Constants{
  static const String Logout = 'Logout';


  static const List<String> choices = <String>[
    Logout,

  ];
}

class serviceForm extends StatefulWidget {


  var listData;
  // Flushbar flush;
  serviceForm({this.listData});

  @override
  _serviceFormState createState() => _serviceFormState();
}

class _serviceFormState extends State<serviceForm> {
  Flushbar flush;

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(
              child: new Text(
                "Success",
                style: TextStyle(color: Colors.green),
              )),
          content: new Text(
              "FSR Updated Successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new Container(
              width: 300,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Text("Continue"),
                textColor: Colors.white,
                padding: EdgeInsets.all(16),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext ctx) => Home()));
                },
                color: Colors.red[800],
              ),
            ),
          ],
        );
      },
    );
  }


  static var images;
  TextEditingController upsSerialNumber = new TextEditingController();
  TextEditingController engineername = new TextEditingController();
  TextEditingController engineerContact = new TextEditingController();
  TextEditingController customername = new TextEditingController();
  TextEditingController customerContact = new TextEditingController();
  TextEditingController loadR = new TextEditingController();
  TextEditingController loadY = new TextEditingController();
  TextEditingController loadB = new TextEditingController();
  TextEditingController totalBatteryVolt = new TextEditingController();
  TextEditingController chargingVolt = new TextEditingController();
  TextEditingController voltAfterFive = new TextEditingController();

  TextEditingController voltAfterTen = new TextEditingController();
  TextEditingController inputRn = new TextEditingController();
  TextEditingController inputYn = new TextEditingController();
  TextEditingController inputBn = new TextEditingController();
  TextEditingController inputNe = new TextEditingController();
  TextEditingController inputRn2 = new TextEditingController();
  TextEditingController inputYn2 = new TextEditingController();
  TextEditingController inputBn2 = new TextEditingController();
  TextEditingController outputNr = new TextEditingController();
  TextEditingController outputNs = new TextEditingController();
  TextEditingController outputNt = new TextEditingController();
  TextEditingController outputNe = new TextEditingController();

  TextEditingController outputRt = new TextEditingController();
  TextEditingController outputSt = new TextEditingController();
  TextEditingController observationAndWorkDone = new TextEditingController();
  TextEditingController spareUsed = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  bool _loading = false;
  bool otpText=false;
  TextEditingController outputRt2 = new TextEditingController();
  final BuyService buyservice = new BuyService();
  String otpV;

  List<String> _locations = ['Dusty', 'Dust Free', 'AC']; // Option 2
  String _selectedLocation; // Option 2
  final LoginService loginservice = new LoginService();
  void saveButton() async {
    var url = AppConfig.apiUrl + AppConfig.form;

    Map<String, String> headers = {
      //     'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    Map<String, String> body = {

      "customername": customername.text,
      "customerContact": customerContact.text,
      "engineername": engineername.text,
      "engineerContact": engineerContact.text,
      "callLogNumber": widget.listData['callLogId'],
      "fsrNumber": widget.listData['fsrNo'],
      "fsrDate": widget.listData['logDate'],
      "fsrTime": widget.listData['logTime'],
      "upsSerialNo": upsSerialNumber.text,
      "batterySerialNo": widget.listData['batterySerialNo'],
      "observationAndWorkDone": observationAndWorkDone.text,
      "spareUsed": spareUsed.text,
      "ivrn": inputRn.text,
      "ivrn2": inputRn2.text,
      "ivyn": inputYn.text,
      "ivyn2": inputYn2.text,
      "ivbn": inputBn.text,
      "ivbn2": inputBn2.text,
      "ivne": inputNe.text,
      "ovrt": outputRt.text,
      "ovrt2": outputRt2.text,
      "ovnr": outputNr.text,
      "ovns": outputNs.text,
      "ovnt": outputNt.text,
      "ovne": outputNe.text,
      "ovst": outputSt.text,
      "loadR": loadR.text,
      "loadB": loadB.text,
      "loadY": loadY.text,
      "bcTV": totalBatteryVolt.text,
      "bcV": chargingVolt.text,
      "bvA5": voltAfterFive.text,
      "bvA10": voltAfterTen.text,
      "siteCondition": _selectedLocation,
      "file": AppConfig.image,
      "sitePhoto2": "Test",
      "sitePhoto3": "Test",
      "status":_value
    };
    print('print body.............................');
    print(body);
    var data;

    try {
      data = await loginservice.getUserLogin(url, headers, body, context);
      data = await data.transform(utf8.decoder).join();
      _showDialog();
    } catch (e) {}
    print("dataaaaaaa");
    print(data);
    setState(() {
      _loading = true;

    });
  }


  void generateOtp() async {
    var url = AppConfig.apiUrl + AppConfig.generateOtp;

    Map<String, String> headers = {
      //     'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    Map<String, String> body = {
      "customerContact": customerContact.text,
      "fsrNumber": widget.listData['fsrNo'] ,
    };
    print('print body.............................');
    print(body);
    var data;
    try {
      data = await loginservice.getUserLogin(url, headers, body, context);
      data = await data.transform(utf8.decoder).join();
    } catch (e) {}
    print("dataaaaaaa");
    print(data);
    setState(() {
      _loading = true;
      if(data=='fail'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: "OTP Generated Failed",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }
      if(data=='invalid'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: "Invalid OTP",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }
      if(data=='negative'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: " OTP was not generated. Generate OTP again.",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }
      if(data=='expired'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: "Entered OTP is expired. Generate a new OTP",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }

    });
  }



  void verifyOtpp() async {
    var url = AppConfig.apiUrl + AppConfig.verifyOtp;

    Map<String, String> headers = {
      //     'Content-type': 'application/json',
      // 'Accept': 'application/json',
    };
    Map<String, String> body = {
      "fsrNumber": widget.listData['fsrNo'],
      "otp":otp.text
    };
    print('print body.............................');
    print(body);
    var data;
    try {
      data = await loginservice.getUserLogin(url, headers, body, context);
      data = await data.transform(utf8.decoder).join();

    } catch (e) {}
    print("dataaaaaaa");
    print(data);
    setState(() {
      _loading = true;
      if(data=='invalid'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: "Invalid OTP",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }
      else{
        otpText=true;
      }

      if(data=='negative'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: " OTP was not generated. Generate OTP again.",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }
      if(data=='expired'){
        Flushbar<bool>(
          mainButton: FlatButton(
            onPressed: () {
              flush.dismiss(true);
            },
            child: Text(
              'OK',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
          ),
          borderRadius: 10,
          message: "Entered OTP is expired. Generate a new OTP",
          duration: Duration(seconds: 3),
        )..show(context);
        otpText=false;

      }



    });
  }



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      AppConfig.image = image;
    });
  }



  @override
  Widget build(BuildContext context) {

    print(" list data insde single tab");
    print('.........................................................');

    print (widget.listData['serialNumber']);
    print(widget.listData);

    return Scaffold(
      floatingActionButton:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.redAccent[700],        ),

        width: 60.0,
        height: 60.0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 3.0,
          child: Text(
            "Generate \n OTP ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
          ),
          onPressed: (){
            generateOtp();
            if(customerContact.text.length==10&&customerContact.text.isNotEmpty)
            {
              Flushbar<bool>(
                mainButton: FlatButton(
                  onPressed: () {
                    flush.dismiss(true);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                borderRadius: 10,
                message: "OTP generated successfully",
                duration: Duration(seconds: 6),
              )..show(context);
            }
          },
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Image.asset(
          "images/cyberpower-logo.jpg",
          width: 150,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
//            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
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
                          Row(
                            children: <Widget>[
                              Text("Call ID No :",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 10,),
                              Text(widget.listData['callLogId']),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Text("FSR No :",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 10,),
                              Text(widget.listData['fsrNo']),
                            ],
                          )


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Date :",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(widget.listData['logDate']),
                          Text("UPS Qty :",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(widget.listData['upsUnitQty'].toString() ?? "Empty"),
                          Text(" Model :",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(widget.listData['model'] == null? 'NA': widget.listData['model']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Client Name :",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 10),
                          Text(widget.listData['customerName']),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Client Email :" ,style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text(widget.listData['email']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Phone Number : ",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 5),
                          Text(widget.listData['contactNo']),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Client Address :",style: TextStyle(fontWeight: FontWeight.bold),), SizedBox(width: 10,),

                          Flexible(child: Text(widget.listData['address'])),
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
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Serial No."),
                          widget.listData['serialNumber'] == 'NA'
                              ? Flexible(
                                child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter Serial Number',
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
                                    BorderSide(color: Colors.black)),
                            ),
                            controller: upsSerialNumber,
                            style: TextStyle(fontSize: 15),
                          ),
                              )
                              : Text(widget.listData['serialNumber'])
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
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Fault symptoms"),
                          Text(widget.listData['faultSymptom'])
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
                              controller: engineername,
                              decoration: InputDecoration(
                                hintText: 'Engineer Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: engineerContact,
                              decoration: InputDecoration(
                                hintText: 'Engineer Contact',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
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
                              controller: customername,
                              decoration: InputDecoration(
                                hintText: 'Customer Name',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: customerContact,
                              decoration: InputDecoration(
                                hintText: 'Customer Contact',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
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
                              controller: loadR,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'R',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            child: TextFormField(
                              controller: loadY,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Y',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 70,
                            child: TextFormField(
                              controller: loadB,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'B',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Battery Charging Volt",
                        style: TextStyle(
                            color: Colors.redAccent[700],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: totalBatteryVolt,
                              decoration: InputDecoration(
                                hintText: 'Total Battery Volt',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: chargingVolt,
                              decoration: InputDecoration(
                                hintText: ' Charging Volt',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
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
                              keyboardType: TextInputType.number,
                              controller: voltAfterFive,
                              decoration: InputDecoration(
                                hintText: 'Volt After 5 mins',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: voltAfterTen,
                              decoration: InputDecoration(
                                hintText: ' Volt After 10 mins',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent[700])),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Input Voltage",
                        style: TextStyle(
                            color: Colors.redAccent[700],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("R-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputRn,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("Y-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputYn,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("B-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputBn,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("N-E"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputNe,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("R-Y"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputRn2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("Y-B"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputYn2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("B-R"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: inputBn2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text(""),
                              ),
                              Container(
                                  height: 40, width: 150, child: Text('')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Output Voltage",
                        style: TextStyle(
                            color: Colors.redAccent[700],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("R-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputNr,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("Y-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputNs,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("B-N"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputNt,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("N-E"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  controller: outputNe,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("R-Y"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputRt,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("Y-B"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputSt,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text("B-R"),
                              ),
                              Container(
                                height: 30,
                                width: 150,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: outputRt2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent[700])),
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
                                padding:
                                const EdgeInsets.fromLTRB(0, 0, 100, 0),
                                child: Text(""),
                              ),
                              Container(
                                  height: 30, width: 150, child: Text('')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      _selectedLocation == 'Dusty'
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropdownButton(
                            hint: Text(
                                'Site Condition'), // Not necessary for Option 1
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
                          RaisedButton(
                            onPressed: () {
                              getImage();
                            },
                            child: Text(
                              "Select",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              width: 100.0,
                              height: 100.0,
                              child: AppConfig.image != null
                                  ? Image.file(AppConfig.image,
                                  fit: BoxFit.fitWidth,
                                  height: 114,
                                  width: 114)
                                  : new Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          "images/cyberpower-logo.jpg"),
                                    ),
                                  )))
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DropdownButton(
                            hint: Text(
                                'Site Condition'), // Not necessary for Option 1
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
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: <Widget>[
                          StatusDropDown(),
                          Text("")
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Center(child: Text("Spare Used if any ")),
                      ),
                      TextFormField(

                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: spareUsed,
                        decoration: InputDecoration(
                          hintText: "Write something here....",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Colors.redAccent[700])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Colors.redAccent[700])),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),


                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Center(child: Text("Observation And Work Done")),
                      ),
                      TextFormField(
                        validator: (val){
                          if(val == '12345')
                            otpText=true;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: observationAndWorkDone,
                        decoration: InputDecoration(
                          hintText: "Write something here....",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Colors.redAccent[700])),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)),
                              borderSide: BorderSide(
                                  color: Colors.redAccent[700])),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: otp,
                          decoration: InputDecoration(
                            hintText: 'Enter OTP',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Colors.redAccent[700])),
                          ),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    // otpText==true?
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.red[800],
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onPressed: () {
                          verifyOtpp();
                        },
                      ),
                    )


                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
              ),
            ),
            SizedBox(height: 20),
            otpText==true?
            Container(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red[800],
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  saveButton();
                },
              ),
            ):
            Container(
              height: 60,
              width: double.infinity,
              child: IgnorePointer(
                ignoring: true,
                child: RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    saveButton();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class StatusDropDown extends StatefulWidget {
  @override
  _StatusDropDownState createState() {

    return _StatusDropDownState();
  }
}

class _StatusDropDownState extends State<StatusDropDown> {


  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(

      items: [
        DropdownMenuItem<String>(
          child: Text('Pending'),
          value: 'Pending',
        ),
        DropdownMenuItem<String>(
          child: Text('Closed'),
          value: 'Closed',
        ),

      ],
      onChanged: (String value) {
        setState(() {
          _value = value;
        });
      },
      hint: Text('Select Status'),
      value: _value,
    );
  }


  void choiceAction(String choice){
    if(choice == Constants.Logout){
      RaisedButton(
        onPressed: () async {
          //after the login REST api call && response code ==200
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('emailAddress', 'useremail@gmail.com');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
        },
      );

    }


  }
}