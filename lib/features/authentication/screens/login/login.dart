import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/login_social_buttons.dart';
import '../../../../common/widgets/login_signup/loginform_divider.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // LOGO, TITLE, SUBTITLE
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwItems * 1.5),

              // Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
