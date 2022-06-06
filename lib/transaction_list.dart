import 'package:flutter/material.dart';
import 'Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key? key, required this.userTransactions}) : super(key: key);
  List userTransactions = [];

  @override
  State<TransactionList> createState() => TransactionListState();
}

class TransactionListState extends State<TransactionList> {
  TransactionListState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.userTransactions.map((e) {
        return Card(
          margin: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(20.0),
                child: Text(e.amount.toString(),
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    Text(DateFormat.yMMMMd('en_US').format(e.date)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.userTransactions.remove(e);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
