import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/sizes.dart';

class THomeScreenTile extends StatelessWidget {
  const THomeScreenTile({
    super.key,
    required this.heading,
    this.icon,
    this.iconColor,
    required this.amount,
    required this.tileColor,
  });

  final String heading;
  final IconData? icon;
  final Color? iconColor;
  final String amount;
  final Color tileColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 165,
      child: Card(
        color: tileColor,
        elevation: 0,
        child: Stack(
          children: [
            // Tile Heading
            Positioned(
              top: 15,
              left: 15,
              child: Text(
                heading,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: TSizes.fontSizeSm,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Icon
            Positioned(
              top: 10,
              right: 15,
              child: TCircularContainer(
                height: 25,
                width: 25,
                backgroundColor: Colors.transparent,
                child: Icon(
                  size: 30,
                  icon,
                  color: iconColor,
                ),
              ),
            ),

            // Amount
            Positioned(
              top: 55,
              left: 15,
              child: Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
