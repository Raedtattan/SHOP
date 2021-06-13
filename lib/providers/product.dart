import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Product with ChangeNotifier {

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  //check set favorite products
  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  //toggel favorit product true or false
  Future<void> toggelFavoritesStatus(String token, String userid) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final url = 'https://shop-84aef-default-rtdb.firebaseio.com/userFavorites/$userid/$id.json?auth=$token';
    try {
      //http.put we use to modify one value f
      final res = await http.put(url, body: json.encode(isFavorite));
      if (res.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (e) {
      _setFavValue(oldStatus);
    }
  }
}
