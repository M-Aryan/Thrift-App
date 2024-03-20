import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import 'reset_password.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            // Textfield
            TextFormField(
              decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(TTexts.submitButton)))
          ],
        ),
      ),
    );
  }
}
