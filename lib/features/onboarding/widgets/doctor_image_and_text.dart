import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/svgs/docdoc_logo_with_opacity.svg"),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
            ),
          ),

          child: Image.asset("assets/images/onboarding_doctor.png"),
        ),
        Positioned(
          bottom: 20,

          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            "Best Doctor \nAppointment App",
            style: TextStyles.font32BlueBold.copyWith(height: 1.3),
          ),
        ),
      ],
    );
  }
}
