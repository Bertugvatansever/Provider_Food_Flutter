import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yemek_uygulamasi/providers/card_provider.dart';

class ShoppingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepet'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.itemCount, // Örnek için 5 ürün
        itemBuilder: (context, index) {
          final cartItem = cartProvider.items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem.imagePath), // Ürün resmi
            ),
            title: Text(cartItem.productName), // Ürün adı
            subtitle: Text('${(cartItem.price*cartItem.quantity).toInt().toString()}'+"TL"), // Ürün fiyatı
            trailing: IconButton(
              icon: Icon(Icons.delete), // Silme simgesi
              onPressed: () {
                cartProvider.removeFromCart(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(cartProvider.totalPrice.toString()+"TL"), // Toplam fiyat
              ),
              ElevatedButton(
                onPressed: () {
                  // Ödeme işlemi
                },
                child: Text('Ödeme Yap'), // Ödeme butonu
              ),
            ],
          ),
        ),
      ),
    );
  }
}
