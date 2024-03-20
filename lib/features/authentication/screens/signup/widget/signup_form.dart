import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'terms_and_condition_checkbox.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  controller: controller.name,
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) => TValidator.validateEmptyText('Surname', value),
                  controller: controller.surname,
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwnInputFields),

          /// Username
          TextFormField(
            validator: (value) => TValidator.validateEmptyText('Username', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwnInputFields),

          // Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwnInputFields),

          // Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwnInputFields),

          // Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
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
          const SizedBox(height: TSizes.spaceBtwItems),

          // terms & conditions checkbox
          const TTermsAndConditionsCheckbox(),
          const SizedBox(height: TSizes.spaceBtwItems * 1.5),

          // SIGN UP Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.signUp),
            ),
          )
        ],
      ),
    );
  }
}

