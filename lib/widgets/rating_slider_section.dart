import 'package:flutter/material.dart';

class RatingSliderSection extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;
  final Color color;

  const RatingSliderSection({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
        Slider(
          value: value,
          min: 1,
          max: 5,
          divisions: 4,
          label: "${value.toInt()}/5",
          onChanged: onChanged,
        ),
      ],
    );
  }
}
