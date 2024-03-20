import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/loaders/shimmer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../personalizations/controllers/user_controller.dart';

class THomePageAppBar extends StatelessWidget {
  const THomePageAppBar({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: TSizes.appBarHeight / 2),
          Text(
            TTexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const TShimmerEffect(width: 100, height: 20);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
