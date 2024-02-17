import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yemek_uygulamasi/model/cardItem.dart';
import 'package:yemek_uygulamasi/providers/card_provider.dart';

import 'model/foods.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key, required this.food});

  final Food food ;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}


class _FoodDetailPageState extends State<FoodDetailPage> {
    double totalPrice = 0;
    int count = 1;
  @override
  Widget build(BuildContext context) {
  final cartProvider = Provider.of<CartProvider>(context,listen:false);
  double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 350.h,
          child: Container(
            width: screenWidth,
            height: 500.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(image: AssetImage(widget.food.image),fit: BoxFit.cover)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 8),
                  child: Text(widget.food.rating.toString(),style: TextStyle(fontSize: 30.sp,color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 8),
                  child: Icon(Icons.star,color: Colors.white,size: 36,),
                )               
              ],
            )
          ),         
          ),
          SizedBox(height: 20.h,),
          Text(widget.food.categoryName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color:Colors.orange )),
          SizedBox(height: 25.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Row(
                  children: [
                    
                    Text(totalPrice == 0 ?widget.food.price.toInt().toString():totalPrice.toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.orange),),
                    
                    SizedBox(width: 10.w,),
                    Text("TL",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.orange),)
                  ],
                ),
              ),
              SizedBox(
                width: 120.w,
              ),
              Expanded(
                child: Container(
                  width: 120.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange                 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(count>1){
                              count--;
                              totalPrice = widget.food.price*count;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("-",style: TextStyle(fontSize: 45.sp,color: Colors.white),),
                        ),
                      ),
                      Text("$count",style: TextStyle(fontSize: 32,color: Colors.white),),
                      GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                
                                  totalPrice = widget.food.price*count ;
                                });
                              },
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 60.h,),
          Container(
            width: 250.w,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.orange
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: GestureDetector(
                    onTap: () {
                      final newItem = CartItem(imagePath: widget.food.image,productName: widget.food.categoryName, price: widget.food.price, quantity: count);
                      print(count);
                      cartProvider.addToCart(newItem);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ürün Sepete Eklendi")));
                      setState(() {
                        count=1;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Sepete Ekle",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.bold),)),
                )
              ],
            ),
          ),
          SizedBox(height: 60.h,),
          Container(
            width: 250.w,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.orange
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        count=1;
                      });
                    },
                    child: Text("Geri Dön",style: TextStyle(fontSize: 30.sp,color: Colors.white,fontWeight: FontWeight.bold),)),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}