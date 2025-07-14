import 'package:doctor_reservation/core/theming/colors.dart';
import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, itemIndex) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: itemIndex == 0 ? 0 : 24.w,
            ),
            child: Column(
              children: [
                // itemIndex == selectedIndex
                //     ? Container(
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: ColorsManager.darkBlue,
                //           ),
                //           shape: BoxShape.circle,
                //         ),
                //         child: CircleAvatar(
                //           radius: 28,
                //           backgroundColor: ColorsManager.lightBlue,
                //           child: SvgPicture.asset(
                //             'assets/svgs/general_speciality.svg',
                //             height: 42.h,
                //             width: 42.w,
                //           ),
                //         ),
                //       )
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    'assets/images/speciality_doctor.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                Text("Speciality", style: TextStyles.font13DarkBlueRegular),
              ],
            ),
          );
        },
      ),
    );
  }
}
