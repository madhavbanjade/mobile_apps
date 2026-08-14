import 'dart:convert';
import 'dart:ui';

import 'package:currency_converter/additional_info_item.dart';
import 'package:currency_converter/hourly_forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {


  Future<Map<String, dynamic>> getCurrentWeather() async {
    print('getCurrentWeather called');
    try {
      String cityName = "Nepal";
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=513e15ddf6bc2912bec44bcff20cb8b7',
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != "200") {
        throw "An unexpected error occoured";
      } 
      //this is not called yet because it as an aschrynos function and it takes time to called and util it is called the build function already build the state and you won't see the changes in ui so for that use usestate to again rebuild the build function.
   return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        elevation: 0,
        title: const Text(
          "Weather Application",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          //there is two more methods GestureDetector and Inkwell to do same thing with some limitations so we use IconButton.
          IconButton(
            onPressed: () => {print("Button Clicked")},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body:
      FutureBuilder(future: getCurrentWeather(), 
       builder: (context, snapshot)  {
        if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: const CircularProgressIndicator.adaptive());
        }

        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()));
        }

        final data = snapshot.data!;
        final currentTemp =    data['list'][0]['main']['temp'];
 
         return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide.none,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            '$currentTemp K',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Icon(Icons.cloud, size: 64),
                          const SizedBox(height: 10),
                          Text("Rain", style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            //this is responsible for scrolling the cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: "3:00",
                    temperature: "300.1K",
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: "4:00",
                    temperature: "298.4K",
                    icon: Icons.sunny,
                  ),
                  HourlyForecastItem(
                    time: "5:00",
                    temperature: "299.1K",
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: "6:00",
                    temperature: "300.4K",
                    icon: Icons.sunny,
                  ),
                  HourlyForecastItem(
                    time: "7:00",
                    temperature: "297.5K",
                    icon: Icons.cloud,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            //additional information
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "90",
                ),
                AdditionalInfo(
                  icon: Icons.air,
                  label: "Wind Spped",
                  value: "7.8",
                ),
                AdditionalInfo(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1009",
                ),
              ],
            ),
          ],
        ),
      );

       }
       
       ) 
      
      
    );
  }
}
