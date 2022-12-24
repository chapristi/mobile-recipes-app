import 'package:flutter/material.dart';
import 'package:untitled3/recipe.dart';
import 'package:untitled3/recipeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: RecipeScreen(
        recipe: Recipe(
          "Pizza facile",
          "Proposé par Louis",
          "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
          "1- Faire cuire ....\n2- Préchauffez le four à 180°c.\n3- Otez la croûte des tranches de pain. Tapissez en le fond d'un moule rectangulaire 20x30 .\n4- Dans un saladier, fouettez les œufs avec le lait et le fromage blanc. ",
          false,
          50)),
    );
  }
}



