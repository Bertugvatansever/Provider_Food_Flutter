import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/food_detail_page.dart';
import 'model/foods.dart'; // Foods model dosyanızın konumuna göre güncelleyin

class FoodSearchPage extends StatefulWidget {
   List<Food> categories;

   FoodSearchPage({Key? key, required this.categories}) : super(key: key);

  @override
  _FoodSearchPageState createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Food> _searchResults = [];

  @override
  void initState() {
    super.initState();
    widget.categories = [
    Food(image: "assets/1685703964247_1125x522.png", categoryName: "Hatay Döner", rating: 3.75, place: "Muğla Döner",price: 120),
    Food(image: "assets/big_mac.jpg", categoryName: "Hamburger", rating: 4.00, place: "McDonalds",price: 100),
    Food(image: "assets/efsane-buffalo-900x430px.png", categoryName: "Tavuk", rating: 3.55, place: "Tavuk Dünyası",price: 150),
    Food(image: "assets/mantarlı.jpg", categoryName: "Pizza", rating: 4.25, place: "Pino",price:125 ),

  ];
  }

  void _searchFoods(String searchTerm) {
    _searchResults.clear();
    if (searchTerm.isEmpty) {
      _searchResults.addAll(widget.categories);
    } else {
      _searchResults.addAll(widget.categories.where((food) => food.categoryName.toLowerCase().contains(searchTerm.toLowerCase())));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _searchFoods,
          decoration: InputDecoration(
            hintText: 'Yemek ara...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          Food food = _searchResults[index];
          return ListTile(
            title: Text(food.categoryName),
            leading: CircleAvatar(
              backgroundImage: AssetImage(food.image),
            ),
            trailing: Icon(Icons.star_border), // Yıldız simgesi
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(food: food),));
            },
          );
        },
      ),
    );
  }
}
