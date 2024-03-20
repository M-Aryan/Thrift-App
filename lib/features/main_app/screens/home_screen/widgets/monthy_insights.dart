import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thrift/local_storage/sqflite_local/database_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import 'home_screen_tiles.dart';

class MonthlyInsights extends StatelessWidget {
  const MonthlyInsights({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace / 2),
      child: SizedBox(
        height: 140,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Average Transaction Amount
                Obx(
                  () => THomeScreenTile(
                    heading: 'Avg. Transaction',
                    amount: TransactionController.instance.averageMonthTransaction.value.toInt().toString(),
                    tileColor: dark ? Colors.deepPurple.withOpacity(0.5) : Colors.deepPurple.withOpacity(0.9),
                  ),
                ),

                // Payments Sent
                Obx(
                  () => THomeScreenTile(
                    heading: 'No. of Outgoing',
                    amount: TransactionController.instance.totalDebitNoInMonth.value.toInt().toString(),
                    tileColor: dark ? Colors.deepPurple.withOpacity(0.5) : Colors.deepPurple.withOpacity(0.9),
                  ),
                ),

                // Total Income
                Obx(
                  () => THomeScreenTile(
                    heading: 'No. of Incoming',
                    amount: TransactionController.instance.totalCreditNoInMonth.value.toInt().toString(),
                    tileColor: dark ? Colors.deepPurple.withOpacity(0.5) : Colors.deepPurple.withOpacity(0.9),
                  ),
                ),

                // Money Sent
                Obx(
                  () => THomeScreenTile(
                    heading: 'Money Sent',
                    amount: TransactionController.instance.totalDebitAmountMonth.value.toInt().toString(),
                    tileColor: dark ? Colors.deepPurple.withOpacity(0.5) : Colors.deepPurple.withOpacity(0.9),
                  ),
                ),

                // Money Received
                Obx(
                  () => THomeScreenTile(
                    heading: 'Money Received',
                    amount: TransactionController.instance.totalCreditAmountMonth.value.toInt().toString(),
                    tileColor: dark ? Colors.deepPurple.withOpacity(0.5) : Colors.deepPurple.withOpacity(0.9),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
