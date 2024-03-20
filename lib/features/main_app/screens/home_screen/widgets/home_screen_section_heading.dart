import 'package:flutter/material.dart';

import '../../../../../common/widgets/section_heading.dart';

class TDailyInsightsHeading extends StatelessWidget {
  const TDailyInsightsHeading({
    super.key,
    this.title = 'Today\'s Insights',
    this.textColor = Colors.white,
  });

  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 195, top: 10),
      child: TSectionHeading(
        title: title,
        showActionButton: false,
        textColor: textColor,
      ),
    );
  }
}
