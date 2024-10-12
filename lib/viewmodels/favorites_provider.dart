import 'dart:convert';

import 'package:assignment/models/webtoon_category.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<WebtoonCategory> _favorites = [];

  List<WebtoonCategory> get favorites => _favorites;

  void addFavorite(WebtoonCategory webtoon) {
    // Check if the webtoon is already a favorite
    int index = _favorites.indexWhere((item) => item.title == webtoon.title);
    if (index == -1) {
      _favorites.add(webtoon);
    } else {
      _favorites[index] = webtoon; // Update existing favorite with new info (including rating)
    }
    notifyListeners();
    saveFavoritesToStorage();
  }

  void updateFavoriteRating(String title, double rating) {
    int index = _favorites.indexWhere((item) => item.title == title);
    if (index != -1) {
      _favorites[index].rating = rating;
      notifyListeners();
      saveFavoritesToStorage();
    }
  }

  Future<void> saveFavoritesToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorites',
      _favorites.map((e) => jsonEncode(e.toJson())).toList(),
    );
  }

  Future<void> loadFavoritesFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteStrings = prefs.getStringList('favorites') ?? [];
    _favorites = favoriteStrings
        .map((e) => WebtoonCategory.fromJson(jsonDecode(e)))
        .toList();
    notifyListeners();
  }
}
