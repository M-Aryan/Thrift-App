import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'features/main_app/screens/payment_history/credit_payment.dart';
import 'features/main_app/screens/payment_history/debit_payment.dart';
import 'features/main_app/screens/home_screen/home.dart';
import 'features/personalizations/screens/profile_screen/profile.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(

            //PROPERTIES
            height: 80,
            elevation: 0,

            // set the index for destination
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,

            // theme
            backgroundColor: Colors.transparent,
            // indicatorColor: darkMode ? Colors.white.withOpacity(0.2) : TColors.black.withOpacity(0.2),

            // icons & labels
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.money_send),
                label: 'Debit',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.money_recive),
                label: 'Credit',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.profile_circle),
                label: 'Profile',
              ),
            ]),
      ),

      // change screen for body
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const DebitPayments(),
    const CreditPayments(),
    const ProfileScreen(),
  ];
}
