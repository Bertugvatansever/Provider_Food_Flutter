import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yemek_uygulamasi/food_detail_page.dart';
import 'package:yemek_uygulamasi/search_page.dart';

import 'model/foods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  
  List<Food>categories = [
    Food(image: "assets/1685703964247_1125x522.png", categoryName: "Hatay Döner", rating: 3.75, place: "Muğla Döner",price: 120),
    Food(image: "assets/big_mac.jpg", categoryName: "Hamburger", rating: 4.00, place: "McDonalds",price: 100),
    Food(image: "assets/efsane-buffalo-900x430px.png", categoryName: "Tavuk", rating: 3.55, place: "Tavuk Dünyası",price: 150),
    Food(image: "assets/mantarlı.jpg", categoryName: "Pizza", rating: 4.25, place: "Pino",price:125 ),
  ];
  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // Klavye taşmasını engelliyor
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // EN YUKARI TURUNCU KISIM
           Container(
            width: screenWidth,
            height: 160.h,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange, 
            ),
            child: Column(
              children: [
                SizedBox(height: 40.h,),
                Row(
                  // ANA SAYFA VE MENÜ İKONU
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.menu),iconSize: 30 ,color: Colors.white,),
                    SizedBox(width: 20.w,),
                    Text("Ana Sayfa",
                    style: TextStyle(fontSize: 30.sp,color: Colors.white,)  
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                // SEARCH YAZISI
                    InkWell(     
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) => FoodSearchPage(categories: categories),));
                      },
                      child: Container(
                      width: 355.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child:  TextFormField(
                        enabled: false,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        suffixIcon: Icon(Icons.search)
                        ),
                      ),
                    
                                    ),
                    ),     
              ],
            ),
           ),
           SizedBox(height: 20.h),
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Padding(
                 padding: EdgeInsets.only(left: 8.0),
                 child: Text("Son Eklenenler",style: TextStyle(fontSize: 35.sp,color: Colors.orange,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
               ),
             ],
           ),
           SizedBox(height: 10.h),
           SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Yatay kaydırma
          child: Container(
            color: Colors.white, // Arkaplan rengi
            padding: EdgeInsets.symmetric(horizontal: 20), // Kenarlara boşluk eklemek için
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white, // Yuvarlak fotoğrafın arka plan rengi
                  backgroundImage: AssetImage('assets/lez-hamburger.jpg'), // Fotoğraf
                  radius: 50, // Yuvarlak fotoğrafın yarıçapı
                ),
                SizedBox(width: 20.w), // Boşluk eklemek için
                CircleAvatar(
                  backgroundColor: Colors.white, // Yuvarlak fotoğrafın arka plan rengi
                  backgroundImage: AssetImage('assets/maxresdefault.jpg'), // Fotoğraf
                  radius: 50, // Yuvarlak fotoğrafın yarıçapı
                ),
                SizedBox(width: 20.w), // Boşluk eklemek için
                CircleAvatar(
                  backgroundColor: Colors.white, // Yuvarlak fotoğrafın arka plan rengi
                  backgroundImage: AssetImage('assets/sucuklu-pizza-yeni-onecikan.jpg'), // Fotoğraf
                  radius: 50, // Yuvarlak fotoğrafın yarıçapı
                ),
                SizedBox(width: 20.w), // Boşluk eklemek için
                CircleAvatar(
                  backgroundColor: Colors.white, // Yuvarlak fotoğrafın arka plan rengi
                  backgroundImage: AssetImage('assets/patates-nasil-kizartilir-930x620.png'), // Fotoğraf
                  radius: 50, // Yuvarlak fotoğrafın yarıçapı
                ),
                SizedBox(width: 20.w), // Boşluk eklemek için
            ],
            ),
            ),
            ),
            SizedBox(height: 20.h),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Yemek Kategorileri",style: TextStyle(fontSize: 35.sp,color: Colors.orange,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(width: screenWidth,
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  FoodDetailPage(food: categories[index])));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image:AssetImage(categories[index].image),fit:BoxFit.cover)
                        ),
                        width: 250.w,
                        height: 200.h,
                      ),
                      SizedBox(height: 5.h),
                       Text(categories[index].categoryName,style: TextStyle(fontSize: 20.sp),),
                       SizedBox(height: 5.h,),
                       Row(
                        children: [
                          Icon(Icons.star,color: Colors.orange,size: 16,),
                          SizedBox(width: 5,),
                          Text(
                            categories[index].rating.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(width:5),
                          Text(categories[index].place)
                        ],
                       )
                    ],
                  )
                ),
              );
            } ),
            )
          ],
        ),
      ),
      
    );
  }
}