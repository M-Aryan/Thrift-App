import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class PaymentsScreenHead extends StatelessWidget {
  const PaymentsScreenHead({
    super.key,
    required this.dark,
    required this.pageTitle,
    required this.paymentCardTitle,
    required this.paymentCardAmount,
  });

  final bool dark;
  final String pageTitle;
  final String paymentCardTitle;
  final String paymentCardAmount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Extended App Bar
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ],
        ),

        // Heading
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: TSizes.defaultSpace * 2, left: TSizes.defaultSpace / 2),
              child: Text(
                pageTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),

        // Annual Payments Card
        Positioned(
          top: 120,
          left: (THelperFunction.screenWidth() / 2) - 150, // Why 150? --> Container's width * 0.5
          child: Container(
            height: 160,
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 87, 55, 151),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.deepPurpleAccent.shade200),
              boxShadow: [
                BoxShadow(
                  color: dark ? TColors.darkGrey.withOpacity(0.1) : Colors.deepPurple.shade400.withOpacity(0.4),
                  offset: const Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: 6,
                ),
              ],
            ),

            // Annual Payment Amount Card Content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),

                // Heading and Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentCardTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Iconsax.mirroring_screen,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),

                // Amount
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        paymentCardAmount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 40),
                // Note
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Thrift: Spendings Tracking Buddy',
                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
