import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/core/theming/colors.dart';
import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.itemIndex,
    required this.selectedIndex,
    this.specializationModel,
  });
  final int itemIndex;
  final int selectedIndex;
  final SpecializationsData? specializationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManager.darkBlue),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: Image.asset(
                      'assets/images/speciality_doctor.png',
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    'assets/images/speciality_doctor.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationModel?.name ?? 'Specialization',
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
