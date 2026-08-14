import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

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
                "3.00",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Icon(Icons.cloud, size: 40),
              const SizedBox(height: 8),

              Text("32.2", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}