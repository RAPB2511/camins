import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const TagChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppStyles.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppStyles.green, size: 16),
          AppStyles.smallSeparator,
          Text(
            label,
            style: TextStyle(
              color: AppStyles.green,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
