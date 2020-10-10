
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
     this.stateName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        title: Text("Covid_Application"),
      ),
      body: Column(
        crossAxisAlignment: crossAxisAlignment.start,
        chidlren: [
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
                                      borderData: F1BorderData(show: false),
                                      sections: [
                                        PieChartSectionData(
                                          showTitle: false,
                                          value: double.parse(active),
                                          color: Color.fromRGBO(25, 49, 103, 1), 
                                          Title: "Active",   
                                        ),
                                        PieChartSectionData(
                                         showTtile: false,
                                         Title: "Recovered",
                                         value: double.parse(recovered),
                                         color: Theme.of(context).primaryColor,
                                        ),
                                        PieChartSectionData(
                                          showTitle: false,
                                          Title: "Deaths",
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
                              mainAxisSize= MainAxisSize.max,
                              mainAxisAlignment= MainAxisAlignment.end,
                              crossAxisAlignment= CrossAxisAlignment.start,
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
                                      "Active"
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
                                      "Deaths"
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
                                      "Recovered"
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
            //We'll Start from here tomorrow
          )    
        ]
      ),
    );
  }
}