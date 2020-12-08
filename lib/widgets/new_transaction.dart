import 'package:flutter/material.dart';
import 'transactions_list.dart';
import 'add_transaction.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> transactions = [
    Transaction(
        id: 'Trans01',
        title: 'Comida en Restaurante',
        amount: 29.99,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: '001',
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(
          addNewTransaction: _addNewTransaction,
        ),
        Container(
          height: 200,
          child: TransactionList(
            transactions: transactions,
          ),
        ),
      ],
    );
  }
}
