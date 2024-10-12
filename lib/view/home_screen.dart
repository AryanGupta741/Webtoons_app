import 'package:assignment/view/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';
import '../models/webtoon_category.dart';

class HomeScreen extends StatelessWidget {
  final List<WebtoonCategory> categories = [
    WebtoonCategory("Romance", "assets/romance.jpg"),
    WebtoonCategory("Action", "assets/action.jpg"),
    WebtoonCategory("Comedy", "assets/comdey.jpg"),
    // Add more categories...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Webtoon Explorer'), leading: IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );
  },
)),
      body: GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(category: category)),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(category.thumbnail),
                  Text(category.title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
