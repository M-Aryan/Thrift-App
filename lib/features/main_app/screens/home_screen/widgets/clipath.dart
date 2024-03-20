import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thrift/local_storage/sqflite_local/database_controller.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalizations/controllers/user_controller.dart';
import 'home_screen_section_heading.dart';
import 'home_screen_tiles.dart';
import 'homepage_appbar.dart';

class AppbarAndDailyInsightsClip extends StatelessWidget {
  const AppbarAndDailyInsightsClip({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 300,

          // Includes AppBar, Daily Insights Tile & Heading
          child: Stack(
            children: [
              // Top Right Circular Container
              Positioned(
                top: -80,
                right: -125,
                child: TCircularContainer(backgroundColor: TColors.white.withOpacity(0.1), height: 200, width: 200),
              ),

              // Mid Right Circular Container
              Positioned(
                top: 80,
                right: -150,
                child: TCircularContainer(backgroundColor: TColors.white.withOpacity(0.1), height: 200, width: 200),
              ),

              // Bottom Right Circular Container
              Positioned(
                top: 140,
                left: -110,
                child: TCircularContainer(backgroundColor: TColors.white.withOpacity(0.1), height: 200, width: 200),
              ),

              // Bottom Circular Container
              Positioned(
                top: 225,
                left: 50,
                child: TCircularContainer(backgroundColor: TColors.white.withOpacity(0.1), height: 150, width: 150),
              ),

              /// App Bar and Tiles for Per day Credit and Debit
              Column(
                children: [
                  // App Bar
                  THomePageAppBar(controller: controller),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Daily Insights Heading
                  const TDailyInsightsHeading(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Tiles
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Credit Insight Tile
                        Obx(
                          () => THomeScreenTile(
                            heading: 'Credit',
                            icon: Iconsax.arrow_down_2,
                            iconColor: Colors.lightGreenAccent.shade400,
                            amount: TransactionController.instance.totalCreditAmountToday.value.toInt().toString(),
                            tileColor: Colors.black.withOpacity(0.4),
                          ),
                        ),

                        // Debit Insight Tile
                        Obx(
                          () => THomeScreenTile(
                            heading: 'Debit',
                            icon: Iconsax.arrow_up_1,
                            iconColor: Colors.redAccent.shade400,
                            tileColor: Colors.black.withOpacity(0.4),
                            amount: TransactionController.instance.totalDebitAmountToday.value.toInt().toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
