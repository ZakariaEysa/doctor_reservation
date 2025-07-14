import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.w,
              child: Text(
                "Hi Zakaria ",
                style: TextStyles.font18DarkBlueBold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            verticalSpace(3),
            Text("Welcome back", style: TextStyles.font13GrayRegular),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundColor: ColorsManager.moreLighterGray,
              child: SvgPicture.asset("assets/svgs/Notification.svg"),
            ),
          ],
        ),
      ],
    );
  }
}
