import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignments/widgets/input_widget.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEC = TextEditingController();
  final TextEditingController _productImageTEC = TextEditingController();
  final TextEditingController _productCodeTEC = TextEditingController();
  final TextEditingController _unitPriceTEC = TextEditingController();
  final TextEditingController _quantityTEC = TextEditingController();
  final TextEditingController _totalPriceTEC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
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
                onPressed: _onClickAddProduct,
                child: const Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickAddProduct() {
    if (_formKey.currentState!.validate()) {
      _addProduct();
    }
  }

  Future<void> _addProduct() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> data = {
      "ProductName": _productNameTEC.text,
      "ProductCode": _productCodeTEC.text,
      "Img": _productImageTEC.text,
      "UnitPrice": _unitPriceTEC.text,
      "Qty": _quantityTEC.text,
      "TotalPrice": _totalPriceTEC.text,
    };
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/CreateProduct");
    Response response = await post(
      uri,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _productNameTEC.clear();
      _productCodeTEC.clear();
      _productImageTEC.clear();
      _unitPriceTEC.clear();
      _quantityTEC.clear();
      _totalPriceTEC.clear();
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Product added successfully"),
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something went wrong"),
          ),
        );
      }
    }
  }
}
