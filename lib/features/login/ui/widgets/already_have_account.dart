import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {

  final String label;
  final String text;
  final Function()? onTap;
  const AlreadyHaveAccountText({
    super.key,
    required this.text,
    required this.onTap, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyles.font13DarkBlueRegular,
          ),

          TextSpan(
            text: text,
            style: TextStyles.font13BlueSemiBold,

            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap!();

                // Single tapped.
              },
          ),
        ],
      ),
    );
  }
}
