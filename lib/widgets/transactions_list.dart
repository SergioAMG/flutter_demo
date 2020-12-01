import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Card(
              elevation: 10,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.green,
                      ),
                    ),
                    child: Text(
                      '\$' + transactions[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          DateFormat().format(transactions[index].date),
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.orange.shade600),
                        ),
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
      ),
    );
  }
}
