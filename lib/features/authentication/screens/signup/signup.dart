import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/login_social_buttons.dart';
import '../../../../common/widgets/login_signup/loginform_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'widget/signup_form.dart';
import 'widget/signup_title.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const SignUpTitle(),
              const SizedBox(height: TSizes.spaceBtwItems * 1.5),

              // Form
              SignUpForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwItems * 1.5),

              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems * 1.5),

              // Social Buttons
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
