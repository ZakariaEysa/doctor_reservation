// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_reservation/features/home/widgets/speciality/speciality_list_view_item.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({Key? key, required this.specializationsList})
    : super(key: key);
  final List<SpecializationsData?>? specializationsList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsList?.length,
        itemBuilder: (context, itemIndex) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationsList?[itemIndex]?.id,
              );
            },
            child: SpecialityListViewItem(
              specializationModel: widget.specializationsList?[itemIndex],
              itemIndex: itemIndex,
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
