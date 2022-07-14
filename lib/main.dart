
import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/screens/Filters_screen.dart';
import 'package:meal/screens/category_meals_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
 // _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> _filters={
    'gluten': false,
    'lactose':false,
    'vegan': false,
    'vegetarin' :false,
  };

  List<Meal>_availbleMeal=DUMMY_MEALS;
  final List<Meal>_favoriteMeal=[];

  void _setFilters(Map<String , bool> _filtersData  ){
    setState(() {
      _filters=_filtersData;
      // ignore: missing_return
      _availbleMeal=DUMMY_MEALS.where((meal)  {
        if (_filters['gluten']&& !meal.isGlutenFree){
          return false;
        }
        if (_filters['lactose']&& !meal.isLactoseFree){
          return false;
        }
        if (_filters['vegan']&& !meal.isVegan){
          return false;
        }
        if (_filters['vegetarin']&& !meal.isVegetarin){
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId)
  {
   final exIndex = _favoriteMeal.indexWhere((meal) => meal.id==mealId);

   if(exIndex>=0){
     setState(() {
       _favoriteMeal.removeAt(exIndex);
     });
   }
   else{
     setState(() {
       _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
     });
   }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) =>  meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meal app',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.teal),
          canvasColor: const Color.fromRGBO(255, 255, 255,20),
          primaryColor: Colors.teal,
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(fontSize: 17,color: Colors.black,fontFamily:"RootoCondensed")
          )
      ),
      debugShowCheckedModeBanner: false ,
      //   home:const MyHomePage(),
      home: TabsScreen(_favoriteMeal),

      routes: {
        'home' : (context)=>  TabsScreen(_favoriteMeal),

        CategoryMealsScreen.routeName : (context)=> CategoryMealsScreen(_availbleMeal),
        MealDetailScreen.routeName : (context)=> MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreens.routeName:(context)=> FiltersScreens( _setFilters , _filters),

        //   'CategoryMeals' : (context)=> const CategoryMealsScreen(),

      },
    );
  }
}





class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal App")),
      body: null,
    );
  }
}

