import 'package:flutter/material.dart';


class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.radius = 100,
    this.customPadding = 0,
    this.child,
    required this.backgroundColor,
  });

  final double? width;
  final double? height;
  final double radius;
  final double customPadding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(customPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
