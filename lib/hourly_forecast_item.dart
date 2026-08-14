import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,

      child: Container(
        width: 100,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            
              const SizedBox(height: 8),
              Icon(icon, size: 40),
              const SizedBox(height: 8),

              Text(temperature, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}