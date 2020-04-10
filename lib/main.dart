import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 100.0, date: DateTime.now()),
    Transaction(id: 't2', title: 'T-shirt', amount: 50.0, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Groceries', amount: 70.0, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("CHART"),
              elevation: 5.0,
            ),
          ),
          Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transactions.map((Transaction tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.purple
                      )
                    ),
                    child: Text(tx.amount.toString(),
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tx.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0
                      ),
                      ),
                      Text(tx.date.toString(),
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
