import 'package:flutter/material.dart';


import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(image: AssetImage(TImages.googleLogo), width: TSizes.iconMd, height: TSizes.iconMd),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems * 3,
          height: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(image: AssetImage(TImages.facebookLogo), width: TSizes.iconMd, height: TSizes.iconMd),
          ),
        )
      ],
    );
  }
}
