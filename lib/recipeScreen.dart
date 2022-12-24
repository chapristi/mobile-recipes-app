import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled3/favoriteChangeNotifier.dart';
import 'package:untitled3/favoriteWidget.dart';
import 'package:untitled3/recipe.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeScreen({
    required this.recipe,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Widget actionsSection = Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(Colors.green, Icons.share, "partage"),
            _buildButtonColumn(Colors.green, Icons.comment, "comment")
          ],
        )
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),

      child:Text(recipe.description,softWrap: true,),

    );

    Widget titleSection = Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            //expanded dis juste de prendre tout la place disponible en laissant la place pour le coeur et le text
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(recipe.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ))),
                      Text(recipe.user,
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontFamily: 'RaleWay',
                        )),
                  ],
                )),
              FavoriteIconWidget(),
              FavoriteTextWidget()
          ],
        ));
    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("mes recettes"),
          ),
          body: ListView(
              children: [
                Stack(children: [
                  Container(
                    width: 600,
                    height: 240,
                    child: const Center(child:CircularProgressIndicator()),
                  ),
                  FadeInImage.memoryNetwork(
                    height: 240,
                    width: 600,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: recipe.imageUrl,
                  )
                ],),

                titleSection,
                actionsSection,
                descriptionSection,
              ])),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Icon(icon, color: color),
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.blueGrey
          ),
        )
      ],
    );
  }

}


