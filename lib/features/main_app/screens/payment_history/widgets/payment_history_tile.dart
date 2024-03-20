import 'package:flutter/material.dart';

class PaymentHistoryTile extends StatelessWidget {
  const PaymentHistoryTile({
    super.key,
    required this.transactionAmount,
    required this.paymentDate,
    required this.amountColor,
    required this.iconn,
    required this.header,
    this.iconColor = const Color.fromRGBO(124, 77, 255, 1),
  });

  final String transactionAmount;
  final String paymentDate;
  final Color amountColor;
  final Color iconColor;
  final IconData iconn;
  final String header;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: Icon(
        iconn,
        color: iconColor,
        size: 40,
      ),

      // Title
      title: Text(
        header,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),

      // date
      subtitle: Text(
        paymentDate,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),

      // Amount of Transaction
      trailing: Text(
        '₹ $transactionAmount',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: amountColor),
      ),
    );
  }
}
