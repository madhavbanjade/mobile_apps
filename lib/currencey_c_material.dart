import 'package:flutter/material.dart';

//1. create variables that stores the converted value
//2. create function to multiple with exchanges rate and give converted value
//3. store the value in the variable that we created
//4. display the value


//widets are always immutable this is immutable,the state makes this class mutable, so there is no performance impact in our widget. this is still a constent. so that is why we have two classes.
class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _currencyConverterMaterialPageState();
}



// ignore: camel_case_types
class _currencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // put all the logicical things like api calling and aschrynos function outside the build function
    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

//it is accessable to throught the ccmpagestate file
  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 152;
    });
  }


//it is opp to initstate. it basically discarted everyting once it is used. the best use case of this is that it avoids memory leaks.... It is Same for both the design.
  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  //constructor - override - function (to call the function ahead of the time you should use something called initstate)
  Widget build(BuildContext context) {
    print("rebuild");
    //put all the ui stuff inside the build context. it reduces the time complexity of the application.

    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        //below two is for icons shpown in headers like profile icons and logout button..
        // actions: [
        //  Text("hello")
        // ],
        // leading: ,
      ),
      backgroundColor: Colors.cyan,
      body: Container(
         padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center, // can not do it because column takes only the text width
            children: [
              Text(
                "NPR. ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}",
                style: TextStyle(
                  color: Color.fromRGBO(245, 246, 247, 0.988),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              TextField(
                controller: textEditingController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter amount in NPR to convert in USD",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
        //giving space in between
              const SizedBox(height: 10,),
              TextButton(
                onPressed:convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// class CurrenceyCMaterialApp extends StatelessWidget {
//   const CurrenceyCMaterialApp({super.key});
 

//   @override
//   Widget build(BuildContext context) {
//      double result = 0;
//      final TextEditingController textEditingController = TextEditingController();
//     final border = OutlineInputBorder(
//       borderSide: BorderSide(
//         width: 2.0,
        
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//     );

//     return Scaffold(
//       appBar: AppBar(
// backgroundColor: Colors.cyan,
// elevation: 0,
// title: const Text("Currency Converter",
// style: TextStyle(
//   color: Colors.white,
//   fontSize: 24,
//   fontWeight: FontWeight.bold,
// ),

// ),
// centerTitle: true,
// //below two is for icons shpown in headers like profile icons and logout button..
// // actions: [
// //  Text("hello")
// // ],
// // leading: ,
//       ),
//       backgroundColor: Colors.cyan,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center, // can not do it because column takes only the text width
//           children: [
//              Text(
//               result.toString(),
//                style: TextStyle(
//                 color: Color.fromRGBO(245, 246, 247, 0.988),
//                 fontSize: 60,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: textEditingController,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Enter amount in NPR to convert in USD",
//                   hintStyle: TextStyle(
//                     color: Colors.black,
//                   ),
//                   prefixIcon: Icon(Icons.monetization_on_outlined),
//                   prefixIconColor: Colors.black,
//                   filled: true,
//                   fillColor: Colors.white,
//                   focusedBorder: border,
//                   enabledBorder: border,
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(
//                   decimal: true,
//                   signed: true,
//                 ),
//               ),
//             ),

//             Container(
//               padding: EdgeInsets.all(10),
//               child: TextButton(
//                 onPressed: () {
//               result = double.parse(textEditingController.text) * 152;
//                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//                 child: Text("Convert"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }