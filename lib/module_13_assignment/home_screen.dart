import 'package:flutter/material.dart';
import 'package:flutter_assignments/module_13_assignment/plus_minus_button.dart';
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
        image:
            'https://cdn.pixabay.com/photo/2016/11/23/06/57/isolated-t-shirt-1852114_960_720.png'),
    Product(
        name: "T-Shirt",
        price: 30,
        color: "Red",
        size: "L",
        image:
            'https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008_1280.png'),
    Product(
        name: "Sport-dress",
        price: 43,
        color: "Black",
        size: "M",
        image:
            'https://cdn.pixabay.com/photo/2016/08/15/19/57/red-devils-1596355_960_720.jpg'),
  ];

  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    for (Product product in products) {
      totalAmount += product.price * product.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    // calculateTotalAmount();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Bag",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];
                  return Material(
                    elevation: 10,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      // Add T-shirt image here
                      leading: Image(
                        image: NetworkImage(
                          product.image,
                        ),
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
                              PlusMinusButton(
                                icon: const Icon(Icons.remove),
                                function: () => decrement(product),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(product.quantity.toString()),
                              const SizedBox(
                                width: 16,
                              ),
                              PlusMinusButton(
                                icon: const Icon(Icons.add),
                                function: () => increment(product),
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
                    ),
                  );
                },
              ),
            ),

            // Add total price here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total amount:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${totalAmount.toString()}\$",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // check out full with red button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // Show a snack bar here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Congratulations! You have checked out."),
                    ),
                  );
                },
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

  void increment(Product product) {
    setState(() {
      product.quantity++;
      totalAmount += product.price;
    });
  }

  void decrement(Product product) {
    if (product.quantity > 0) {
      setState(() {
        product.quantity--;
        totalAmount -= product.price;
      });
    }
  }
}
