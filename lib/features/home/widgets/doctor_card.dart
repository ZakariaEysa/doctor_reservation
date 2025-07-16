import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctorModel});
  final Doctors? doctorModel;

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(doctorModel?.name ?? "", style: TextStyles.font18DarkBlueBold),
            verticalSpace(3),
            Text(
              (doctorModel?.price?.toString() ?? '') +
                  (doctorModel?.degree.toString() ?? ''),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyles.font13GrayRegular,
              textAlign: TextAlign.start,
            ),
            Text(
              doctorModel?.email ?? "",
              style: TextStyles.font13GrayRegular,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
