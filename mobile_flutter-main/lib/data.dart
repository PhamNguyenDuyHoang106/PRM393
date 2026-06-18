import 'entities/ui/Movie.dart';

class Data {
  static List<Movie> allMovies = [
    Movie(
      title: "Inception",
      year: 2010,
      genres: ["Action", "Sci-Fi"],
      posterUrl: "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500&auto=format&fit=crop&q=60",
      rating: 8.8,
    ),
    Movie(
      title: "The Dark Knight",
      year: 2008,
      genres: ["Action", "Drama"],
      posterUrl: "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=500&auto=format&fit=crop&q=60",
      rating: 9.0,
    ),
    Movie(
      title: "Interstellar",
      year: 2014,
      genres: ["Sci-Fi", "Drama"],
      posterUrl: "https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&auto=format&fit=crop&q=60",
      rating: 8.6,
    ),
    Movie(
      title: "Toy Story",
      year: 1995,
      genres: ["Animation", "Comedy"],
      posterUrl: "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=500&auto=format&fit=crop&q=60",
      rating: 8.3,
    ),
    Movie(
      title: "The Hangover",
      year: 2009,
      genres: ["Comedy"],
      posterUrl: "https://images.unsplash.com/photo-1585647347483-22b66260dfff?w=500&auto=format&fit=crop&q=60",
      rating: 7.7,
    ),
  ];
}
