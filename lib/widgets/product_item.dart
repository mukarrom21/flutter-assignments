import 'package:flutter/material.dart';
import 'package:flutter_assignments/model/product.dart';
import 'package:flutter_assignments/screens/update_product_screen.dart';
import 'package:http/http.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.data,
    required,
    required this.refresh,
  });

  final Product data;
  final Future<void> Function() refresh;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.data.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("code: ${widget.data.productCode}"),
          Text("Price: \$${widget.data.unitPrice.toString()}"),
          Text("Quantity: ${widget.data.qty}"),
          Text("Total price: \$${widget.data.totalPrice.toString()}"),
          const Divider(),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProductScreen(
                                data: widget.data,
                                refresh: widget.refresh,
                              )));
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
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
      // trailing: Text("data"),
    );
  }

  Future<void> _onClickDelete() async {
    Uri uri = Uri.parse(
        "http://164.68.107.70:6060/api/v1/DeleteProduct/${widget.data.id}");
    Response response = await get(uri);

    if (response.statusCode == 200) {
      await widget.refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Delete success"),
        ));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Delete failed"),
        ));
      }
    }
  }
}
