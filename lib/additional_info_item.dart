import 'package:flutter/material.dart';


class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
                    Icon(Icons.water_drop, size: 40),
                    const SizedBox(height: 8),
    
                    Text("Humidity", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
    
                    Text(
    "94",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
    );
  }
}