
class Recipe{
  String title;
  String user;
  String imageUrl;
  String description;
  bool isFavorite;
  int favoriteCount;
  Recipe(this.title,this.user,this.imageUrl,this.description,this.isFavorite,this.favoriteCount);
  Map<String,dynamic> toMap(){
    return
        {
          "title" : title,
          "user" : user,
          "imageUrl" : imageUrl,
          "description" : description,
          "isFavorite" : isFavorite,
          "favoriteCount" : favoriteCount,
        };
  }
  //c'est une methode static de la class qui doit retrouner une instance de celle-ci
  factory Recipe.fromMap(Map<String,dynamic> map) => Recipe(
    map["title"],
    map["user"],
    map["imageUrl"],
    map["description"],
    map["isFavorite"],
    map["favoriteCount"],

  );

}

