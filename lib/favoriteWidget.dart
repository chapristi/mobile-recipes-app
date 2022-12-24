import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoriteChangeNotifier.dart';

class FavoriteIconWidget extends StatefulWidget {
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorite = false;

  void _toggleFavorite(FavoriteChangeNotifier _notifier){
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
      _notifier.isFavorite = _isFavorite;



    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier _notifier = Provider.of<FavoriteChangeNotifier>(context);
    _isFavorite = _notifier.isFavorite;
    return IconButton(
      icon : _isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: Colors.red,
      onPressed: ()=>_toggleFavorite(_notifier),
    );
  }
}



class FavoriteTextWidget extends StatefulWidget {
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build( BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
        builder: (context,notifier,_) => Text(notifier.favoriteCount.toString())
    );

  }
}


