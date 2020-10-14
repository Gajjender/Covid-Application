import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import './IndiaCases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String confirmed,active,recovered,deaths,lastUpdatedTime;
bool check=false;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp>{
  Map data;
  List cases;

  Future getData() async{
    try{
      http.Response response= 
      await http.get('https://api.covid19india.org/data.json');

      data=json.decode(response.body);
      setState(() {
        cases=data["StateWise"];
        active=cases[0]["Active"];
        confirmed=cases[0]["Confirmed"];
        recovered=cases[0]["Recovered"];
        deaths=cases[0]["Deaths"];
        lastUpdatedTime=cases[0]["LastUpdatedTime"];
        check=true;
      });
    } catch(e) {}
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Covid_Application',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(92,6,50,1),
        accentColor: Color.fromRGBO(230,255,255,1)),
        home: Scaffold(
          body: check
              ? IndiaCases(
                active : active,
                confirmed : confirmed,
                deaths : deaths,
                recovered : recovered,
                lastUpdatedTime : lastUpdatedTime,
                isState : false,
              )
              : new Center(child: CircularProgressIndicator()),

        ),
    );
  }
}
