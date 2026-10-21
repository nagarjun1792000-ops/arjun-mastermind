import 'package:flutter/material.dart';

void main() {
  runApp(ArjunApp());
}

class ArjunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'ta': 'Games', 'icon': Icons.sports_esports},
      {'ta': 'Food Order', 'icon': Icons.fastfood},
      {'ta': 'Dress Order', 'icon': Icons.checkroom},
      {'ta': 'Jobs', 'icon': Icons.work},
      {'ta': 'Movies', 'icon': Icons.movie},
      {'ta': 'Travel', 'icon': Icons.directions_bus},
      {'ta': 'Notifications', 'icon': Icons.notifications},
      {'ta': 'Arjun Special', 'icon': Icons.stars},
    ];

    return Scaffold(
      backgroundColor: Color(0xFFFAF5FF),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 40),
            decoration: BoxDecoration(
              color: Color(0xFF7C3AED),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'ARJUN MASTERMIND',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Vanakkam Nagarjun!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GamesHubPage(),
                        ),
                      );
                    } else if (i == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FoodHubPage(),
                        ),
                      );
                    } else if (i == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieNowShowingPage(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            title: items[i]['ta'].toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[i]['icon'] as IconData,
                          size: 40,
                          color: Color(0xFF7C3AED),
                        ),
                        SizedBox(height: 8),
                        Text(
                          items[i]['ta'].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  DetailPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Center(
        child: Text('$title Coming Soon da!'),
      ),
    );
  }
}

class GamesHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games Hub'),
        backgroundColor: Colors.orange,
      ),
      body: Center(child: Text('Games Coming')),
    );
  }
}

class FoodHubPage extends StatefulWidget {
  @override
  _FoodHubPageState createState() => _FoodHubPageState();
}

class _FoodHubPageState extends State<FoodHubPage> {
  String selectedDistrict = 'Chennai';
  List<String> districts = [
    'Ariyalur',
    'Chengalpattu',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dharmapuri',
    'Dindigul',
    'Erode',
    'Kallakurichi',
    'Kanchipuram',
    'Kanyakumari',
    'Karur',
    'Krishnagiri',
    'Madurai',
    'Mayiladuthurai',
    'Nagapattinam',
    'Namakkal',
    'Nilgiris',
    'Perambalur',
    'Pudukkottai',
    'Ramanathapuram',
    'Ranipet',
    'Salem',
    'Sivaganga',
    'Tenkasi',
    'Thanjavur',
    'Theni',
    'Thoothukudi',
    'Tiruchirappalli',
    'Tirunelveli',
    'Tirupattur',
    'Tiruppur',
    'Tiruvallur',
    'Tiruvannamalai',
    'Tiruvarur',
    'Vellore',
    'Viluppuram',
    'Virudhunagar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food - $selectedDistrict')),
      body: Center(
        child: Text('Food Module Works da! $selectedDistrict'),
      ),
    );
  }
}

// MOVIE - BOOKMYSHOW STYLE
class MovieNowShowingPage extends StatefulWidget {
  @override
  _MovieNowShowingPageState createState() => _MovieNowShowingPageState();
}

class _MovieNowShowingPageState extends State<MovieNowShowingPage> {
  String selectedDistrict = 'Coimbatore';
  String selectedFilter = 'Tamil';

  List<String> districts = [
    'Ariyalur',
    'Chengalpattu',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dharmapuri',
    'Dindigul',
    'Erode',
    'Kallakurichi',
    'Kanchipuram',
    'Kanyakumari',
    'Karur',
    'Krishnagiri',
    'Madurai',
    'Mayiladuthurai',
    'Nagapattinam',
    'Namakkal',
    'Nilgiris',
    'Perambalur',
    'Pudukkottai',
    'Ramanathapuram',
    'Ranipet',
    'Salem',
    'Sivaganga',
    'Tenkasi',
    'Thanjavur',
    'Theni',
    'Thoothukudi',
    'Tiruchirappalli',
    'Tirunelveli',
    'Tirupattur',
    'Tiruppur',
    'Tiruvallur',
    'Tiruvannamalai',
    'Tiruvarur',
    'Vellore',
    'Viluppuram',
    'Virudhunagar'
  ];

  List<Map<String, dynamic>> allMovies = [
    {'title': 'Jailer 2', 'likes': '367K+', 'type': 'likes', 'lang': 'Tamil', 'color': Colors.brown},
    {'title': 'Street Fighter', 'rating': '7.3', 'votes': '3.6K+', 'lang': 'English', 'color': Colors.red},
    {'title': 'Drones', 'rating': '8.9', 'votes': '1.4K+', 'lang': 'Tamil', 'color': Colors.deepOrange},
    {'title': 'Baththa', 'rating': '9.2', 'votes': '37.2K+', 'lang': 'Tamil', 'color': Colors.orange},
    {'title': 'Leo 2', 'likes': '420K+', 'type': 'likes', 'lang': 'Tamil', 'color': Colors.red},
    {'title': 'Vikram Returns', 'rating': '8.5', 'votes': '12K+', 'lang': 'Tamil', 'color': Colors.black87},
    {'title': 'KGF 3', 'rating': '9.0', 'votes': '50K+', 'lang': 'Kannada', 'color': Colors.amber},
    {'title': 'Avatar 3', 'rating': '8.8', 'votes': '22K+', 'lang': 'English', 'color': Colors.teal},
    {'title': 'Jawan 2', 'likes': '290K+', 'type': 'likes', 'lang': 'Hindi', 'color': Colors.deepOrange},
    {'title': 'Thunivu 2', 'rating': '7.9', 'votes': '8K+', 'lang': 'Tamil', 'color': Colors.blue},
    {'title': 'PS 3', 'rating': '8.7', 'votes': '15K+', 'lang': 'Tamil', 'color': Colors.brown},
    {'title': 'Dune 2', 'rating': '8.6', 'votes': '9K+', 'lang': 'English', 'color': Colors.brown},
  ];

  List<Map<String, dynamic>> get filteredMovies {
    if (selectedFilter == 'All') return allMovies;
    if (selectedFilter == 'New Releases') return allMovies;
    return allMovies.where((m) => m['lang'] == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Showing',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '$selectedDistrict | ${filteredMovies.length} Movies',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.location_city, color: Colors.red, size: 18),
                SizedBox(width: 6),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedDistrict,
                      isExpanded: true,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      items: districts
                          .map((d) => DropdownMenuItem(
                                value: d,
                                child: Text(d),
                              ))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) {
                          setState(() => selectedDistrict = v);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 24,
                    color: Colors.grey.shade300,
                    margin: EdgeInsets.only(right: 8),
                  ),
                  filterChip('All', selectedFilter == 'All'),
                  filterChip('New Releases', selectedFilter == 'New Releases'),
                  filterChip('Tamil', selectedFilter == 'Tamil'),
                  filterChip('English', selectedFilter == 'English'),
                  filterChip('Hindi', selectedFilter == 'Hindi'),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.62,
              ),
              itemCount: filteredMovies.length,
              itemBuilder: (c, i) {
                var m = filteredMovies[i];
                bool isLikes = m['type'] == 'likes';
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeatBookingPage(
                        movie: m,
                        district: selectedDistrict,
                      ),
                    ),
                  ),
                  child: Column(
                   
