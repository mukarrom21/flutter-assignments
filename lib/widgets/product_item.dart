import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Product name"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Product code"),
          const Text("Product unit price"),
          const Text("Product quantity"),
          const Text("Total price"),
          const Divider(),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: const Text("Edit"),
                icon: const Icon(Icons.edit),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                icon: const Icon(Icons.delete, color: Colors.red,),
              ),
            ],
          ),
        ],
      ),
      // trailing: Text("data"),
    );
  }
}
