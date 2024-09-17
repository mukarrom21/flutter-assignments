import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignments/model/product.dart';
import 'package:flutter_assignments/screens/add_new_product_screen.dart';
import 'package:flutter_assignments/widgets/product_item.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) : ListView.separated(
        itemBuilder: (context, index) {
          return ProductItem(data: products[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: products.length,
      ),
    );
  }

  Future<void> getProducts() async {
    products.clear();
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse["data"]) {
        products.add(Product(
          id: item["_id"] ?? "",
          productName: item["ProductName"] ?? "",
          productCode: item["ProductCode"] ?? "",
          img: item["Img"] ?? "",
          unitPrice: item["UnitPrice"] ?? "",
          qty: item["Qty"] ?? "",
          totalPrice: item["TotalPrice"] ?? "",
          createdDate: item["CreatedDate"] ?? "",
        ));
      }
    }

    setState(() {
      isLoading = false;
    });
  }
}
