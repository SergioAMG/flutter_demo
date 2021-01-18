import 'package:flutter/widgets.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final DateTime weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      double totalSumAmount = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSumAmount += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).toString(),
        'amount': totalSumAmount.toString(),
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.00, (previousValue, element) {
      return previousValue + double.parse(element['amount']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions.map((element) {
          return ChartBar(
            label: element['day'].toString(),
            spendingAmount: double.parse(element['amount']),
            spendingPercentageOfTotal: totalSpending == 0.00
                ? 0.00
                : (double.parse(element['amount']) / totalSpending),
            isToday: element['day'].toString() ==
                    DateFormat.E().format(DateTime.now()).toString()
                ? true
                : false,
          );
        }).toList(),
      ),
    );
  }
}
