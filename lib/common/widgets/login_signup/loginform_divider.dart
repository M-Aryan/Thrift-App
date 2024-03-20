import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_function.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child:
                Divider(color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3), thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child:
                Divider(color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3), thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}
