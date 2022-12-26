import 'package:flutter/material.dart';
import 'package:untitled3/recipe.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled3/recipeScreen.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        false,
        1444),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        50),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        false,
        774),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
    Recipe(
        "Pizza facile",
        "Par Louis",
        "https://www.cometemenorca.com/static/uploads/pizzas.jpg",
        "faire cuire...",
        true,
        68),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes recettes "),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeItemWidget(recipe: recipes[index]);
            }));
  }
}

class RecipeItemWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeItemWidget({
    required this.recipe,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/recipe", arguments: recipe);
      },
      child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 8,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  FadeInImage.memoryNetwork(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: recipe.imageUrl,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        recipe.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text(
                      recipe.user,
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
