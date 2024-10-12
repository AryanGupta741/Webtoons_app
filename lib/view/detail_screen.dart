import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/webtoon_category.dart';
import '../viewmodels/favorites_provider.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonCategory category;

  DetailScreen({required this.category});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _currentRating = 3.0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.category.rating;
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(widget.category.thumbnail),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description of ${widget.category.title}",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Update favorite with new rating
                widget.category.rating = _currentRating;
                favoritesProvider.addFavorite(widget.category);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${widget.category.title} added to favorites with rating $_currentRating!")),
                );
              },
              child: Text("Add to Favorites"),
            ),
            SizedBox(height: 10),
            RatingBar.builder(
              initialRating: _currentRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ), // <== Add this to define how stars are displayed
              onRatingUpdate: (rating) {
                setState(() {
                  _currentRating = rating;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
