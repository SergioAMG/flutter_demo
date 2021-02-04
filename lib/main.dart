import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './widgets/add_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Administrador de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                fontSize: 15,
                fontFamily: 'Raleway',
                color: Colors.grey.shade600,
              ),
            ),
        // appBarTheme: AppBarTheme(
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //         headline6: TextStyle(
        //           fontSize: 20,
        //           fontFamily: 'Raleway',
        //         ),
        //       ),
        // ),
      ),
      home: MyHomePage(title: 'Administrador de Gastos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = [
    Transaction(
        id: DateTime.now().toUtc().toString(),
        title: 'Comida en Restaurante',
        amount: 29.99,
        date: DateTime.now()),
    Transaction(
      id: DateTime.now().toUtc().toString(),
      title: 'Hopedaje en Hotel',
      amount: 38.989,
      date: DateTime.now().subtract(
        Duration(days: 6),
      ),
    ),
  ];

  List<Transaction> get _filteredTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTransaction = Transaction(
      id: selectedDate.toUtc().toString(),
      title: title,
      amount: amount,
      date: selectedDate,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    print('Transaction created with id : ${newTransaction.id}');
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      _transactions.remove(transaction);
    });

    print('Transaction deleted with id : ${transaction.id}');
  }

  void _clearTransactions() {
    setState(() {
      _transactions.clear();
    });

    print('Transactions cleared.');
  }

  void _openAddTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: AddTransaction(
              addNewTransaction: _addNewTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).bottomAppBarTheme.color),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: _clearTransactions,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddTransaction(context),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Bienvenido a sus Gastos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).textTheme.headline6.color),
                ),
              ),
              Chart(
                recentTransactions: _filteredTransactions,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Text('Ultimas entradas:',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 15, 0),
                    child: Text(
                        DateFormat('dd/MMM/yyyy').format(DateTime.now()),
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TransactionList(
                  transactions: _filteredTransactions,
                  deleteTransaction: _deleteTransaction,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddTransaction(context),
      ),
    );
  }
}
