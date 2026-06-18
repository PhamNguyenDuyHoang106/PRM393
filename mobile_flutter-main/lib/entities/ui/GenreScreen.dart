import 'package:flutter/material.dart';
import '../../data.dart';
import 'Movie.dart';
import 'MovieListWidget.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  // State quản lý
  String selectedSort = "A-Z";
  final List<String> selectedGenres = [];
  final TextEditingController searchController = TextEditingController();

  // Danh sách Genre
  final List<String> genresList = [
    "Action",
    "Drama",
    "Comedy",
    "Sci-Fi",
    "Animation",
  ];

  // Danh sách Sort
  final List<String> sortOptions = [
    "A-Z",
    "Z-A",
    "Year",
    "Rating",
  ];

  @override
  void initState() {
    super.initState();
    // Lắng nghe thay đổi của searchController để re-render khi gõ
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  // Hàm quan trọng nhất
  List<Movie> getVisibleMovies() {
    // Clone allMovies list
    List<Movie> movies = List.from(Data.allMovies);

    // Bước 1: Lọc theo Search (matchesSearch)
    final String searchText = searchController.text.trim().toLowerCase();
    if (searchText.isNotEmpty) {
      movies = movies.where((movie) {
        return movie.title.toLowerCase().contains(searchText);
      }).toList();
    }

    // Bước 2: Lọc theo Genre (matchesGenre)
    if (selectedGenres.isNotEmpty) {
      movies = movies.where((movie) {
        // Trả về true nếu phim có chứa bất kỳ genre nào đang được chọn
        return selectedGenres.any((genre) => movie.genres.contains(genre));
      }).toList();
    }

    // Bước 3: Sort
    if (selectedSort == "A-Z") {
      movies.sort((a, b) => a.title.compareTo(b.title));
    } else if (selectedSort == "Z-A") {
      movies.sort((a, b) => b.title.compareTo(a.title));
    } else if (selectedSort == "Rating") {
      movies.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (selectedSort == "Year") {
      movies.sort((a, b) => b.year.compareTo(a.year));
    }

    // Bước 4: Trả kết quả
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> visibleMovies = getVisibleMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎬 Movie Browser',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          // Reset Filter button
          TextButton(
            onPressed: () {
              setState(() {
                selectedGenres.clear();
                searchController.clear();
                selectedSort = "A-Z";
              });
            },
            child: const Row(
              children: [
                Icon(Icons.refresh, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            // Panel tìm kiếm & Lọc
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tìm kiếm phim (TextField)
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search movies...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  searchController.clear();
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Filter Genre title
                  const Text(
                    'Filter by Genre',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // List of FilterChips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: genresList.map((genre) {
                        final bool isSelected = selectedGenres.contains(genre);
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Text(genre),
                            selected: isSelected,
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  selectedGenres.add(genre);
                                } else {
                                  selectedGenres.remove(genre);
                                }
                              });
                            },
                            selectedColor: Colors.black,
                            checkmarkColor: Colors.white,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: isSelected ? Colors.black : Colors.transparent,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const Divider(height: 24, thickness: 1),

                  // Sorting & Count Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Found ${visibleMovies.length} movies',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.sort, size: 18, color: Colors.black54),
                          const SizedBox(width: 4),
                          DropdownButton<String>(
                            value: selectedSort,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedSort = newValue;
                                });
                              }
                            },
                            items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Movie list content
            Expanded(
              child: MovieListWidget(movies: visibleMovies),
            ),
          ],
        ),
      ),
    );
  }
}
