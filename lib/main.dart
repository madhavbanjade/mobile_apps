
import 'package:flutter/material.dart';



//this is not how we work on flutter we use our class concept from dart and call them in our main function.
// void main(){
//   runApp(Text(
//     'Hy it is my first flutter project.',
//     textDirection: TextDirection.ltr,
//   ));
// }

void main(){
runApp(MyApp());
}

class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context){
    return Text(
      'Hello flutter world welcome!',
     textDirection: TextDirection.ltr, //important
    );
  }

}