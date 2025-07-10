import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

void errorDialog(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(Icons.error, color: Colors.red, size: 32),
      content: Text(error, style: TextStyles.font15DarkBlueMedium),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Got it', style: TextStyles.font14BlueSemiBold),
        ),
      ],
    ),
  );
}

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(color: ColorsManager.mainBlue),
    ),
  );
}
