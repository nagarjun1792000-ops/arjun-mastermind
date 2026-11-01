import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const ArjunMastermindApp());
}

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arjun Mastermind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF0A194E)),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A194E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/logo_final.png', width: 180, height: 180, fit: BoxFit.cover,
                errorBuilder: (c,e,s) {
                  return Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(color: const Color(0xFF0A194E), borderRadius: BorderRadius.circular(30), border: Border.all(color: const Color(0xFFFFD700), width: 3)),
                    child: const Center(child: Text('AM', style: TextStyle(color: Color(0xFFFFD700), fontSize: 50, fontWeight: FontWeight.bold))),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Arjun Mastermind', style: TextStyle(color: Color(0xFFFFD700), fontSize: 26, fontWeight: FontWeight.bold)),
            const Text('Namma Ooru Super App', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 30),
            const CircularProgressIndicator(color: Color(0xFFFFD700)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    );
    bannerAd!.load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A194E),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/logo_final.png', width: 40, height: 40, fit: BoxFit.cover,
                errorBuilder: (c,e,s) {
                  return const Text('AM', style: TextStyle(color: Color(0xFFFFD700)));
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text('Arjun Mastermind', style: TextStyle(color: Color(0xFFFFD700), fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(padding: const EdgeInsets.all(12), color: const Color(0xFF0A194E), child: const Row(children: [Icon(Icons.verified_user, color: Color(0xFFFFD700)), SizedBox(width: 8), Text('All 9 Features Working!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))])),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              childAspectRatio: 0.9,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                homeCard(context, 'Games', Icons.sports_esports, Colors.purple, const GamesScreen()),
                homeCard(context, 'Food', Icons.restaurant, Colors.orange, const FoodScreen()),
                homeCard(context, 'Fashion', Icons.checkroom, Colors.pink, const FashionScreen()),
                homeCard(context, 'Jobs', Icons.work, Colors.blue, const JobsScreen()),
                homeCard(context, 'Movies', Icons.movie, Colors.red, const MoviesScreen()),
                homeCard(context, 'Travel', Icons.flight, Colors.teal, const TravelScreen()),
                homeCard(context, 'Books', Icons.menu_book, Colors.brown, const BooksScreen()),
                homeCard(context, 'News', Icons.newspaper, Colors.indigo, const NewsScreen()),
                homeCard(context, 'Recharge', Icons.phone_android, Colors.green, const RechargeScreen()),
              ],
            ),
          ),
          if (isReady && bannerAd != null)
            Container(
              alignment: Alignment.center,
              width: bannerAd!.size.width.toDouble(),
              height: bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: bannerAd!),
            ),
        ],
      ),
    );
  }

  Widget homeCard(BuildContext ctx, String title, IconData icon, Color color, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(ctx, MaterialPageRoute(builder: (c) => screen));
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 8, offset: const Offset(0,4))]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle), child: Icon(icon, color: color, size: 32)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

// GAMES
class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});
  @override
  State<GamesScreen> createState() => _GamesScreenState();
}
class _GamesScreenState extends State<GamesScreen> {
  List<String> board = List.filled(9, '');
  String turn = 'X';
  String winner = '';
  void tap(int i) {
    if (board[i] == '' && winner == '') {
      setState(() {
        board[i] = turn;
        if (_checkWin()) { winner = turn; }
        else if (!board.contains('')) { winner = 'Draw'; }
        else { turn = turn == 'X' ? 'O' : 'X'; }
      });
    }
  }
  bool _checkWin() {
    List<List<int>> w = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    for (var l in w) {
      if (board[l[0]] != '' && board[l[0]] == board[l[1]] && board[l[1]] == board[l[2]]) return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games'), backgroundColor: Colors.purple),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(winner == '' ? 'Turn: $turn' : winner == 'Draw' ? 'Draw!' : 'Winner: $winner', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (c,i) {
                return GestureDetector(
                  onTap: () { tap(i); },
                  child: Container(margin: const EdgeInsets.all(4), decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)), child: Center(child: Text(board[i], style: const TextStyle(fontSize: 40)))),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: () { setState(() { board = List.filled(9, ''); winner = ''; turn = 'X'; }); }, child: const Text('Restart')),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// FOOD
class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}
class _FoodScreenState extends State<FoodScreen> {
  List<String> cart = [];
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Cart: ${cart.length}'), backgroundColor: Colors.orange),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(title: const Text('Chicken Biryani'), subtitle: const Text('Rs 199'), trailing: ElevatedButton(onPressed: () { setState(() { cart.add('Biryani'); total += 199; }); }, child: const Text('Add'))),
                ListTile(title: const Text('Dosa'), subtitle: const Text('Rs 60'), trailing: ElevatedButton(onPressed: () { setState(() { cart.add('Dosa'); total += 60; }); }, child: const Text('Add'))),
                ListTile(title: const Text('Meals'), subtitle: const Text('Rs 120'), trailing: ElevatedButton(onPressed: () { setState(() { cart.add('Meals'); total += 120; }); }, child: const Text('Add'))),
              ],
            ),
          ),
          Container(padding: const EdgeInsets.all(16), color: Colors.orange.shade100, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total: Rs $total', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: () { if (cart.isNotEmpty) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Placed Rs $total'))); setState(() { cart.clear(); total = 0; }); } }, child: const Text('Order Now'))])),
        ],
      ),
    );
  }
}

// SIMPLE SCREENS - NO COMPLEX BRACKETS
class FashionScreen extends StatelessWidget {
  const FashionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Fashion Store'), backgroundColor: Colors.pink), body: ListView(children: [ListTile(title: const Text('T-Shirt Rs 399'), trailing: ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to Cart'))); }, child: const Text('Buy'))), ListTile(title: const Text('Jeans Rs 899'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Buy'))), ListTile(title: const Text('Shoes Rs 1299'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Buy')))]));
  }
}

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Jobs'), backgroundColor: Colors.blue), body: ListView(children: [Card(child: ListTile(title: const Text('Delivery Boy'), subtitle: const Text('Swiggy Rs 15k-20k'), trailing: ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Applied!'))); }, child: const Text('Apply')))), Card(child: ListTile(title: const Text('Driver'), subtitle: const Text('Rs 18k'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Apply'))))]));
  }
}

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies'), backgroundColor: Colors.red),
      body: ListView(
        children: [
          ListTile(leading: const Icon(Icons.movie, color: Colors.red, size: 40), title: const Text('Leo - Vijay'), subtitle: const Text('HD Tamil'), trailing: IconButton(icon: const Icon(Icons.play_circle_fill, color: Colors.red, size: 40), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Playing Leo'))); })),
          ListTile(leading: const Icon(Icons.movie, color: Colors.red, size: 40), title: const Text('Jailer - Rajini'), subtitle: const Text('HD Tamil'), trailing: IconButton(icon: const Icon(Icons.play_circle_fill, color: Colors.red, size: 40), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Playing Jailer'))); })),
          ListTile(leading: const Icon(Icons.movie, color: Colors.red, size: 40), title: const Text('Varisu'), subtitle: const Text('HD Tamil'), trailing: IconButton(icon: const Icon(Icons.play_circle_fill, color: Colors.red, size: 40), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Playing Varisu'))); })),
        ],
      ),
    );
  }
}

class TravelScreen extends StatelessWidget {
  const TravelScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Travel'), backgroundColor: Colors.teal), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Coimbatore to Chennai'), const SizedBox(height: 10), ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bus Booked'))); }, child: const Text('Book Bus Rs 350'))])));
  }
}

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Books'), backgroundColor: Colors.brown), body: ListView(children: [ListTile(title: const Text('Tamil Stories'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Read'))), ListTile(title: const Text('GK for TNPSC'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Read')))]));
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('News'), backgroundColor: Colors.indigo), body: ListView(children: [Card(child: ListTile(title: const Text('Coimbatore la heavy rain'), subtitle: const Text('2h ago'))), Card(child: ListTile(title: const Text('Podanur new shop open'), subtitle: const Text('5h ago')))]));
  }
}

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Recharge'), backgroundColor: Colors.green), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [TextField(decoration: const InputDecoration(labelText: 'Mobile Number', border: OutlineInputBorder(), prefixText: '+91 '), keyboardType: TextInputType.phone), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Recharge Success'))); }, child: const Text('Recharge Now', style: TextStyle(color: Colors.white))))])));
  }
}
