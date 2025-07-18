import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_state.dart';
import 'package:doctor_reservation/features/home/widgets/doctor/doctor_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsError: (error) => Center(child: Text(error.errors ?? '')),

          doctorsSuccess: (doctorList) {
            return DoctorCardListView(doctorsList: doctorList ?? []);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
