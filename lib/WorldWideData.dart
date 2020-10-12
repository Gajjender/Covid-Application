import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

String confirmed,
    active,
    deaths,
    recovered,
    affectedCountries,
    todayDeaths,
    todayCases,
bool dataFetched=false;

class Worldwide extends StatefulWidget{
  @override
  _WorldWideState createState() => _WorldWideState();
}

class _WorldWideState extends State<Worldwide>{
  Map cases;
  Future fetchWorldWideData() async {
    http.Response response= await http.get("https://corona.lmao.ninja/v2/all");
    debugPrint(response.body);
    setState(() {
      cases=json.decode(response.body);
      confirmed=cases["Cases"].toString();
      active=cases["Active"].toString();
      deaths=cases["Deaths"].toString();
      recovered=cases["Recovered"].toString();
      affectedCountries=cases["AffectedCountries"].toString();
      todayDeaths=cases["todayDeaths"].toString();
      todayCases=cases["todayCases"].toString();
      dataFetched=true;
    });
  }

  @override
  void initState(){
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget Build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(title: Text("Covid-Application")),
      body: dataFetched
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                     EdgeInsets.only(left: 15, top:15,right:15 ,bottom:15), 
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: ((MediaQuery.of(context).size.height)-
                                     (MediaQuery.of(context).padding.top)-
                                     (kToolbarHeight)-
                                     (kBottomNavigationBarHeight))*
                                0.30,
                            child: Row(
                              children: [
                                active != null
                                    ? Container(
                                      width:250,
                                      child: PieChart(
                                        PieChartData(
                                          startDegreeOffset: 10,
                                          sectionSpace: 0,
                                          centerSpaceRadius: 45,
                                          borderData:
                                              F1BorderData(show: false),
                                          sections: [
                                            PieChartSectionData(
                                              showTitle: false,
                                              value: double.parse(active),
                                              color: Color.fromRGBO(25, 49, 103, 1),
                                              title: "Active",
                                            ),
                                            PieChartSectionData(
                                              showTitle: false,
                                              title: "Recovered"
                                              color: Theme.of(context).primaryColor,
                                              value: double.parse(recovered),
                                            ),
                                            PieChartSectionData(
                                              showTitle: false,
                                              title: "Deaths",
                                              color: Color.fromRGBO(
                                                255, 77, 77, 1),
                                              value:double.parse(active),
                                            ),
                                          ],    
                                        ),
                                      ),
                                    )
                                  : new Center(
                                    child: new CircularProgressIndicator()),
                              Container(
                                margin: EdgeInsets.fromLTRB(30,0,0,10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                         CrossAxisAlignment.start,
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
                                            color: Theme.of(context)
                                                   .primaryColor,
                                          ),
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
                                          color: 
                                              Theme.of(context).primaryColor,
                                          height: 20,
                                          width: 20,    
                                        ),
                                        Text(
                                          "Recovered",
                                          style : TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ), 
                            ],
                          ), 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                height: ((MediaQuery.of(context).size.height)-
                         (MediaQuery.of(context).padding.top)-
                         (kToolbarHeight)-
                         (kBottomNavigationBarHeight))*
                        0.19,
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
                          Text("Confirmed",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                                fontSize: 17)),
                          cases!=null
                          ? Text(
                            confirm,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Text("0")
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Active",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                          fontSize: 17)),
                    active!= null
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
                (MediaQuery.of(context).padding.top)-
                (kToolbarHeight)-
                (kBottomNavigationBarHeight))*
            0.19,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                color: Color.fromRGBO(230, 230, 230, 1),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Recovered",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                          fontSize: 17)),
                    recovered != null
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
                elevation: 5,
                color: Color.fromRGBO(230, 230, 230, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Deaths",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                          fontSize: 17)),
                    deaths != null
                        ? Text(
                            deaths,
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
      Container(
        height: ((MediaQuery.of(context).size.height)-
                 (MediaQuery.of(context).padding.top))-
                 (kToolbarHeight)-
                 (kBottomNavigationBarHeight)*
            0.19,
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
                    Text("Today Cases",
                        style : TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).primaryColor,
                            fontSize: 17)),
                    todayCases != null
                        ? Text(
                            todayCases,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Text("0")  
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
                    Text("Today Deaths",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                          fontSize: 17)),
                    todayDeaths != null
                        ? Text(
                            todayDeaths,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            )
                          )
                        : Text("0")  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        //We'll Continue here by tomorrow
      )
      )
              ),
            ],
          )
    )
  }

}
