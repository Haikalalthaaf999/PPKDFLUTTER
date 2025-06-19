import 'package:belajar_flutter/Tugas%2014/api/api.dart';
import 'package:belajar_flutter/Tugas%2014/models/model.dart';
import 'package:belajar_flutter/Tugas%2014/view/detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2D3748), // Abu-abu tua
        scaffoldBackgroundColor: const Color(
          0xFFF7FAFC,
        ), // Latar putih kebiruan
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF2D3748)),
          titleLarge: TextStyle(
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D3748),
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFED8936), // Oranye cerah
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const AnimeHomeScreen(),
    );
  }
}

class AnimeHomeScreen extends StatefulWidget {
  const AnimeHomeScreen({super.key});

  @override
  State<AnimeHomeScreen> createState() => _AnimeHomeScreenState();
}

class _AnimeHomeScreenState extends State<AnimeHomeScreen>
    with SingleTickerProviderStateMixin {
  late Future<Welcome> futureAnime;
  int _selectedIndex = 0; // Default to "Top Anime" tab
  final List<String> _tabs = ['Top Anime', 'Upcoming', 'Popular', 'Favorites'];
  List<Datum> filteredAnime = [];
  String searchQuery = '';
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    _fetchAndShuffleData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fetchAndShuffleData() {
    setState(() {
      futureAnime = ApiService.fetchTopAnime();
    });
    futureAnime
        .then((value) {
          setState(() {
            filteredAnime = List.from(value.data)
              ..shuffle(); // Salin dan acak data
          });
        })
        .catchError((error) {
          print("Error fetching data: $error");
        });
  }

  void _refreshData() {
    _fetchAndShuffleData(); // Gunakan fungsi yang sama untuk refresh
  }

  void _filterSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      if (searchQuery.isEmpty) {
        _fetchAndShuffleData(); // Ambil dan acak ulang jika pencarian kosong
      } else {
        futureAnime
            .then((value) {
              setState(() {
                filteredAnime =
                    value.data
                        .where(
                          (anime) =>
                              anime.title.toLowerCase().contains(searchQuery),
                        )
                        .toList();
              });
            })
            .catchError((error) {
              print("Error filtering data: $error");
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wibu Nets', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshData,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2D3748), Color(0xFF4A5568)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Animated Background
          AnimatedContainer(
            duration: const Duration(seconds: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE6FFFA),
                  Color(0xFFBEE3F8),
                ], // Biru muda ke cyan
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              // Decorative Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Color(0xFFED8936), size: 30),
                    const SizedBox(width: 8),
                    const Text(
                      'Bersama Wibu Membangun Negeri',
                      style: TextStyle(
                        color: Color(0xFF2D3748),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: _filterSearch,
                  style: const TextStyle(color: Color(0xFF2D3748)),
                  decoration: InputDecoration(
                    hintText: 'Search your favorite anime...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF2D3748),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              // Tab Bar
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                            _controller.reset();
                            _controller.forward();
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                _selectedIndex == index
                                    ? const Color(0xFFED8936)
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow:
                                _selectedIndex == index
                                    ? [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                    : [],
                          ),
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              color:
                                  _selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xFF2D3748),
                              fontWeight:
                                  _selectedIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Content Section with ListView.builder
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _refreshData();
                  },
                  child: FutureBuilder<Welcome>(
                    future: futureAnime,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF2D3748),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error: ${snapshot.error}",
                            style: const TextStyle(color: Color(0xFF2D3748)),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final welcome = snapshot.data!;
                        if (filteredAnime.isEmpty && searchQuery.isNotEmpty) {
                          return const Center(
                            child: Text(
                              "No results found",
                              style: TextStyle(color: Color(0xFF2D3748)),
                            ),
                          );
                        }
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: filteredAnime.length,
                            itemBuilder: (context, index) {
                              final anime = filteredAnime[index];
                              // Konversi enum Status ke string yang lebih ramah pengguna

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              AnimeDetailScreen(anime: anime),
                                    ),
                                  ).then((_) {
                                    setState(() {});
                                  });
                                },
                                onTapDown: (_) {
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform:
                                      Matrix4.identity()
                                        ..scale(index % 2 == 0 ? 1.02 : 1.0),
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(12),
                                      leading: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(15),
                                            ),
                                        child:
                                            anime.images['jpg']?.imageUrl !=
                                                    null
                                                ? Image.network(
                                                  anime
                                                      .images['jpg']!
                                                      .imageUrl!,
                                                  width: 80,
                                                  height: 120,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    print(
                                                      'Image error: $error',
                                                    );
                                                    return const Icon(
                                                      Icons.error,
                                                      size: 80,
                                                    );
                                                  },
                                                )
                                                : const Icon(
                                                  Icons.image_not_supported,
                                                  size: 80,
                                                ),
                                      ),
                                      title: Text(
                                        anime.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xFFED8936),
                                                size: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                anime.score?.toStringAsFixed(
                                                      1,
                                                    ) ??
                                                    "N/A",
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                        ],
                                      ),
                                      trailing: const Icon(
                                        Icons.play_arrow,
                                        color: Color(0xFF2D3748),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "No data available",
                            style: TextStyle(color: Color(0xFF2D3748)),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
