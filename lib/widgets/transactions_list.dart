import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            elevation: 10,
            child: Row(
              children: <Widget>[
                Container(
                  width: 110,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '\$' + transactions[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(DateFormat().format(transactions[index].date),
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
