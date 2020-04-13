import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;
  AddTransaction({@required this.addTransaction});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void onSubmit() {
    final String title = titleController.text;
    final double amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addTransaction(title: title, amount: amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => onSubmit(),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              onPressed: onSubmit,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
