import 'package:currency_converter/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectSize = 0;
  void addToCart() {
    if (selectSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': selectSize,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product added successfully")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please select a size")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),

      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          //this gives  you spacer with flex from top and bottom.
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(flex: 2),

          Center(
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '\$${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print("object");
                                setState(() {
                                  selectSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: selectSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // code begin
                    ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),

                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
