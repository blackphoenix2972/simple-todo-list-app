/// Vertical bar chart with bar label renderer example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:first_app/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VerticalBarLabelChart extends StatelessWidget {
  final List<Transaction> data;

  VerticalBarLabelChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Transaction, String>> series = [
      charts.Series(
        id: 'Transaction',
        data: data,
        domainFn: (Transaction transaction, _) =>
            DateFormat.yMMMMd('en_US').format(transaction.date),
        measureFn: (Transaction transaction, _) => transaction.amount,
        // labelAccessorFn: (OrdinalSales sales, _) => '${sales.sales}',
      )
    ];
    return charts.BarChart(series);
  }
}
