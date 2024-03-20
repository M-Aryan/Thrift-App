import 'package:flutter/material.dart';

import '../../../../../utils/constants/texts.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium);
  }
}
