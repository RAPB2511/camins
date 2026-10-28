import 'package:camins/styles/app_styles.dart';
import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color?
  iconColor; // Parámetro opcional para cambiar el color si lo necesitas

  const StatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          // Si no le pasamos color, por defecto usará el verde de AppStyles
          color: iconColor ?? AppStyles.green,
          size: 20,
        ),
        AppStyles.tinySeparator,
        Text(
          value,
          style: TextStyle(
            color: AppStyles.darkText,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(label, style: TextStyle(color: AppStyles.greyText, fontSize: 12)),
      ],
    );
  }
}
