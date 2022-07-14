// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_ignore
enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordaility{
  Affordable,
  Pricey,
  Luxurious,

}
class Meal {
  final String id;
  final String title;
  final String imageURL;
  final List<String> category;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordaility affordaility;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarin;

  Meal({
      @required this.id,
      @required this.title,
      @required this.imageURL,
      @required this.category,
      @required this.ingredients,
      @required  this.steps,
      @required   this.duration,
      @required this.complexity,
      @required this.affordaility,
      @required  this.isGlutenFree,
      @required  this.isLactoseFree,
      @required  this.isVegan,
      @required  this.isVegetarin});
}
