import 'package:flutter/material.dart';

import '../../logic/cubit/register_cubit.dart';

enum Gender { male, female }

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
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
        _genderOption(icon: Icons.male, label: 'Male', value: Gender.male),
        const SizedBox(width: 20),
        _genderOption(
          icon: Icons.female,
          label: 'Female',
          value: Gender.female,
        ),
      ],
    );
  }

  Widget _genderOption({
    required IconData icon,
    required String label,
    required Gender value,
  }) {
    final bool isSelected = selectedGender == value;

    return GestureDetector(
      onTap: () => onGenderChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
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
