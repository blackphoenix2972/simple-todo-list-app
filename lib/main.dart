import 'package:flutter/material.dart';
import './Charts.dart';
import './Transaction.dart';
import 'dart:io';
import './transaction_list.dart';
import './user_form_fields.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 29.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'New Shoeds',
        amount: 69.99,
        date: DateTime.utc(1999, 11, 9)),
    Transaction(
        id: 't3',
        title: 'New Shoeds',
        amount: 69.99,
        date: DateTime.utc(1999, 11, 9)),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final ScrollController controller = ScrollController();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('To do List'),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   width: MediaQuery.of(context).size.width * 0.5,
                //   child: VerticalBarLabelChart(
                //     transactions,
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                UserFormFields(
                  height_of_device: MediaQuery.of(context).size.height * 0.8,
                  transactions: transactions,
                ),
              ]),
            )),
      ),
    );
  }
}
