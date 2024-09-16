import 'package:flutter/material.dart';
import 'package:flutter_assignments/screens/add_new_product_screen.dart';
import 'package:flutter_assignments/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return const ProductItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 3,
      ),
    );
  }

}
