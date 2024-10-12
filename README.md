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

lib/
│
├── models/
│   ├── webtoon_category.dart         # Data model for webtoon categories
├── providers/
│   ├── favorites_provider.dart       # Manages the list of favorites and ratings
├── screens/
│   ├── home_screen.dart              # Displays the list of webtoon categories
│   ├── detail_screen.dart            # Displays details for a selected webtoon
│   ├── favorites_screen.dart         # Displays the user's list of favorite webtoons
├── main.dart                         # App entry point contains the app's main structure


## Screenshots

<img src="https://github.com/user-attachments/assets/7506e053-24ca-424a-9200-f18a66ae794e" alt="Home Screen" width="400" />
<img src="https://github.com/user-attachments/assets/40891079-7868-4bb5-b497-b72dd58d8690" alt="Detail Screen" width="400" />
<img src="https://github.com/user-attachments/assets/fdb2fca9-5e42-4ca5-af0d-61b3867ca94f" alt="Favorites Screen" width="400" />
<img src="https://github.com/user-attachments/assets/6f1fc75b-27d1-4dc9-a8ea-12ae7fac929b" alt="Rating Feature" width="400" />
