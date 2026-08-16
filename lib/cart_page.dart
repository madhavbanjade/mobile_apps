import 'package:currency_converter/cart_provider.dart';
import 'package:currency_converter/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Cart', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),)),
      ),
   body:   ListView.builder(
        itemCount: Cart.length,
        itemBuilder: (context, index) {
          final cartItem = Cart[index];

          return (ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.red),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          ));
        },
      ),
    );
  }
}
