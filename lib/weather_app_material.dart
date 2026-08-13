import 'package:flutter/material.dart';


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Weather Application",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        
        ),
        centerTitle: true,
        actions: [
          //there is two more methods GestureDetector and Inkwell to do same thing with some limitations so we use IconButton.
         IconButton(onPressed: () => {
print("Button Clicked"),
         }, icon: Icon(Icons.refresh))
        ],


      ),

 body: Column(
  children: [
  //main card 
SizedBox(
  width: double.infinity,
  child: Card(
     elevation: 0,
     child: Column(
    
      children: [
        Text('300 F', 
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
  
        ),)
      ],
     ),
  
  
  ),
),

const SizedBox(height: 20,),

//weather forecast cards
const  Placeholder(
  fallbackHeight: 150,
),

const SizedBox(height: 20,),
//additional information

const Placeholder(
  fallbackHeight: 100,
)

  ],
 )

    );
  }
}