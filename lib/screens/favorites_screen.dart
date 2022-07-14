
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../wedget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final   List<Meal>favoriteMeal;

  // ignore: use_key_in_widget_constructors
  const  FavoritesScreen( this.favoriteMeal);



  @override
  Widget build(BuildContext context) {

    if(favoriteMeal.isEmpty){
      return const Center(
        child:  Text("You have no favorites yet - start adding some!"),
      );
    }
    else{
      return ListView.builder(
        // ignore: missing_return
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            imageUrl:favoriteMeal[index].imageURL ,
            title:favoriteMeal[index].title ,
            affordaility: favoriteMeal[index].affordaility,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            id: favoriteMeal[index].id,

          );
        },
        itemCount:favoriteMeal.length ,
      );
    }

  }
}
