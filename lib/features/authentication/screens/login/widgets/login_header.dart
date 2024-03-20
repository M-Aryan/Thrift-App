import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_function.dart';


class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Image(
            height: 150,
            image: AssetImage(dark ? TImages.darkappLogo : TImages.lightappLogo),
          ),
        ),
        Text(TTexts.loginScreenTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(TTexts.loginScreenSubtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
