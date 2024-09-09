import 'package:flutter/material.dart';

class FoodRecipes extends StatelessWidget {
  const FoodRecipes({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200, // Set the height of the header when expanded
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // Add the background image
                Image.network(
                  'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=40',
                  fit: BoxFit.cover,
                ),
                // Add the overlay with opacity
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
                // Add the title with scaling and fading effect
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: 500),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Transform.scale(
                          scale: 1 + value, // Scale factor for the title
                          child: Opacity(
                            opacity: 1 - value, // Opacity factor for the title
                            child: const Text(
                              'Parallax Header',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Other properties like pinned, floating, elevation, etc.
          // can be customized as needed
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // Build the list of items
              return ListTile(
                title: Text('Item $index'),
              );
            },
            childCount: 20, // Number of items in the list
          ),
        ),
      ],
    );
  }
}
