import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_reservation/features/home/widgets/doctor/doctor_card_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key, required this.doctorsList});
  final List<Doctors?> doctorsList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: DoctorCardListViewItem(doctorModel: doctorsList[index]),
          );
        },
      ),
    );
  }
}
