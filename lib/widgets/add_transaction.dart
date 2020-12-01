import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final transactionDescriptionController = TextEditingController();
  final transactionAmountController = TextEditingController();
  final Function addNewTransaction;

  AddTransaction({this.addNewTransaction});

  void submitForm() {
    final amount = double.parse(transactionAmountController.text);

    if (transactionDescriptionController.text.isEmpty || amount < 1) return;
    addNewTransaction(
      transactionDescriptionController.text,
      amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Monto', labelStyle: TextStyle(color: Colors.black)),
            controller: transactionAmountController,
            keyboardType: TextInputType.number,
            // For iOS: TextInputType.numberWithOptions(decimal:true)
            onSubmitted: (_) => submitForm(),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Descripcion del Gasto',
                labelStyle: TextStyle(color: Colors.black)),
            controller: transactionDescriptionController,
            onSubmitted: (_) => submitForm(),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                onPressed: submitForm,
                child: Text('Añadir Gasto'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
