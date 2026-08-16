import 'package:currency_converter/cart_page.dart';
import 'package:currency_converter/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


int currentPage = 0;

List<Widget> pages = const [ProducrList(), CartPage()];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //you can use pages[currentpage] or ternery operator for do this things but bby doing this you can have access to switch between pages and get the scrolled part previously..
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
     
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
