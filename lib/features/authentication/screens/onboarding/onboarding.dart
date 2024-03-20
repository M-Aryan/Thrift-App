import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImageOne,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImageTwo,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImageThree,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubtitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
