import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    // fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    // fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBlue,
  );
  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    // fontWeight: FontWeightHelper.bold,
    color: ColorsManager.grey,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    // fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
}
