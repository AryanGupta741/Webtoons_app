import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'viewmodels/favorites_provider.dart';
import 'view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final favoritesProvider = FavoritesProvider();
  await favoritesProvider.loadFavoritesFromStorage();

  runApp(
    ChangeNotifierProvider(
      create: (context) => favoritesProvider,
      child: WebtoonExplorerApp(),
    ),
  );
}

class WebtoonExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
