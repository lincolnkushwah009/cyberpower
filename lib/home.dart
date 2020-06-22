import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  TabController controller;
  final List<Tab> mytabs = <Tab>[
    Tab(child: Text("Today",style: TextStyle(color:Colors.white),)),
    Tab(child: Text("Weekly",style: TextStyle(color:Colors.white)),),
    Tab(child: Text("Yearly",style: TextStyle(color:Colors.white)),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          color: Color.fromRGBO(0, 0, 51, 100),

          child: DefaultTabController(
            length: 3,

            child: Scaffold(

              appBar: AppBar(
                centerTitle: true,
                title: Text("home"),
                backgroundColor: Color.fromRGBO(0, 0, 51, 100),

                bottom: TabBar(
                    indicatorColor: Color.fromRGBO(0, 0, 51, 100),
                    tabs: mytabs
                ),
              ),
              body: Container(
                color: Color.fromRGBO(0, 0, 51, 100),
                child: TabBarView(

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Pending"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  Text("Open"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Closed"),
                    ),

                  ],

                ),
              ),
            ),
          ),
        )
    );
  }
}
