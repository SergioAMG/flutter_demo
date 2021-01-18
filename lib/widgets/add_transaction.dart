import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddTransaction({this.addNewTransaction});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _transactionDescriptionController = TextEditingController();
  final _transactionAmountController = TextEditingController();
  DateTime _userSelectedDate;

  void _submitForm() {
    if (_transactionAmountController.text.isEmpty) return;

    final _amount = double.parse(_transactionAmountController.text);

    if (_transactionDescriptionController.text.isEmpty ||
        _amount < 1 ||
        _userSelectedDate == null) return;

    widget.addNewTransaction(
      _transactionDescriptionController.text,
      _amount,
      _userSelectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _userSelectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Monto',
                labelStyle: TextStyle(
                    color: Colors.black, fontFamily: 'Raleway', fontSize: 15),
                hintText: '0.00'),
            controller: _transactionAmountController,
            keyboardType: TextInputType.number,
            // For iOS: TextInputType.numberWithOptions(decimal:true)
            //onSubmitted: (_) => submitForm(),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Descripcion del Gasto',
                labelStyle: TextStyle(
                    color: Colors.black, fontFamily: 'Raleway', fontSize: 15),
                hintText: 'Texto ...'),
            controller: _transactionDescriptionController,
            keyboardType: TextInputType.text,
            //onSubmitted: (_) => submitForm(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Text(
                  _userSelectedDate == null
                      ? 'Seleccione la Fecha ...'
                      : 'Fecha Seleccionada: ${DateFormat('dd/MMM/yyyy').format(_userSelectedDate)}',
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Colors.amber.shade700,
                    onPressed: _presentDatePicker),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: _submitForm,
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
