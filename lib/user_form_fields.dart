import 'package:first_app/transaction_list.dart';
import 'package:flutter/material.dart';

import 'Transaction.dart';

class UserFormFields extends StatefulWidget {
  UserFormFields(
      {Key? key, required this.transactions, required this.height_of_device})
      : super(key: key);
  List transactions = [];
  double height_of_device = 0.0;

  @override
  State<UserFormFields> createState() => _UserFormFieldsState();
}

class _UserFormFieldsState extends State<UserFormFields> {
  final item_title_controller = TextEditingController();
  final item_amount_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: widget.height_of_device / (widget.height_of_device / 182),
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.purple,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
      ),
      Column(children: [
        Container(
          margin: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Title of Item',
              filled: true,
              fillColor: Colors.white,
            ),
            controller: item_title_controller,
          ),
        ),
        Container(
            margin: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Amount of Item',
                filled: true,
                fillColor: Colors.white,
              ),
              controller: item_amount_controller,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  // widget.transactions = widget.transactions;
                  widget.transactions.add(Transaction(
                    id: item_title_controller.text,
                    title: item_title_controller.text,
                    amount: double.parse(item_amount_controller.text),
                    date: DateTime.now(),
                  ));
                  print(widget.transactions);
                });
              },
              child: const Text('Add Expense'),
            ),
          ),
        ]),
        SizedBox(
          height: widget.height_of_device / 2.2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TransactionList(userTransactions: widget.transactions)
              ],
            ),
          ),
        )
      ]),
    ]);
  }
}
