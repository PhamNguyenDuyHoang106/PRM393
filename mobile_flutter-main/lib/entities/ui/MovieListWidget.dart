import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Movie.dart';
import 'MovieWidget.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movies;

  const MovieListWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🔍',
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 16),
              Text(
                'No movies found matching your filters.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // crossAxisCount: context.maxWidth < 450 ? 1 : 2
        // Chú ý: Ở đây ta dùng constraints.maxWidth từ LayoutBuilder
        final int crossAxisCount = constraints.maxWidth < 450 ? 1 : 2;

        return MasonryGridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: movies.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return MovieWidget(movie: movies[index]);
          },
        );
      },
    );
  }
}
