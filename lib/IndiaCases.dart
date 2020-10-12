import 'package:Covid_Application/StateWiseData.dart';
import 'package:Covid_Application/WorldWideData.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IndiaCases extends StatelessWidget{
  final String confirmed,active,recovered,deaths,lastUpdatedTime,stateName;
  final bool isState;

  IndiaCases(
     {this.active,
     this.confirmed,
     this.recovered,
     this.deaths,
     this.lastUpdatedTime,
     this.isState,
     this.stateName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        title: Text("Covid_Application"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15,top: 15,right: 15),
            child: Card(
              color: Color.fromRGBO(230, 230, 230, 1),
              elevation: 5,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: ((MediaQuery.of(context).size.height)-
                              (MediaQuery.of(context).padding.top)*
                              0.25),
                      child: Row(
                        children: [
                          active != null
                              ? Container(
                                  width: 250,
                                  child: PieChart(
                                    PieChartData(
                                      startDegreeOffset: 5,
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 45,
                                      borderData: FlBorderData(show: false),
                                      sections: [
                                        PieChartSectionData(
                                          showTitle: false,
                                          value: double.parse(active),
                                          color: Color.fromRGBO(25, 49, 103, 1), 
                                          title: "Active",   
                                        ),
                                        PieChartSectionData(
                                         showTitle: false,
                                         title: "Recovered",
                                         value: double.parse(recovered),
                                         color: Theme.of(context).primaryColor,
                                        ),
                                        PieChartSectionData(
                                          showTitle: false,
                                          title: "Deaths",
                                          color: Color.fromRGBO(255, 77, 77, 1),
                                          value: double.parse(deaths),
                                        )
                                      ],
                                    ),
                                  ),
                                ) 
                              : new Center(
                                  child: new CircularProgressIndicator()),
                          Container(
                            margin: EdgeInsets.only(left: 28),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      color: Color.fromRGBO(25, 49, 103, 1),
                                      height: 20,
                                      width: 20,
                                    ),
                                    Text(
                                      "Active",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      )
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      color: Color.fromRGBO(255, 77, 77, 1),
                                      height: 20,
                                      width: 20,
                                    ),
                                    Text(
                                      "Deaths",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      color: Theme.of(context).primaryColor,
                                      height: 20,
                                      width: 20,
                                    ),
                                    Text(
                                      "Recovered",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                            ),
                          ),
                        ]
                      ), 
                    )
                  )
                ]
              ),
            ),
          ),
          if(isState)
            Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 20),
                height: ((MediaQuery.of(context).size.height)-
                        (MediaQuery.of(context).padding.top))*
                    0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        color: Color.fromRGBO(230, 230, 230, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "State Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                                fontSize: 17)
                            ),
                            stateName!=null
                                ? Text(
                                    stateName,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                )
                              : Text("----"),  
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.all(15),
            height: ((MediaQuery.of(context).size.height)-
                     (MediaQuery.of(context).padding.top))*
                  0.5,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Confirmed",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                        ),
                        confirmed != null
                            ? Text(
                              confirmed,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                            : Text("0"),
                      ],      
                    ),   
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Active",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor,
                            fontSize: 17),
                        ),
                        active != null
                            ? Text(
                                active,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ) 
                            : Text("0"),  
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ((MediaQuery.of(context).size.height)-
                     (MediaQuery.of(context).padding.top))*
                0.2,             
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Recovered",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                                fontSize: 17),
                            ),
                            recovered !=null
                                ? Text(
                                    recovered,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : Text("0"),  
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Deaths",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                                fontSize: 17),
                            ),
                            deaths != null
                                ? Text(
                                    deaths,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    )
                                )
                                : Text("0"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: ((MediaQuery.of(context).size.height)-
                    (MediaQuery.of(context).padding.top))*
                0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Last_Updated_Time",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor,
                            fontSize: 17), 
                        ),
                        lastUpdatedTime != null
                            ? Text(
                              lastUpdatedTime,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                            : Text("0")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(!isState)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ButtonTheme(
                    minWidth: 195,
                    height: 60,
                    child: RaisedButton(
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StatewiseCases(),
                          ),
                        );
                      },
                      child: Text("StateWise"),
                    ),
                  ),
                ),
                Container(
                  child: ButtonTheme(
                    height: 60,
                    minWidth: 195,
                    child: RaisedButton(
                      textColor: Color.fromRGBO(255,255,255,1),
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Worldwide(),
                          ),
                        );
                      },
                      child: Text("WorldWide"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Code Completed on 12/10/2020