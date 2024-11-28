import 'package:flutter/material.dart';
import 'homepage.dart'; // Import the HomeScreen file

void main() => runApp(const InstagramClone());

class InstagramClone extends StatelessWidget {
  const InstagramClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: HomeScreen(
        stories: _buildStories(),
        posts: _buildPosts(),
      ),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      brightness: Brightness.dark, // Keep the app dark mode
      primarySwatch: Colors.pink, // Use pastel pink as the main color
      scaffoldBackgroundColor:
          const Color(0xFFFCE4EC), // Light pastel pink background
      appBarTheme: const AppBarTheme(
        color: Color(0xFFF8BBD0), // Soft pastel pink for the app bar
        elevation: 0, // Remove app bar shadow
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.pinkAccent, // Bright pastel pink button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)), // Round button
        ),
      ),
    );
  }

  List<String> _buildStories() {
    return [
      "User 1",
      "User 2",
      "User 3",
      "User 4",
      "User 5",
    ];
  }

  List<String> _buildPosts() {
    return [
      "Beautiful sunset at the beach",
      "Delicious brunch with friends",
      "Hiking adventure in the mountains",
    ];
  }
}
