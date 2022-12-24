
import 'package:flutter/material.dart';
import 'package:untitled3/recipe.dart';
import 'package:untitled3/recipeListScreen.dart';
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
      initialRoute: "/" ,
      onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),

    );
  }
}

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case "/recipe":
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RecipeScreen(recipe: settings.arguments as Recipe),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return FadeTransition(opacity: animation, child: child);

              /*
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve= Curves.linearToEaseOut;
                      var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
                      return SlideTransition(
                          position: animation.drive(tween),
                          child : child
                     );

                   */
            });
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: const Text("Error"), centerTitle: true),
                body: const Center(
                  child: Text("Page not found"),
                )));
    }
  }
}

