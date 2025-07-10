import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/register_cubit.dart';

enum Gender { male, female }

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  Gender selectedGender = Gender.male;

  void onGenderChanged(Gender newGender) {
    setState(() {
      selectedGender = newGender;
      RegisterCubit.get(context).gender = (newGender == Gender.male) ? 0 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGenderOption(
          icon: Icons.male,
          label: 'Male',
          value: Gender.male,
        ),
        SizedBox(width: 20.w),
        _buildGenderOption(
          icon: Icons.female,
          label: 'Female',
          value: Gender.female,
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required IconData icon,
    required String label,
    required Gender value,
  }) {
    final bool isSelected = selectedGender == value;

    return GestureDetector(
      key: ValueKey(label),
      onTap: () => onGenderChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade400,
            width: 1.5.w,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? Colors.blue : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
