import 'dart:convert';

import 'package:inventory_app/repository/Currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Conversor extends StatefulWidget {
  Conversor({Key key}) : super(key: key);

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  Future<Currency> _data;
  String _base = "USD";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = fetchAPI(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff392850),
        title: Text(
          "Currency Exchange",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                _base = value.toString();
                // Fetching And Updating Data Again,.....
                _data = fetchAPI(http.Client());
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("USD"),
                value: "USD",
              ),
              PopupMenuItem(
                child: Text("EUR"),
                value: "EUR",
              ),
              PopupMenuItem(
                child: Text("AUD"),
                value: "AUD",
              ),
              PopupMenuItem(
                child: Text("CAD"),
                value: "CAD",
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Spacer(),
                Text(
                  "Base $_base",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
                future: _data,
                builder: (context, snapshot) {
                  // CHecking data is available....
                  return snapshot.hasData
                      ? ListView.builder(
                    itemCount: snapshot.data.rates.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RowView(context, snapshot.data.rates[index]);
                    },
                  )
                      : Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
              ))
        ],
      ),
    );
  }

  // Row View....

  @override
  Widget RowView(BuildContext context, MapEntry<String, dynamic> rate) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(
            Icons.monetization_on,
            size: 45,
            color: Color(0xff392850),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rate.key,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    rate.value.toString(),
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<Currency> fetchAPI(http.Client client) async {
    final response =
    await client.get("https://api.exchangeratesapi.io/latest?base=$_base");
    final parsedData = jsonDecode(response.body).cast<String, dynamic>();
    return Currency.createJSON(parsedData);
  }
}
