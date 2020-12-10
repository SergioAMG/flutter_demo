import 'package:flutter/material.dart';
import './widgets/transactions_list.dart';
import './widgets/add_transaction.dart';
import './models/transaction.dart';

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
              ),
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

  void _openAddTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (_) {
          return AddTransaction(
            addNewTransaction: _addNewTransaction,
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
            icon: Icon(Icons.admin_panel_settings_sharp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddTransaction(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'Bienvenido a sus Gastos',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              width: double.infinity,
              height: 130,
              color: Theme.of(context).secondaryHeaderColor,
              child: Text(''),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Text('Ultimas entradas:',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 15, 0),
                  child: Text('08/12/2020',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              height: 350,
              child: TransactionList(
                transactions: transactions,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddTransaction(context),
      ),
    );
  }
}
