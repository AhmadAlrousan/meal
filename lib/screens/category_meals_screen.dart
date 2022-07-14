
import 'package:flutter/material.dart';
import 'package:meal/wedget/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName='displayMeal'; //push named
  // عشان نستخدمها في ال
  final   List<Meal>availbleMeal;

  // ignore: use_key_in_widget_constructors
  const CategoryMealsScreen(this.availbleMeal);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeal;

  @override
  void didChangeDependencies() {
    final routeArg=ModalRoute.of(context).settings.arguments as Map<String , String>;

    final categoryId=routeArg['id'];

    categoryTitle=routeArg['title'];

    displayMeal =widget.availbleMeal.where((meal) =>
        meal.category.contains(categoryId),
    ).toList();
    super.didChangeDependencies();
  }



  // ignore: unused_element
  void _removeMeal(String mealId){
    setState(() {
      displayMeal.removeWhere((meal) =>meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar:AppBar(title:  Text(categoryTitle),) ,
      body: ListView.builder(
        // ignore: missing_return
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            imageUrl:displayMeal[index].imageURL ,
            title:displayMeal[index].title ,
            affordaility: displayMeal[index].affordaility,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            id: displayMeal[index].id,

          );
        },
        itemCount:displayMeal.length ,
      ),
    );
  }
}
