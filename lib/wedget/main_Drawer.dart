

import 'package:flutter/material.dart';
import '../screens/Filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color:  Theme.of(context).primaryColor,
            child: const Text("cooking App",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.white),),
          ),
          const SizedBox(height: 20,),
          buildListTile(Icons.restaurant,"Meal",(){Navigator.of(context).pushReplacementNamed("home");}),

          buildListTile(Icons.settings,"Filters",(){Navigator.of(context).pushReplacementNamed(FiltersScreens.routeName);}),
        ],
      )
    );
  }

  ListTile buildListTile(IconData icon,String title, Function funcOnTap) {
    return ListTile(
          leading: Icon(icon,size: 24,),
          title: Text(title,style: const TextStyle(
              fontSize: 20,
              fontFamily: 'RootoCondensed',
              fontWeight: FontWeight.bold
          ),),
          onTap: funcOnTap,
        );
  }
}
