import 'package:flutter/material.dart';

void main() {
  runApp(const ArjunMastermind());
}

const Color purple = Color(0xFF7939E8);
const Color background = Color(0xFFFCF7FF);

class ArjunMastermind extends StatelessWidget {
  const ArjunMastermind({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arjun Mastermind',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
        scaffoldBackgroundColor: background,
      ),
      home: const HomeScreen(),
    );
  }
}

class AppOption {
  final String name;
  final IconData icon;
  final List<String> items;
  final bool isPremium;
  final bool isAffiliate;

  const AppOption(this.name, this.icon, this.items, {this.isPremium = false, this.isAffiliate = false});
}

const List<AppOption> options = [
  AppOption('Games', Icons.sports_esports, ['Online Games','Puzzle Games','Action Games']),
  AppOption('Food', Icons.lunch_dining, ['Restaurants','Food Menu','Order Food'], isAffiliate: true),
  AppOption('Movies', Icons.movie_creation, ['Tamil Movies','Malayalam Movies','Hollywood Movies','Hindi Movies','Tamil Dubbed Movies','Movie Booking']),
  AppOption('Jobs', Icons.work, ['Private Jobs','Government Jobs','Part-Time Jobs','Work From Home'], isPremium: true),
  AppOption('Travel', Icons.directions_bus, ['Bus Booking','Train Information','Flight Booking','Hotels'], isAffiliate: true),
  AppOption('Dress', Icons.checkroom, ['Men Fashion','Women Fashion','Kids Fashion','Shoes'], isAffiliate: true),
  AppOption('Books', Icons.menu_book, ['Tamil Books','English Books','Story Books'], isAffiliate: true),
  AppOption('World News', Icons.public, ['India News','World News','Technology News','Sports News']),
  AppOption('Recharge', Icons.phone_android, ['Mobile Recharge','DTH Recharge','Electricity Bills'], isPremium: true),
];

// GLOBAL PREMIUM CHECK - Simple da!
bool isUserPremium = false;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 25, bottom: 38),
              decoration: const BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65), bottomRight: Radius.circular(65)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 68, height: 68,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
                    child: const Icon(Icons.auto_awesome, size: 42, color: purple),
                  ),
                  const SizedBox(height: 14),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('ARJUN MASTERMIND', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  ),
                  const SizedBox(height: 8),
                  const Text('Your World. One App.', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 12),
                  if (!isUserPremium)
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen())),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                        child: const Text('GET PREMIUM @ Rs.99', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
                      ),
                    ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 24, 18, 10),
            sliver: SliverToBoxAdapter(
              child: TextField(
                onSubmitted: (value) {
                  final query = value.trim().toLowerCase();
                  final matches = options.where((option) => option.name.toLowerCase().contains(query) || option.items.any((item) => item.toLowerCase().contains(query)));
                  if (matches.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => OptionScreen(option: matches.first)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Option not found')));
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search Games, Food, Movies...',
                  prefixIcon: const Icon(Icons.search, color: purple),
                  filled: true, fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                ),
              ),
            ),
          ),

          const SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 14),
            sliver: SliverToBoxAdapter(child: Text('Explore All Services', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF281A35)))),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverLayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.crossAxisExtent;
                final columns = width >= 650 ? 5 : width >= 400 ? 4 : 3;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns, crossAxisSpacing: 10, mainAxisSpacing: 12, childAspectRatio: 0.82),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final option = options[index];
                      return Material(
                        color: const Color(0xFFF6F0FA),
                        borderRadius: BorderRadius.circular(25),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            // EARNING LOGIC 1: PREMIUM CHECK
                            if (option.isPremium && !isUserPremium) {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => PremiumScreen(optionName: option.name)));
                              return;
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OptionScreen(option: option)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: purple.withOpacity(0.08)),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 5, offset: const Offset(0, 3))],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(option.icon, color: purple, size: 39),
                                    const SizedBox(height: 13),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: Text(option.name, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF281A35))),
                                    ),
                                    if (option.isAffiliate) const Padding(padding: EdgeInsets.only(top: 4), child: Text('EARN 10%', style: TextStyle(fontSize: 9, color: Colors.green, fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                if (option.isPremium && !isUserPremium)
                                  Positioned(top: 8, right: 8, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle), child: const Icon(Icons.lock, size: 12, color: Colors.black))),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: options.length,
                  ),
                );
              },
            ),
          ),

          const SliverPadding(padding: EdgeInsets.fromLTRB(16, 25, 16, 10), sliver: SliverToBoxAdapter(child: AdvertisementBox())),
          const SliverPadding(padding: EdgeInsets.fromLTRB(20, 15, 20, 12), sliver: SliverToBoxAdapter(child: Text('Welcome to Arjun Mastermind!', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)))),
          const SliverPadding(padding: EdgeInsets.fromLTRB(16, 0, 16, 30), sliver: SliverToBoxAdapter(child: Text('Discover entertainment, shopping, travel, education and more in one place.', style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black54)))),
        ],
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  final AppOption option;
  const OptionScreen({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: purple, foregroundColor: Colors.white, title: Text(option.name)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Icon(option.icon, color: Colors.white, size: 58),
                const SizedBox(height: 12),
                Text(option.name, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(option.isAffiliate ? 'Shop & Earn Commission!' : 'Explore Arjun Mastermind', style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Available Options', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...option.items.map(
            (item) => Card(
              color: Colors.white,
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Color(0xFFEDE3FF), child: Icon(Icons.arrow_forward, color: purple)),
                title: Text(item),
                subtitle: option.isAffiliate ? const Text('Buy via Meesho/Amazon - You earn 10%', style: TextStyle(fontSize: 10, color: Colors.green)) : null,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(title: item, category: option.name, isAffiliate: option.isAffiliate)));
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const AdvertisementBox(),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String category;
  final bool isAffiliate;
  const DetailScreen({super.key, required this.title, required this.category, this.isAffiliate = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: purple, foregroundColor: Colors.white, title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.auto_awesome, color: purple, size: 70),
              const SizedBox(height: 20),
              Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text('$category service', style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 18),
              Text(isAffiliate ? 'Click BUY to earn commission via affiliate link!' : 'This page is ready for development.', textAlign: TextAlign.center),
              const SizedBox(height: 20),
              if (isAffiliate)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.all(16)),
                    onPressed: () {
                      // AFFILIATE EARNING LOGIC
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Affiliate Link Clicked! You earned Rs.150 from $title sale!'),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                      // REAL MEEDHU: launchUrl(Uri.parse('https://www.meesho.com/product?aff_id=YOUR_ID'))
                    },
                    child: const Text('BUY NOW & EARN COMMISSION', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              const SizedBox(height: 12),
              const AdvertisementBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumScreen extends StatefulWidget {
  final String? optionName;
  const PremiumScreen({super.key, this.optionName});
  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool isPaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, foregroundColor: Colors.black, title: const Text('Premium @ Rs.99')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(color: purple, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Icon(Icons.workspace_premium, color: Colors.amber, size: 60),
                  const SizedBox(height: 10),
                  Text(widget.optionName != null ? '${widget.optionName} is Premium!' : 'Get Premium Access!', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Unlock all 38 Districts Jobs, Bus Booking, Recharge', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(leading: Icon(Icons.check, color: Colors.green), title: Text('Unlimited TN Jobs - 38 Districts')),
            const ListTile(leading: Icon(Icons.check, color: Colors.green), title: Text('Daily WhatsApp Job Alerts')),
            const ListTile(leading: Icon(Icons.check, color: Colors.green), title: Text('Direct HR Numbers')),
            const ListTile(leading: Icon(Icons.check, color: Colors.green), title: Text('No Ads')),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: purple, padding: const EdgeInsets.all(18), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: isPaying ? null : () async {
                  setState(() => isPaying = true);
                  // RAZORPAY PAYMENT SIMULATION - REAL LA RAZORPAY CODE VARUM
                  await Future.delayed(const Duration(seconds: 2));
                  isUserPremium = true;
                  setState(() => isPaying = false);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.green, content: Text('Payment Success! Rs.99 - Premium Activated! You earned Rs.99!')));
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text(isPaying ? 'Processing UPI Payment...' : 'PAY Rs.99 VIA UPI / GPay (Razorpay)', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Secure Payment by Razorpay - UPI, GPay, PhonePe', style: TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AdvertisementBox extends StatelessWidget {
  const AdvertisementBox({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AD CLICK EARNING
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(backgroundColor: purple, content: Text('Ad Clicked! You earned Rs.5 from AdSense! + Affiliate product opening...')),
        );
      },
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
          boxShadow: [BoxShadow(color: purple.withOpacity(0.1), blurRadius: 8)],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.campaign, color: purple, size: 28), SizedBox(width: 8), Text('ADVERTISEMENT - CLICK TO EARN', style: TextStyle(color: purple, fontWeight: FontWeight.bold, fontSize: 12))]),
            SizedBox(height: 4),
            Text('Google AdSense + Affiliate Products - Rs.5 per click', style: TextStyle(color: Colors.black45, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
