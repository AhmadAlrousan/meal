

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

   // ignore: use_key_in_widget_constructors
   const CategoryItem( this.id, this.title, this.color);

   void selectCategory(BuildContext contextBuild){
     Navigator.of(contextBuild).pushNamed(CategoryMealsScreen.routeName,
     //arguments عشان تستدعي المعلومات
     arguments: {
       'id':id,
       'title':title,
     }
     );
   }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          selectCategory(context);
        },
        splashColor:Theme.of(context).primaryColor ,
        borderRadius: BorderRadius.circular(15),

        child:  Container(


          padding: const EdgeInsets.all(15),
          child: Text(title,style: Theme.of(context).textTheme.titleMedium),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
           gradient: LinearGradient(
             begin:Alignment.topLeft,
             end:Alignment.bottomRight,
             colors: [
               color.withOpacity(0.1),color
             ],
           )

          ),
        ),
      ),
    );
  }
}
