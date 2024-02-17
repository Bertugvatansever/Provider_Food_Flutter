import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/home_page.dart';
import 'package:yemek_uygulamasi/search_page.dart';
import 'package:yemek_uygulamasi/shopping_page.dart';

class RootPage extends StatefulWidget {
 RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
int _selectedindex = 0;

  List<Widget> screens = [HomePage(),FoodSearchPage(categories: []),ShoppingPage()];
  
  void _onItemTapped(int index){
    setState(() {
      _selectedindex = index; 
      // switch(index){
      //   case 0:
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      //   case 1:
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  FoodSearchPage(categories: this.categories)));
      //   case 2:
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>  ShoppingPage()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ara',      
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sepetim',
          ),
        ],
        currentIndex: this._selectedindex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}