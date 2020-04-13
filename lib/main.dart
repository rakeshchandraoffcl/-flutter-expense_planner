import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/add_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.0)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'OpenSans', fontSize: 20.0),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 70.0, date: DateTime.now()),
    // Transaction(id: 't2', title: 'T-shirt', amount: 50.0, date: DateTime.now()),
    // Transaction(
    //     id: 't3', title: 'Groceries', amount: 70.0, date: DateTime.now())
  ];

  void _addTransaction({@required title, @required amount}) {
    setState(() {
      _transactions.add(Transaction(
          amount: amount,
          title: title,
          id: UniqueKey().toString(),
          date: DateTime.now()));
    });
  }

  void _showTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddTransaction(addTransaction: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _showTransactionModal(context);
              })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _showTransactionModal(context);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("CHART"),
                elevation: 5.0,
              ),
            ),
            TransactionList(
              transactions: _transactions,
            )
          ],
        ),
      ),
    );
  }
}
