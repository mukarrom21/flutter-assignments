import 'package:flutter/material.dart';
import 'package:flutter_assignments/widgets/input_widget.dart';

class AddNewProductScreen extends StatefulWidget {
 const  AddNewProductScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
                fixedSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
              ),
              onPressed: () {
                print(_productImageTEC);
              },
              child: const Text("Add Product"),
            ),

          ],
        ),
      ),
    );
  }
}
