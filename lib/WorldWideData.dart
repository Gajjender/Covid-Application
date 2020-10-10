

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
              crossAxisAlignment= CrossAxisAlignment.start,
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
                                              title: active,
                                            ),
                                            //We'll Start here by tomorrow 
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
          )
    )
  }

}