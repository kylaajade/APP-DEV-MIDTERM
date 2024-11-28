import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<String> stories;
  final List<String> posts;

  const HomeScreen({
    Key? key,
    required this.stories,
    required this.posts,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Color> _storyColors;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeStoryColors();
  }

  void _initializeStoryColors() {
    _storyColors = List<Color>.filled(
      widget.stories.length,
      Colors.pinkAccent, // Default pastel pink for stories
    );
  }

  void _toggleStoryColor(int index) {
    setState(() {
      _storyColors[index] = _storyColors[index] == Colors.pinkAccent
          ? Colors.pink // Toggle to a softer pastel pink
          : Colors.pinkAccent; // Revert to pastel pink
    });
    print("Tapped on: ${widget.stories[index]}");
  }

  void _addPost(String name) {
    setState(() {
      widget.posts.add(name);
    });
  }

  void _removePost(int index) {
    setState(() {
      widget.posts.removeAt(index);
    });
  }

  void _showNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enter Post Name"),
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: "Type your post name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final name = _nameController.text;
              if (name.isNotEmpty) {
                _addPost(name);
                _nameController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildStories(),
          Expanded(child: _buildPosts()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNameDialog,
        child: const Icon(Icons.add),
        backgroundColor: Colors.pinkAccent, // Pastel pink button for contrast
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)), // Button shape
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF8BBD0), // Soft pastel pink for gradient start
              Color(0xFFF48FB1), // Slightly deeper pastel pink for gradient end
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent, // Transparent app bar
          title: const Text("OLAH FRIENDS", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.stories.length,
        itemBuilder: (context, index) => _buildStoryItem(index),
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _toggleStoryColor(index),
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _storyColors[index], // Using pastel pink color for stories
            image: DecorationImage(
              image: NetworkImage(
                'https://www.w3schools.com/w3images/avatar2.png', // Placeholder image for story
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              widget.stories[index],
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPosts() {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) => _buildPostItem(index),
    );
  }

  Widget _buildPostItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => _removePost(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6.0)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.posts[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFFEC407A), // Pastel pink color for text
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up, color: Color(0xFFEC407A)), // Pink icon for likes
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment, color: Color(0xFFEC407A)), // Pink icon for comments
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark, color: Color(0xFFEC407A)), // Pink icon for bookmarks
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
