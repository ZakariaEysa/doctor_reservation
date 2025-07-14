import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 110.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage("assets/images/hisoka.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        horizontalSpace(16),
        Column(
          children: [
            Text("Dr. Randy Wigham", style: TextStyles.font18DarkBlueBold),
            verticalSpace(3),
            Text("General Practitioner", style: TextStyles.font13GrayRegular),
            Text("zakariaeysa@gmail.com", style: TextStyles.font13GrayRegular),
          ],
        ),
      ],
    );
  }
}
