import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Covid_Application/IndiaCases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StatewiseCases extends StatefulWidget{
  @override  
  _StatewiseCasesState createState() => _StatewiseCasesState();

}

class _StatewiseCasesState extends State<StatewiseCases>{
  Map data;
  List cases;

  Future getData() async{
    http.Response response =
        await http.get('https://api.covid19india.org/data.json');
        
    data = json.decode(response.body);
    setState(() {
      cases = data["Statewise"];
    }); 
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO( 242, 242, 242, 1),
      appBar: AppBar(
       title: Text("Covid_Application"), 
      ),
      body: Column(
       children: [
         Container(
           height: 70,
           child: Card(
             color: Color.fromRGBO(230, 230, 230, 1),
             elevation: 8,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text(
                   "State Name",
                   textAlign: TextAlign.left,
                   style: TextStyle(
                     color: Theme.of(context).primaryColor,
                     fontWeight: FontWeight.w900,
                     fontSize: 18),
                 ),
               ],
             ),    
           ),
         ),
         Flexible(
           child: ListView.builder(
            itemCount: cases==null ? 0 : (cases.length-1),
            itemBuilder: (context, index){
              if(cases[index + 1]["State"] == "State Unassigned"){
              } else {
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  height: 70,
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: new ListTile(
                      leading: Text(
                        cases[index+1]["state"],
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      trailing: Text(
                        cases[index+1]["Confirmed"],
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IndiaCases(
                              active: cases[index+1]["Active"],
                              confirmed: cases[index+1]["Confirmed"],
                              deaths: cases[index+1]["Deaths"],
                              lastUpdatedTime: cases[index+1]["LastUpdatedTime"],
                              recovered: cases[index+1]["Recovered"],
                              isState: true,
                              stateName: cases[index+1]["State"],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },    
           ),
         ),
        ],
      ), 
    );
  }
}//Code Completed on 12/10/2020