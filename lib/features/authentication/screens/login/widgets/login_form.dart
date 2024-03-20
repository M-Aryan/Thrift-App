import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helpers/helper_function.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunction.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.verifyPassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 4),

            // Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Forget Password Text Button
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(
                    TTexts.forgetPassword,
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Sign-In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: Text(
                  TTexts.createAccount,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 3),
          ],
        ),
      ),
    );
  }
}
