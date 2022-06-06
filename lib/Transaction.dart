class Transaction {
  String id = '';
  String title = '';
  double amount = 0.0;
  DateTime date = DateTime.now();

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
