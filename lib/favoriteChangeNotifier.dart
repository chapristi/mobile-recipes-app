import 'package:flutter/foundation.dart';
class FavoriteChangeNotifier with ChangeNotifier{
  bool _isFavorite;
  final int _favoriteCount;
  FavoriteChangeNotifier(this._isFavorite,this._favoriteCount);
  bool get isFavorite => _isFavorite;
  int get favoriteCount => _favoriteCount + (_isFavorite ? 1 :0);
  set isFavorite(bool isFavorite){
    _isFavorite = isFavorite;
    notifyListeners();
  }


}