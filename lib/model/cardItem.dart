class CartItem {
  final String imagePath;
  final String productName;
  final double price;
  final int quantity;

  CartItem( {required this.productName, required this.price, required this.quantity,required this.imagePath});
}