import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Solat(),
  ));
}



class Solat extends StatefulWidget {
  @override
  WaktuSolat createState() => WaktuSolat();
}

class WaktuSolat extends State<Solat> {
 final _widgetOptions = [
   Text('Index 0: Home'),
 ];


  final String url = "http://api.azanpro.com/times/today.json?zone=ngs02&format=12-hour";
  Map<String, dynamic> data ;


  Future<String> getSData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["prayer_times"];
    });

    return "Success!";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waktu Solat Seremban/PD/Rembau"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Tarikh Hari Ini: "),
                            Text(data["date"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black87)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Subuh: "),
                            Text(data["subuh"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Zohor: "),
                            Text(data["zohor"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Asar: "),
                            Text(data["asar"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Maghrib: "),
                            Text(data["maghrib"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Isyak: "),
                            Text(data["isyak"],
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.red)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  void initState() {
    super.initState();
    this.getSData();
  }
}

