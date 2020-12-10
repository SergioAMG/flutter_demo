import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddTransaction({this.addNewTransaction});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final transactionDescriptionController = TextEditingController();
  final transactionAmountController = TextEditingController();

  void submitForm() {
    final amount = double.parse(transactionAmountController.text);

    if (transactionDescriptionController.text.isEmpty || amount < 1) return;
    widget.addNewTransaction(
      transactionDescriptionController.text,
      amount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Monto',
                  labelStyle: TextStyle(color: Colors.black)),
              controller: transactionAmountController,
              keyboardType: TextInputType.number,
              // For iOS: TextInputType.numberWithOptions(decimal:true)
              //onSubmitted: (_) => submitForm(),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Descripcion del Gasto',
                  labelStyle: TextStyle(color: Colors.black)),
              controller: transactionDescriptionController,
              //onSubmitted: (_) => submitForm(),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).buttonColor,
                  onPressed: submitForm,
                  child: Text('Añadir Gasto'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
