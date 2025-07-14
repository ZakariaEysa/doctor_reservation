import 'package:doctor_reservation/features/home/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: DoctorCard(),
          );
        },
      ),
    );
  }
}
