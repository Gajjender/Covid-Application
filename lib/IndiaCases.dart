
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
                                          showitle: false,
                                          value: double.parse(active),
                                          color: Color.fromRGBO(25, 49, 103, 1), 
                                          title: "Active",   
                                        ),

                                         
                                      ]
                                    )
                                  ),
                          )                          
                        ]
                      ),        
                    )
                  )
                ]
              ),
            ),
          ),
        ]
      ),
    );
  }
}