import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../viewmodels/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: favoritesProvider.favorites.isNotEmpty
          ? ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final favorite = favoritesProvider.favorites[index];
                return ListTile(
                  leading: Image.asset(
                    favorite.thumbnail, // Display the image (asset or network)
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(favorite.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rating: ${favorite.rating.toStringAsFixed(1)}'),
                      RatingBar.builder(
                        initialRating: favorite.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          favoritesProvider.updateFavoriteRating(favorite.title, rating);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${favorite.title} rating updated to $rating')),
                          );
                        },
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.favorite, color: Colors.red),
                );
              },
            )
          : Center(child: Text('No favorites added yet.')),
    );
  }
}
