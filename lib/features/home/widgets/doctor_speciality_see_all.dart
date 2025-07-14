import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Text("Doctor Speciality", style: TextStyles.font18DarkBlueBold),
        Spacer(),
        Text("See All", style: TextStyles.font13BlueSemiBold),
      ],
    );
  }
}
