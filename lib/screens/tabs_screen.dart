
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal/screens/favorites_screen.dart';
import '../models/meal.dart';
import '../wedget/main_Drawer.dart';
import 'categories_screen.dart';
class TabsScreen extends StatefulWidget {
  final   List<Meal>favoriteMeal;

 // ignore: use_key_in_widget_constructors
 const  TabsScreen( this.favoriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


   List<Map<String, Object>> _Pages;

   @override
  initState(){
     _Pages =[
       {
         'page' : const CategoriesScreen(),
         'title' : "Categories"
       },
       {
         'page' :  FavoritesScreen(widget.favoriteMeal),
         'title' : "Favorites"
       },
     ];
     super.initState();
   }

  int _selectPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      _selectPageIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_Pages[_selectPageIndex]['title']),),
      body: _Pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage,
        backgroundColor:Theme.of(context).primaryColor ,
        selectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items:const[
          BottomNavigationBarItem(
            icon:Icon (Icons.category),
            label: "category"
          ),
          BottomNavigationBarItem(
            icon:Icon (Icons.star),
            label: "Favorites"
          ),

        ] ,
      ),
      drawer: const MainDrawer(),

    );
  }


}
