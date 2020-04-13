import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No expenses added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 200.0,
                    child: Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ))
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).primaryColor)),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
