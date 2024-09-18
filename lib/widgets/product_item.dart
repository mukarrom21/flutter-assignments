import 'package:flutter/material.dart';
import 'package:flutter_assignments/model/product.dart';
import 'package:flutter_assignments/screens/update_product_screen.dart';
import 'package:http/http.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.data,
  });

  final Product data;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title:  Text(data.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("code: ${data.productCode}"),
           Text("Price: \$${data.unitPrice.toString()}"),
           Text("Quantity: ${data.qty}"),
           Text("Total price: \$${data.totalPrice.toString()}"),
          const Divider(),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProductScreen()));
                },
                label: const Text("Edit"),
                icon: const Icon(Icons.edit),
              ),
              TextButton.icon(
                onPressed: _onClickDelete,
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

  Future<void> _onClickDelete() async {
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/DeleteProduct/${data.id}");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
