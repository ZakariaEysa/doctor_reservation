import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_state.dart';
import 'package:doctor_reservation/features/home/widgets/doctor/doctors_shimmer_loading.dart';
import 'package:doctor_reservation/features/home/widgets/speciality/speciality_list_view.dart';
import 'package:doctor_reservation/features/home/widgets/speciality/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsError: (error) =>
              Center(child: Text(error.errors ?? '')),
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializationsDataList) {
            return Column(
              children: [
                SpecialityListView(
                  specializationsList: specializationsDataList ?? [],
                ),
                const SizedBox(height: 8),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          SpecialityShimmerLoading(),
          const SizedBox(height: 8),
          DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
