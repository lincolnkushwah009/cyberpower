import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cyberpower/Form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> notList = new List();

  final String url =
      "http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1";
  List Data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      Data = convertDataToJson['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print("dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa............");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent[700],
              title: Image.asset(
                "images/cyberpower-logo.jpg",
                width: 150,
              ),
              actions: <Widget>[
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                SizedBox(width: 20)
              ],
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(text: 'Open',),
                  Tab(text: 'Pending'),
                  Tab(text: 'Closed'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                OpenCards(),
                PendingCards(),
                ClosedCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class OpenCards extends StatefulWidget {
  @override
  _OpenCardsState createState() => _OpenCardsState();
}
class _OpenCardsState extends State<OpenCards> {
  List<dynamic> notList = new List();
  final String url = "http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1";
  @override
  void initState() {
    super.initState();
    this.getJsonData('Open');
  }

  Future<String> getJsonData(status) async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);
    var convertDataToJson = json.decode(response.body);
    var filterlist = [];
    for(var i=0; i<convertDataToJson.length; i++) {
      print([convertDataToJson[i]['status'], convertDataToJson[i]['status'] == status]);
      print("@@@@@@@@@@");
      if( convertDataToJson[i]['status'] == status)
      filterlist.addAll([convertDataToJson[i] ]);
    }

    setState(() {
      notList = filterlist; // convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notList.length,
        itemBuilder: (context, i) {
          Map<String, dynamic> item = notList[i];
          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    width: 350,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Call Log Number"),
                                Text(notList[i]['callLogId'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("FSR Number"),
                                Text(notList[i]['fsrNo']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Status"),
                                Text(notList[i]['status'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(""),
                                RaisedButton(
                                  color: Colors.redAccent[700],
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => serviceForm( listData: notList[i])));
                                  },
                                  child: Text(
                                    "Service",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
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
          );
        });
  }
}


class PendingCards extends StatefulWidget {
  @override
  _PendingCardsState createState() => _PendingCardsState();
}
class _PendingCardsState extends State<PendingCards> {
  List<dynamic> notList = new List();
  final String url = "http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1";
  @override
  void initState() {
    super.initState();
    this.getJsonData('Pending');
  }

  Future<String> getJsonData(status) async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);
    var convertDataToJson = json.decode(response.body);
    var filterlist = [];
    for(var i=0; i<convertDataToJson.length; i++) {
      print([convertDataToJson[i]['status'], convertDataToJson[i]['status'] == status]);
      print("@@@@@@@@@@");
      if( convertDataToJson[i]['status'] == status)
        filterlist.addAll([convertDataToJson[i] ]);
    }

    setState(() {
      notList = filterlist; // convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notList.length,
        itemBuilder: (context, i) {
          Map<String, dynamic> item = notList[i];
          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    width: 350,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Call Log Number"),
                                Text(notList[i]['callLogId'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("FSR Number"),
                                Text(notList[i]['fsrNo']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Status"),
                                Text(notList[i]['status'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(""),
                                RaisedButton(
                                  color: Colors.redAccent[700],
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => serviceForm( listData: notList[i])));

                                  },
                                  child: Text(
                                    "Service",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
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
          );
        });
  }
}



class ClosedCards extends StatefulWidget {
  @override
  _ClosedCardsState createState() => _ClosedCardsState();
}
class _ClosedCardsState extends State<ClosedCards> {
  List<dynamic> notList = new List();
  final String url = "http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1";
  @override
  void initState() {
    super.initState();
    this.getJsonData('Closed');
  }

  Future<String> getJsonData(status) async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);
    var convertDataToJson = json.decode(response.body);
    var filterlist = [];
    for(var i=0; i<convertDataToJson.length; i++) {
      print([convertDataToJson[i]['status'], convertDataToJson[i]['status'] == status]);
      print("@@@@@@@@@@");
      if( convertDataToJson[i]['status'] == status)
        filterlist.addAll([convertDataToJson[i] ]);
    }

    setState(() {
      notList = filterlist; // convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notList.length,
        itemBuilder: (context, i) {
          Map<String, dynamic> item = notList[i];
          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    width: 350,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Call Log Number"),
                                Text(notList[i]['callLogId'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("FSR Number"),
                                Text(notList[i]['fsrNo']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Status"),
                                Text(notList[i]['status'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(""),
                                RaisedButton(
                                  color: Colors.redAccent[700],
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => serviceForm( listData: notList[i])));
                                  },
                                  child: Text(
                                    "Service",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
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
          );
        });
  }
}




