import 'package:flutter/material.dart';

void main() => runApp(ArjunApp());

class ArjunApp extends StatelessWidget {
 @override Widget build(BuildContext context) { return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()); }
}
class HomePage extends StatelessWidget {
  final items = [
    {'ta': 'Games', 'en': 'Games', 'icon': Icons.sports_esports},
    {'ta': 'Food Order', 'en': 'Food', 'icon': Icons.fastfood},
    {'ta': 'Dress Order', 'en': 'Dress', 'icon': Icons.checkroom},
    {'ta': 'Jobs', 'en': 'Jobs', 'icon': Icons.work},
    {'ta': 'Movies', 'en': 'Movies', 'icon': Icons.movie},
    {'ta': 'Travel', 'en': 'Travel', 'icon': Icons.directions_bus},
    {'ta': 'Notifications', 'en': 'Notifs', 'icon': Icons.notifications},
    {'ta': 'Arjun Special', 'en': 'Special', 'icon': Icons.stars},
  ];
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFFAF5FF), body: Column(children: [
      Container(padding: EdgeInsets.fromLTRB(20, 60, 20, 40), decoration: BoxDecoration(color: Color(0xFF7C3AED), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Center(child: Text('ARJUN MASTERMIND', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))), SizedBox(height: 20), Text('Vanakkam Nagarjun!', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),])),
      Expanded(child: GridView.builder(padding: EdgeInsets.all(16), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9), itemCount: items.length, itemBuilder: (ctx, i) => GestureDetector(onTap: () { 
        if (i == 0) Navigator.push(context, MaterialPageRoute(builder: (_) => GamesHubPage())); 
        else if (i == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => FoodHubPage())); 
        else if (i == 4) Navigator.push(context, MaterialPageRoute(builder: (_) => MovieHubPage())); 
        else Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: items[i]['ta'] as String))); 
      }, child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(items[i]['icon'] as IconData, size: 40, color: Color(0xFF7C3AED)), SizedBox(height: 8), Text(items[i]['ta'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11), textAlign: TextAlign.center),])))))
    ]));
  }
}
class DetailPage extends StatelessWidget { final String title; DetailPage({required this.title}); @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text(title), backgroundColor: Color(0xFF7C3AED)), body: Center(child: Text('$title Coming Soon da!'))); } }
class GamesHubPage extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Games Hub'), backgroundColor: Colors.orange), body: ListView(padding: EdgeInsets.all(16), children: [Card(child: ListTile(leading: Icon(Icons.grid_3x3, size: 40, color: Colors.orange), title: Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TicTacToePage())))), Card(child: ListTile(leading: Icon(Icons.memory, size: 40, color: Colors.purple), title: Text('Memory Match', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MemoryPage())))), Card(child: ListTile(leading: Icon(Icons.quiz, size: 40, color: Colors.green), title: Text('Arjun Quiz', style: TextStyle(fontWeight: FontWeight.bold)), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizPage())))),])); } }
class TicTacToePage extends StatefulWidget { @override State<TicTacToePage> createState() => _TicTacToePageState(); }
class _TicTacToePageState extends State<TicTacToePage> { List<String> board = List.filled(9, ''); bool xTurn = true; String win = ''; void check(){ List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]; for(var p in w){ if(board[p[0]]!='' && board[p[0]]==board[p[1]] && board[p[1]]==board[p[2]]){ win=board[p[0]]; return; } } if(!board.contains('')) win='Draw'; } @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Tic Tac Toe')), body: Column(children: [SizedBox(height:20), Text(win==''? '${xTurn?"X":"O"} Turn' : '$win Wins', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), Expanded(child: GridView.builder(padding: EdgeInsets.all(20), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3), itemCount:9, itemBuilder: (c,i)=> GestureDetector(onTap: (){ if(board[i]=='' && win==''){ setState((){ board[i]=xTurn?'X':'O'; xTurn=!xTurn; check(); }); } }, child: Card(child: Center(child: Text(board[i], style: TextStyle(fontSize:40))))))), ElevatedButton(onPressed: ()=> setState((){ board=List.filled(9,''); win=''; xTurn=true; }), child: Text('Restart')), SizedBox(height:20)])); } }
class MemoryPage extends StatefulWidget { @override State<MemoryPage> createState() => _MemoryPageState(); }
class _MemoryPageState extends State<MemoryPage> { List<int> nums = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]; List                                                                                                                                                                                                                                                                                                    import 'package:flutter/material.dart'void main() => runApp(const ArjunApp());

class ArjunApp extends StatelessWidget {
  const ArjunApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [;
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
      backgroundColor: const Color(0xFFFAF5FF),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
            decoration: const BoxDecoration(
              color: Color(0xFF7C3AED),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('ARJUN MASTERMIND',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Text('Vanakkam Nagarjun!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9),
              itemCount: items.length,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const GamesHubPage()));
                    } else if (i == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const FoodHubPage()));
                    } else if (i == 4) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const MovieHubPage()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailPage(
                                  title: items[i]['ta'] as String)));
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(items[i]['icon'] as IconData,
                            size: 40, color: const Color(0xFF7C3AED)),
                        const SizedBox(height: 8),
                        Text(items[i]['ta'] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                            textAlign: TextAlign.center),
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
  const DetailPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title), backgroundColor: const Color(0xFF7C3AED)),
      body: Center(child: Text('$title Coming Soon da!')),
    );
  }
}

// GAMES
class GamesHubPage extends StatelessWidget {
  const GamesHubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games Hub'), backgroundColor: Colors.orange),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
              child: ListTile(
                  leading: const Icon(Icons.grid_3x3, size: 40, color: Colors.orange),
                  title: const Text('Tic Tac Toe',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const TicTacToePage())))),
          Card(
              child: ListTile(
                  leading: const Icon(Icons.memory, size: 40, color: Colors.purple),
                  title: const Text('Memory Match',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MemoryPage())))),
          Card(
              child: ListTile(
                  leading: const Icon(Icons.quiz, size: 40, color: Colors.green),
                  title: const Text('Arjun Quiz',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const QuizPage())))),
        ],
      ),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});
  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String win = '';

  void checkWin() {
    List<List<int>> w = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var p in w) {
      if (board[p[0]] != '' &&
          board[p[0]] == board[p[1]] &&
          board[p[1]] == board[p[2]]) {
        win = board[p[0]];
        return;
      }
    }
    if (!board.contains('')) win = 'Draw';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(win == '' ? '${xTurn ? "X" : "O"} Turn' : '$win Wins',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (c, i) => GestureDetector(
                onTap: () {
                  if (board[i] == '' && win == '') {
                    setState(() {
                      board[i] = xTurn ? 'X' : 'O';
                      xTurn = !xTurn;
                      checkWin();
                    });
                  }
                },
                child: Card(
                    child: Center(
                        child: Text(board[i],
                            style: const TextStyle(fontSize: 40)))),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  board = List.filled(9, '');
                  win = '';
                  xTurn = true;
                });
              },
              child: const Text('Restart')),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class MemoryPage extends StatefulWidget {
  const MemoryPage({super.key});
  @override
  State<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  List<int> nums = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8];
  List<bool> show = List.filled(16, false);
  int? first;

  @override
  void initState() {
    super.initState();
    nums.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Memory')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: 16,
        itemBuilder: (c, i) => GestureDetector(
          onTap: () {
            if (show[i]) return;
            setState(() => show[i] = true);
            if (first == null) {
              first = i;
            } else {
              if (nums[first!] == nums[i]) {
                first = null;
              } else {
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    show[first!] = false;
                    show[i] = false;
                    first = null;
                  });
                });
              }
            }
          },
          child: Card(
            color: show[i] ? Colors.white : const Color(0xFF7C3AED),
            child: Center(
                child: Text(show[i] ? '${nums[i]}' : '?',
                    style: const TextStyle(fontSize: 24))),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int q = 0;
  int score = 0;
  List<Map<String, dynamic>> list = [
    {'q': 'Tamil Nadu capital enna?', 'o': ['Chennai', 'Madurai', 'Trichy'], 'a': 0},
    {'q': 'Arjun creator yaaru?', 'o': ['Nagarjun', 'Rajini', 'Kamal'], 'a': 0},
    {'q': 'Flutter by?', 'o': ['Google', 'Meta', 'Apple'], 'a': 0}
  ];

  @override
  Widget build(BuildContext context) {
    if (q >= list.length) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score $score/${list.length}',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      q = 0;
                      score = 0;
                    });
                  },
                  child: const Text('Again')),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Quiz ${q + 1}/${list.length}')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(list[q]['q'] as String,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...List.generate(
                3,
                (i) => Card(
                      child: ListTile(
                        title: Text(list[q]['o'][i] as String),
                        onTap: () {
                          if (i == list[q]['a']) score++;
                          setState(() => q++);
                        },
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}

// FOOD - 5 PLATFORMS + 38 DISTRICTS
class FoodHubPage extends StatefulWidget {
  const FoodHubPage({super.key});
  @override
  State<FoodHubPage> createState() => _FoodHubPageState();
}

class _FoodHubPageState extends State<FoodHubPage> {
  String selectedDistrict = 'Chennai';
  String selectedPlatform = 'Swiggy';

  final List<String> districts = [
    'Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode',
    'Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai',
    'Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet',
    'Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli',
    'Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'
  ];

  final Map<String, List<Map<String, dynamic>>> platformData = const {
    'Swiggy': [
      {'name': 'Chicken Biryani', 'price': 250, 'shop': 'SS Hyderabad'},
      {'name': 'Mutton Biryani', 'price': 350, 'shop': 'Thalappakatti'},
      {'name': 'Parotta Set', 'price': 120, 'shop': 'Burma Kadai'},
      {'name': 'Meals', 'price': 150, 'shop': 'Sangeethas'},
    ],
    'Zomato': [
      {'name': 'Fried Rice', 'price': 220, 'shop': 'Zomato Kitchen'},
      {'name': 'Burger Combo', 'price': 199, 'shop': 'Burger King'},
      {'name': 'Shawarma', 'price': 180, 'shop': 'Al Bek'},
    ],
    'Zepto': [
      {'name': 'Milk 500ml', 'price': 32, 'shop': 'Zepto Cafe'},
      {'name': 'Maggi 4pack', 'price': 52, 'shop': 'Zepto Super'},
    ],
    'Blinkit': [
      {'name': 'Milk 1L', 'price': 60, 'shop': 'Blinkit Mart'},
      {'name': 'Bread Loaf', 'price': 45, 'shop': 'Blinkit Mart'},
    ],
    'BigBasket': [
      {'name': 'Tomato 1kg', 'price': 35, 'shop': 'BigBasket Fresh'},
      {'name': 'Rice 10kg', 'price': 650, 'shop': 'BigBasket Daily'},
    ],
  };

  List<Map<String, dynamic>> cart = [];

  int get total {
    int s = 0;
    for (var e in cart) {
      s += e['price'] as int;
    }
    return s;
  }

  Color getPlatformColor(String p) {
    if (p == 'Swiggy') return Colors.orange;
    if (p == 'Zomato') return const Color(0xFFE23744);
    if (p == 'Zepto') return const Color(0xFF8B3CF7);
    if (p == 'Blinkit') return const Color(0xFFFACC15);
    return const Color(0xFF84CC16);
  }

  @override
  Widget build(BuildContext context) {
    var foods = platformData[selectedPlatform]!;
    Color pColor = getPlatformColor(selectedPlatform);

    return Scaffold(
      appBar: AppBar(
          title: Text('Food - $selectedPlatform'), backgroundColor: pColor),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedDistrict,
                      isExpanded: true,
                      items: districts
                          .map((d) => DropdownMenuItem(
                              value: d,
                              child: Text(d,
                                  style: const TextStyle(fontSize: 13))))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            selectedDistrict = val;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: ['Swiggy', 'Zomato', 'Zepto', 'Blinkit', 'BigBasket']
                  .map((p) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(p),
                          selected: selectedPlatform == p,
                          onSelected: (v) {
                            setState(() {
                              selectedPlatform = p;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: foods.length,
              itemBuilder: (c, i) {
                return Card(
                  child: ListTile(
                    title: Text(foods[i]['name']),
                    subtitle: Text(
                        'Rs.${foods[i]['price']} - ${foods[i]['shop']} - $selectedDistrict'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cart.add({
                            'name': foods[i]['name'],
                            'price': foods[i]['price'],
                            'platform': selectedPlatform,
                            'shop': foods[i]['shop']
                          });
                        });
                      },
                      child: const Text('ADD'),
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

// MOVIE - 38 DISTRICTS WITH THEATERS
class MovieHubPage extends StatefulWidget {
  const MovieHubPage({super.key});
  @override
  State<MovieHubPage> createState() => _MovieHubPageState();
}

class _MovieHubPageState extends State<MovieHubPage> {
  String selectedDistrict = 'Chennai';

  final List<String> districts = [
    'Ariyalur','Chengalpattu','Chennai','Coimbatore','Cuddalore','Dharmapuri','Dindigul','Erode',
    'Kallakurichi','Kanchipuram','Kanyakumari','Karur','Krishnagiri','Madurai','Mayiladuthurai',
    'Nagapattinam','Namakkal','Nilgiris','Perambalur','Pudukkottai','Ramanathapuram','Ranipet',
    'Salem','Sivaganga','Tenkasi','Thanjavur','Theni','Thoothukudi','Tiruchirappalli','Tirunelveli',
    'Tirupattur','Tiruppur','Tiruvallur','Tiruvannamalai','Tiruvarur','Vellore','Viluppuram','Virudhunagar'
  ];

  List<String> getTheatersForDistrict(String district) {
    Map<String, List<String>> fixed = {
      'Chennai': ['Sathyam Cinemas', 'PVR VR Mall', 'INOX Citi Center', 'Rohini Silver Screens'],
      'Coimbatore': ['KG Cinemas', 'INOX Prozone', 'The Cinema', 'Broadway Cinemas'],
      'Madurai': ['Vetri Cinemas', 'INOX Visal Mall', 'Thangam Cinemas', 'Sundar Theater'],
      'Salem': ['ARRS Multiplex', 'Kailash Prakash', 'Royal Cinemas', 'Big Cinemas'],
    };
    if (fixed.containsKey(district)) return fixed[district]!;
    return [
      '$district Sathyam Cinemas',
      'PVR $district',
      'INOX $district',
      'Arjun Multiplex $district',
      'City $district Talkies',
    ];
  }

  final List<Map<String, dynamic>> movies = const [
    {'title': 'Leo 2', 'rating': '4.5', 'type': 'Action', 'price': 180},
    {'title': 'Vikram Returns', 'rating': '4.7', 'type': 'Thriller', 'price': 200},
    {'title': 'Jailer 2', 'rating': '4.6', 'type': 'Comedy', 'price': 190},
    {'title': 'PS 3', 'rating': '4.8', 'type': 'Historical', 'price': 220},
    {'title': 'Thunivu 2', 'rating': '4.4', 'type': 'Action', 'price': 170},
    {'title': 'KGF 3', 'rating': '4.9', 'type': 'Action', 'price': 250},
  ];

  @override
  Widget build(BuildContext context) {
    List<String> theaters = getTheatersForDistrict(selectedDistrict);

    return Scaffold(
      backgroundColor: const Color(
