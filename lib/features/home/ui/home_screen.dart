import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/features/home/widgets/doctor_card_list_view.dart';
import 'package:doctor_reservation/features/home/widgets/doctor_speciality_list_view.dart';
import 'package:doctor_reservation/features/home/widgets/home_blue_container.dart';
import 'package:doctor_reservation/features/home/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/doctor_speciality_see_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              HomeTopBar(),
              verticalSpace(20),
              HomeBlueContainer(),
              verticalSpace(24),
              DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              DoctorSpecialityListView(),
              verticalSpace(8),
              DoctorCardListView(),
            ],
          ),
        ),
      ),
    );
  }
}
