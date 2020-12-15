import 'package:flutter/widgets.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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

      print('DayOfWeek:' + DateFormat.E().format(weekDay).toString());
      print('Amount:' + totalSumAmount.toString());

      return {
        'day': DateFormat.E().format(weekDay).toString(),
        'amount': totalSumAmount.toString(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Container(
      child: SizedBox(
        height: 150,
        width: double.infinity,
      ),
    );
  }
}
