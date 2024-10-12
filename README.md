# Webtoon Explorer App

Welcome to the **Webtoon Explorer App**! This Flutter application allows users to explore popular webtoons, manage their favorites, and rate them.

## Features

- **Home Screen**: Displays a list of webtoon categories, each with a title and thumbnail image.
- **Detail Screen**: Shows details of a selected webtoon, including an image, description, and an "Add to Favorites" button.
- **Favorites Screen**: Allows users to view and manage their saved favorites.
- **Rating Feature**: Users can rate their favorite webtoons (1-5 stars), with the average rating displayed dynamically.
- **Persistent Storage**: Uses `SharedPreferences` or `Hive` to store and retrieve user favorites and ratings.

## App Flow

1. **Home Screen**: 
   - A grid view of webtoon categories is displayed. Tapping a category navigates to the detail screen.
   
2. **Detail Screen**: 
   - Displays the selected webtoon’s details and allows users to add the webtoon to their favorites and rate it.

3. **Favorites Screen**: 
   - Users can view their list of favorite webtoons, which are stored persistently.

## File Structure

