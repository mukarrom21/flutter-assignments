import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignments/model/product.dart';
import 'package:flutter_assignments/widgets/input_widget.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen(
      {super.key, required this.data, required this.refresh});

  final Product data;
  final Future<void> Function() refresh;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEC = TextEditingController();
  final TextEditingController _productImageTEC = TextEditingController();
  final TextEditingController _productCodeTEC = TextEditingController();
  final TextEditingController _unitPriceTEC = TextEditingController();
  final TextEditingController _quantityTEC = TextEditingController();
  final TextEditingController _totalPriceTEC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _productNameTEC.text = widget.data.productName;
    _productImageTEC.text = widget.data.img;
    _productCodeTEC.text = widget.data.productCode;
    _unitPriceTEC.text = widget.data.unitPrice.toString();
    _quantityTEC.text = widget.data.qty.toString();
    _totalPriceTEC.text = widget.data.totalPrice.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputWidget(controller: _productNameTEC, label: 'Product Name'),
              InputWidget(controller: _productImageTEC, label: 'Product Image'),
              InputWidget(controller: _productCodeTEC, label: 'Product Code'),
              InputWidget(controller: _unitPriceTEC, label: 'Unit Price'),
              InputWidget(controller: _quantityTEC, label: 'Quantity'),
              InputWidget(controller: _totalPriceTEC, label: 'Total Price'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize:
                      WidgetStateProperty.all(const Size(double.maxFinite, 50)),
                ),
                onPressed: _onClickUpdate,
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onClickUpdate() async {
    Map<String, dynamic> updateData = {
      "ProductName": _productNameTEC.text,
      "ProductCode": _productCodeTEC.text,
      "Img": _productImageTEC.text,
      "UnitPrice": _unitPriceTEC.text,
      "Qty": _quantityTEC.text,
      "TotalPrice": _totalPriceTEC.text,
    };

    Uri uri = Uri.parse(
        "http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.data.id}");
    Response response = await post(uri, body: jsonEncode(updateData), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      await widget.refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Update success"),
        ));
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Update failed"),
        ));
      }
    }
  }
}
