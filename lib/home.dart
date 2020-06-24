import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

//  List categoryList;
//  Map data;
//
//  CallLogByEngineer() async {
//
//
//    var DataID = {
//      "assignedTo":01
//    };
//
//    http.Response response =
//    await http.get('http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1');
//    data = json.decode(response.body);
//    setState(() {
//      categoryList = data['category'];
//    });
//    debugPrint(response.body);
//  }




final String url = "http://52.163.212.84:7000/getAllCallLogByEngineer?assignedTo=1";
List Data;


@override
void initState(){
  super.initState();
  this.getJsonData();
}

Future<String> getJsonData() async{
  var response=await http.get(
    Uri.encodeFull(url),

    headers: {"Accept": "application/json"}
  );

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

      home:  Scaffold(
        body: DefaultTabController(
      length: 3,
           child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(15,0,0,0),
            child: Image.asset("images/cyberpower-logo.jpg",height: 200,width: 200,)
          ),
          bottom: TabBar(
            labelColor: Colors.red[800],
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Open'),
              Tab(text: 'Pending'),
              Tab(text: 'Closed'),
            ],
          ),
        ),
        body: TabBarView(

          children: [
            Open(),
            Pending(),
            Closed(),
          ],
        ),
      ),
    ),
    ),
    );
  }
}

class Open extends StatelessWidget {
  final List<Widget> cards = List<Widget>.generate(1, (i)=>new OpenCards());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:   Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,50),
              child: new Container(
                  child: new ListView(
                    children: cards,
                  )

              ),
            )
        )
    );
  }
}



class Pending extends StatelessWidget {
  final List<Widget> cards = List<Widget>.generate(1, (i)=> PendingCards());

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:   Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,50),
              child: new Container(
                  child: new ListView(
                    children: cards,
                  )

              ),
            )
        )
    );
  }
}




class Closed extends StatelessWidget {
  final List<Widget> cards = List<Widget>.generate(1, (i)=>new ClosedCards());

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:   Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,50),
              child: new Container(
                  child: new ListView(
                    children: cards,
                  )

              ),
            )
        )
    );
  }
}


class OpenCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 350,
            child: Card(

              child:Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Call Log Number"),
                        Text("C062020C0001")
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("FSR Number"),
                        Text("10000"),
                        RaisedButton(
                          color: Colors.red[600],
                          onPressed: (){},
                          child: Text("Service",style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Status"),
                        Text("Open")
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
    );
  }
}


class PendingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: 350,
            child: Card(

              child:Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Call Log Number"),
                        Text("C062020C0002")
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("FSR Number"),
                        Text("10001"),
                        RaisedButton(
                          color: Colors.red[600],
                          onPressed: (){},
                          child: Text("Service",style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Status"),
                        Text("Pending")
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
    );
  }
}


class ClosedCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            width: 350,
            child: Card(

              child:Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Call Log Number"),
                        Text("C062020C0003")
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("FSR Number"),Text("10002"),
                        RaisedButton(
                          color: Colors.red[600],
                          onPressed: (){},
                          child: Text("Service",style: TextStyle(color: Colors.white),),
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
    );
  }
}