

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrenceyCMaterialApp extends StatelessWidget {
const CurrenceyCMaterialApp({super.key});

@override
Widget build(BuildContext context){
  final border = OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          style: BorderStyle.solid,

        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
  return Scaffold(
    backgroundColor: Colors.cyan,
    body: Center(
   child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
    //  crossAxisAlignment: CrossAxisAlignment.center, // can not do it because coloumn takes only the text width 
      children: [
       const  Text(
          '0',
         style: TextStyle(
          color: Color.fromRGBO(245, 246, 247, 0.988),
          fontSize: 45,
          fontWeight: FontWeight.bold
 
        )
        ),

        Container(
          //you can add padding and margin and a lots of widgets from container.
    
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: TextStyle(
              color: Colors.black
            ),
           
          decoration: InputDecoration(
            hintText: "Enter amount in NPR to convert in USD",
            hintStyle: TextStyle(
              color: Colors.black
            ),
                prefixIcon: Icon(Icons.monetization_on_outlined),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
                 
                
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: true,
            signed: true
          ),
          
          ),
        ),
      
      Container(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(onPressed: (){
          //debug, released, profile
          if(!kDebugMode){
            debugPrint('Button Clicked !');
          }
        },
        style: const ButtonStyle(
          elevation: WidgetStatePropertyAll(10),
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        
        minimumSize: WidgetStatePropertyAll(
          Size(double.infinity, 50),
        )
        ),
        
        child: 
           Text("Convert")
        ),
      )

      ],

      



    )

    )
 
  );
}


}