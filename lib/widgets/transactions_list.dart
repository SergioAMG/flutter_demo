import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return (transactions.isEmpty)
        ? Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'No hay gastos aun',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              (MediaQuery.of(context).size.height > 800)
                  ? Container(
                      height: 400,
                      child: Image.asset(
                        'assets/images/mobileappconcept.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      height: 300,
                      child: Image.asset(
                        'assets/images/mobileappconcept.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
            ],
          )
        : Column(
            children: transactions.map((transaction) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
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
                            '\$' + transaction.amount.toStringAsFixed(2),
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
                            SizedBox(
                              width: 250,
                              child: Text(
                                transaction.title,
                                style: Theme.of(context).textTheme.bodyText1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(DateFormat().format(transaction.date),
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}
