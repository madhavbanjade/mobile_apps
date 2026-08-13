import 'package:flutter/cupertino.dart';


class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends State<CurrencyConverterCupertinoPage> {
    double result = 0;
  final TextEditingController textEditingController = TextEditingController();
    void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 152;
    });
  }
  @override
  Widget build(BuildContext context) {
    

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor:  CupertinoColors.systemCyan,
        // elevation: 0,  they do not exits in this 
        middle: const Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      
        //below two is for icons shpown in headers like profile icons and logout button..
        // actions: [
        //  Text("hello")
        // ],
        // leading: ,
      ),
      backgroundColor: CupertinoColors.systemCyan,
      child: Container(  //insted of body child
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
        
              CupertinoTextField(
                controller: textEditingController,
                style: TextStyle(color: CupertinoColors.black),
                decoration: BoxDecoration(
                  color:  CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),

                ),
                 placeholder: "Enter your amount in USD",
                 prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
        //giving space in between
              const SizedBox(height: 10,),
              CupertinoButton(
                onPressed:convert,
              color: CupertinoColors.black,
                child: Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}