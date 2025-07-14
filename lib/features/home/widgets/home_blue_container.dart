import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBlueContainer extends StatelessWidget {
  const HomeBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_blue_container.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font12BlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            top: 0,
            child: Image.asset(
              'assets/images/blue_card_doctor.png',
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
