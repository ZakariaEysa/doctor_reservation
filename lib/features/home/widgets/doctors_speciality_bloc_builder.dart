import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_state.dart';
import 'package:doctor_reservation/features/home/widgets/doctor_card_list_view.dart';
import 'package:doctor_reservation/features/home/widgets/doctor_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsSection extends StatelessWidget {
  const SpecializationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          specializationsError: (error) =>
              Center(child: Text(error.errors ?? '')),
          specializationsLoading: () =>
              Center(child: const CircularProgressIndicator()),
          specializationsSuccess: (specializationsDataList) {
            final List<Doctors?> doctorsList =
                (specializationsDataList?.isNotEmpty ?? false)
                ? specializationsDataList![0]?.doctorsList ?? []
                : [];

            return Expanded(
              child: Column(
                children: [
                  DoctorSpecialityListView(
                    specializationsList: specializationsDataList ?? [],
                  ),
                  const SizedBox(height: 8),
                  DoctorCardListView(doctorsList: doctorsList),
                ],
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
