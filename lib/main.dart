import 'package:currency_converter/currencey_c_material.dart';
import 'package:currency_converter/currency_c_cupertino.dart';
import 'package:currency_converter/global_variables.dart';
import 'package:currency_converter/home_page.dart';
import 'package:currency_converter/product_detail_page.dart';
import 'package:currency_converter/weather_app_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//this is not how we work on flutter we use our class concept from dart and call them in our main function. never trust anyone 
// void main(){
//   runApp(Text(
//     'Hy it is my first flutter project.',
//     textDirection: TextDirection.ltr,com
//   ));
// }

void main() {
  runApp(const ShopApp());
}


//The folowing code is for currency_converter
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return const Text(
    //   'Hello flutter world welcome!',
    //  textDirection: TextDirection.ltr, //important
    // );

    return const MaterialApp(
      // without scaffold --- problem-1
      // home: Text("Hello World !!!")
      //with scaffold
      // home: Scaffold(
      //   //this is not aligning where i want and i can not use text-aign as well --- problem-2
      //   // body: Text("Hello Flutter World"),
      //   //for aligning ---- solution and the solution is widgettree.
      //   body: Center(
      //     child: Text("Hello Flutter World!"),
      //   ),
      // ),

      // ----- now we build everything in pieces and collecting it here
      home: CurrencyConverterMaterialPage(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: CurrencyConverterCupertinoPage());
  }
}


//the following code is for weather_application

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const WeatherScreen(),
    );
  }
}

// the following code is for shop cart app 
class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        fontFamily: "Lato",
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
        primary: const Color.fromRGBO(254, 206, 1, 1) ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 35
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
     
        )
      ),
      home: ProductDetailPage(
        product: products[0],
      )
    );
  }
} 