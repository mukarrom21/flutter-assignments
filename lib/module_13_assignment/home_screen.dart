import 'package:flutter/material.dart';
import 'package:flutter_assignments/module_13_assignment/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(
        name: "Pull-over",
        price: 51,
        color: "Black",
        size: "L",
        image: 'https://picsum.photos/503/503'),
    Product(
        name: "T-Shirt",
        price: 30,
        color: "Gray",
        size: "L",
        image: 'https://picsum.photos/503/503'),
    Product(
        name: "Sport-dress",
        price: 43,
        color: "Black",
        size: "M",
        image: 'https://picsum.photos/503/503'),
  ];

  int totalAmount = 0;

  void increment(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  void decrement(Product product) {
    if (product.quantity > 0) {
      setState(() {
        product.quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bag"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];

                  return ListTile(
                    // Add T-shirt image here
                    leading: Image(
                      image: NetworkImage(product.image),
                    ),
                    title: Text(product.name),
                    subtitle: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Color: ${product.color}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Size: ${product.size}"),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            _buildPlusMinusButton(
                              icon: const Icon(Icons.remove),
                              function: ()=> decrement(product),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(product.quantity.toString()),
                            const SizedBox(
                              width: 16,
                            ),
                            _buildPlusMinusButton(
                              icon: const Icon(Icons.add),
                              function: ()=>increment(product),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          weight: 5,
                        ),
                        Text(
                          "${product.price}\$",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
                itemCount: products.length,
              ),
            ),

            // Add total price here
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "20\$",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            // check out full with red button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: const Text(
                  "Check Out",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlusMinusButton({
    required Icon icon,
    required VoidCallback function,
  }) {

    return Material(
      // shadow
      elevation: 4.0,
      shape: const CircleBorder(),
      child: CircleAvatar(
        // shadow
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: function,
          icon: icon,
        ),
      ),
    );
  }
}
