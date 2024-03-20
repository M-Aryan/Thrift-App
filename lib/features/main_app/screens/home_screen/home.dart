import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../personalizations/controllers/user_controller.dart';
import 'widgets/clipath.dart';
import 'widgets/chart.dart';
import 'widgets/monthy_insights.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// fl_chart_app/presentation/resources/app_resources.dart

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App Bar, Daily Insights
            AppbarAndDailyInsightsClip(controller: controller),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Weekly Spendings
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace / 2),
              child: TSectionHeading(
                title: 'Weekly Spendings',
                showActionButton: false,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Vizual Chart
            const LineChart(),

            const SizedBox(height: TSizes.spaceBtwSections * 0.85),

            /// Monthly Statistics
            // Heading
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace / 2),
              child: TSectionHeading(
                title: 'Monthly Statistics',
                showActionButton: false,
              ),
            ),

            // Visualization Cards
            MonthlyInsights(dark: dark),
          ],
        ),
      ),
    );
  }
}
