class Product {
  final String name;
  final String color;
  final String size;
  final String image;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.color,
    required this.size,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
