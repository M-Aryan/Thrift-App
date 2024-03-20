import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/threshold.dart';
import '../../../../utils/formatters/formatters.dart';
import '../../../../local_storage/sqflite_local/database_controller.dart';
import '../../../../common/widgets/section_heading.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'widgets/payment_history_tile.dart';
import 'widgets/payment_screen_head.dart';

class DebitPayments extends StatelessWidget {
  const DebitPayments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Head
          Obx(
            () => SizedBox(
              height: 320,
              child: PaymentsScreenHead(
                dark: dark,
                pageTitle: 'Debit Payments',
                paymentCardTitle: 'Total Debited',
                paymentCardAmount: TransactionController.instance.totalDebitAmount.value.toInt().toString(),
              ),
            ),
          ),

          // Heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TSectionHeading(title: 'Transaction History', showActionButton: false),
          ),
          const SizedBox(height: TSizes.spaceBtwItems * 0.5),

          // List
          Expanded(
            child: CustomScrollView(
              slivers: [
                Obx(
                  () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final reversedIndex = TransactionController.instance.transactions.length - 1 - index;
                        if (reversedIndex >= 0) {
                          final transaction = TransactionController.instance.transactions[reversedIndex];
                          bool iconAlert = false;
                          if (transaction.amount > TThreshold.threshold) {
                            iconAlert = true;
                          }
                          if (transaction.type == 'debit') {
                            // Transaction Tile
                            return PaymentHistoryTile(
                              header: transaction.header.toString(),
                              paymentDate: TFormatter.formatDate(transaction.dateReceived),
                              transactionAmount: transaction.amount.toString(),
                              amountColor: Colors.redAccent.shade700,
                              iconn: iconAlert ? Iconsax.information : Iconsax.arrow_up_1,
                              iconColor: iconAlert ? TColors.warning : Colors.deepPurpleAccent.shade200,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                        return null;
                      },
                      childCount: TransactionController.instance.transactions.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
