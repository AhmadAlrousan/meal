// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail'; //push named عشان نستخدمها في ال
  final Function toggleFavorte;
  final Function isFavorite;

  const MealDetailScreen(this.toggleFavorte, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageURL),
            ),
            buildTitleContainer(context, 'Ingredients'),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.teal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitleContainer(context, 'Steps'),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "#${index + 1} ",
                            style:const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.teal,
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() =>toggleFavorte(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star  : Icons.star_border),
      ),
    );
  }

  Container buildListViewContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin:const EdgeInsets.all(10),
        padding:const EdgeInsets.all(10),
        width: 300,
        height: 250,
        child: child);
  }

  Container buildTitleContainer(BuildContext context, String txt) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
