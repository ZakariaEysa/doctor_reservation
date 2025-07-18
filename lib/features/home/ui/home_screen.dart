import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation/features/home/widgets/doctor/doctor_bloc_builder.dart';
import 'package:doctor_reservation/features/home/widgets/speciality/speciality_bloc_builder.dart';
import 'package:doctor_reservation/features/home/widgets/home_blue_container.dart';
import 'package:doctor_reservation/features/home/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/doctor_speciality_see_all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllSpecialization();
    super.initState();
  }

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
              SpecializationsBlocBuilder(),
              DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
