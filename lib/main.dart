
import 'package:currency_converter/currencey_c_material.dart';
import 'package:flutter/material.dart';
//this is not how we work on flutter we use our class concept from dart and call them in our main function.
// void main(){
//   runApp(Text(
//     'Hy it is my first flutter project.',
//     textDirection: TextDirection.ltr,com
//   ));
// }

void main(){
runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

@override
  Widget build(BuildContext context){

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
      home: CurrenceyCMaterialApp(),
      
    );
  }

}