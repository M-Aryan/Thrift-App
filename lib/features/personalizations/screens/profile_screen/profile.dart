import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/popups/popup_controller.dart';
import '../../../../utils/constants/threshold.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../common/widgets/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../controllers/user_controller.dart';
import 'widgets/profile_menu.dart';
import 'widgets/threshold_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: dark ? Colors.deepPurple.withOpacity(1) : Colors.deepPurple.shade400.withOpacity(0.4),
        centerTitle: false,
        backgroundColor: TColors.primary,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: 10),
          child: Column(
            children: [
              // Details

              // Profile Information
              const SizedBox(height: TSizes.spaceBtwItems / 1.5),
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Name & Username
              TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () {}),
              TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              Divider(
                color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Personal Information
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () {}),
              TProfileMenu(title: 'Contact', value: controller.user.value.phoneNumber, onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              Divider(
                color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Threshold
              const TSectionHeading(title: 'Threshold', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TThresholdMenu(
                title: 'Amount',
                value: TThreshold.threshold.toString(),
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              Divider(
                color: dark ? Colors.grey.withOpacity(0.3) : Colors.deepPurple.withOpacity(0.3),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: TSizes.buttonWidth * 1.2,
                    child: OutlinedButton(
                      onPressed: () {
                        TPopupController.instance.deleteDataWarningPopUp();
                      },
                      child: Text(
                        'Delete Data',
                        style: TextStyle(color: Colors.redAccent.shade700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: TSizes.buttonWidth * 1.2,
                    child: ElevatedButton(
                      onPressed: () {
                        UserController.instance.signOutWarningPopup();
                      },
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
