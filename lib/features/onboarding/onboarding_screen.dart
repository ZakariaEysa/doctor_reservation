import 'package:doctor_reservation/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:doctor_reservation/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_reservation/features/onboarding/widgets/logo_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                LogoAndTitle(),
                SizedBox(height: 30.h),
                DoctorImageAndText(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style: TextStyles.font13GrayRegular,
                      ),
                      SizedBox(height: 30.h),
                      GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
