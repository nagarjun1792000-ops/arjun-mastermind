import 'package:flutter/material.dart';

void main() => runApp(const ArjunMastermindApp());

const Color brandPurple = Color(0xFF5E35B1);
const Color pageBackground = Color(0xFFF7F5FC);

class ArjunMastermindApp extends StatelessWidget {
  const ArjunMastermindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arjun Mastermind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
        scaffoldBackgroundColor: pageBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: brandPurple,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class AppFeature {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<ServiceItem> services;
  final bool premium;
  final bool partnerLinks;

  const AppFeature({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.services,
    this.premium = false,
    this.partnerLinks = false,
  });
}

class ServiceItem {
  final String title;
  final String description;

  const ServiceItem(this.title, this.description);
}

const List<AppFeature> appFeatures = [
  AppFeature(
    title: 'Games',
    subtitle: 'Game categories and discovery',
    icon: Icons.sports_esports_rounded,
    services: [
      ServiceItem('Online Games', 'Discover online game options.'),
      ServiceItem('Puzzle Games', 'Explore puzzle and brain games.'),
      ServiceItem('Action Games', 'Browse action game categories.'),
    ],
  ),
  AppFeature(
    title: 'Food Order',
    subtitle: 'Food and restaurant services',
    icon: Icons.restaurant_rounded,
    partnerLinks: true,
    services: [
      ServiceItem('Restaurants', 'Restaurant links can be connected here.'),
      ServiceItem('Food Menu', 'Menus can be shown after a provider is connected.'),
      ServiceItem('Order Food', 'Ordering requires a real restaurant or delivery API.'),
    ],
  ),
  AppFeature(
    title: 'Movies',
    subtitle: 'Movies and ticket booking',
    icon: Icons.movie_creation_rounded,
    partnerLinks: true,
    services: [
      ServiceItem('Tamil Movies', 'Browse Tamil movie information.'),
      ServiceItem('Malayalam Movies', 'Browse Malayalam movie information.'),
      ServiceItem('Hollywood Movies', 'Browse Hollywood movie information.'),
      ServiceItem('Hindi Movies', 'Browse Hindi movie information.'),
      ServiceItem('Tamil Dubbed Movies', 'Browse Tamil-dubbed movie information.'),
      ServiceItem('Movie Booking', 'Ticket booking requires an approved booking provider.'),
    ],
  ),
  AppFeature(
    title: 'Jobs',
    subtitle: 'Job search resources',
    icon: Icons.work_rounded,
    premium: true,
    services: [
      ServiceItem('Private Jobs', 'Job listings require a verified source.'),
      ServiceItem('Government Jobs', 'Official recruitment notifications can be linked here.'),
      ServiceItem('Part-Time Jobs', 'Listings require a verified source.'),
      ServiceItem('Work From Home', 'Check listings carefully and avoid paying recruiters.'),
    ],
  ),
  AppFeature(
    title: 'Travel',
    subtitle: 'Travel planning and tickets',
    icon: Icons.directions_bus_rounded,
    partnerLinks: true,
    services: [
      ServiceItem('Bus Booking', 'Bus booking requires an approved provider/API.'),
      ServiceItem('Train Information', 'Official railway information can be linked here.'),
      ServiceItem('Flight Booking', 'Flight booking requires an approved provider/API.'),
      ServiceItem('Hotels', 'Hotel booking requires a provider or affiliate link.'),
    ],
  ),
  AppFeature(
    title: 'Dress Order',
    subtitle: 'Clothing and shopping categories',
    icon: Icons.checkroom_rounded,
    partnerLinks: true,
    services: [
      ServiceItem("Men's Fashion", 'Product listings require real store links.'),
      ServiceItem("Women's Fashion", 'Product listings require real store links.'),
      ServiceItem('Kids Fashion', 'Product listings require real store links.'),
      ServiceItem('Shoes', 'Product listings require real store links.'),
    ],
  ),
  AppFeature(
    title: 'Books',
    subtitle: 'Books and reading resources',
    icon: Icons.menu_book_rounded,
    partnerLinks: true,
    services: [
      ServiceItem('Tamil Books', 'Book listings can be connected to a legal seller.'),
      ServiceItem('English Books', 'Book listings can be connected to a legal seller.'),
      ServiceItem('Story Books', 'Use authorized listings and reading sources.'),
      ServiceItem('Study Books', 'Use authorized listings and reading sources.'),
    ],
  ),
  AppFeature(
    title: 'World News',
    subtitle: 'News topics and updates',
    icon: Icons.public_rounded,
    services: [
      ServiceItem('India News', 'A trusted news API or publisher feed is required for live news.'),
      ServiceItem('World News', 'A trusted news API or publisher feed is required for live news.'),
      ServiceItem('Technology News', 'A trusted news API or publisher feed is required for live news.'),
      ServiceItem('Sports News', 'A trusted news API or publisher feed is required for live news.'),
    ],
  ),
  AppFeature(
    title: 'Mobile Recharge',
    subtitle: 'Recharge and bill payment',
    icon: Icons.phone_android_rounded,
    premium: true,
    services: [
      ServiceItem('Mobile Recharge', 'Real recharge needs an authorized payment/recharge provider.'),
      ServiceItem('DTH Recharge', 'Real recharge needs an authorized payment/recharge provider.'),
      ServiceItem('Electricity Bills', 'Bill payment needs an authorized bill-payment provider.'),
    ],
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = appFeatures.where((feature) {
      final q = query.trim().toLowerCase();
      if (q.isEmpty) return true;
      return feature.title.toLowerCase().contains(q) ||
          feature.subtitle.toLowerCase().contains(q) ||
          feature.services.any((service) =>
              service.title.toLowerCase().contains(q) ||
              service.description.toLowerCase().contains(q));
    }).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).padding.top + 22,
                20,
                26,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4527A0), Color(0xFF7E57C2), Color(0xFF9575CD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(Icons.auto_awesome_rounded,
                            color: brandPurple, size: 34),
                      ),
                      const SizedBox(width: 13),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ARJUN MASTERMIND',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.3,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Your World. One App.',
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'What are you looking for?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Explore services, discover ideas, and get started.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 18),
                  TextField(
                    onChanged: (value) => setState(() => query = value),
                    decoration: InputDecoration(
                      hintText: 'Search games, food, movies...',
                      prefixIcon: const Icon(Icons.search, color: brandPurple),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 23, 18, 8),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Explore All Services',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                  Text('${filtered.length} options',
                      style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ),
          ),
          if (filtered.isEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(28),
                child: Center(child: Text('No results. Try a different search.')),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.crossAxisExtent;
                  final columns = width >= 900
                      ? 5
                      : width >= 600
                          ? 4
                          : width >= 400
                              ? 3
                              : 2;
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.86,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final feature = filtered[index];
                        return FeatureCard(
                          feature: feature,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FeatureScreen(feature: feature),
                            ),
                          ),
                        );
                      },
                      childCount: filtered.length,
                    ),
                  );
                },
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 6, 18, 28),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    color: const Color(0xFFEDE7F6),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.workspace_premium_rounded,
                              color: brandPurple, size: 38),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Arjun Premium',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 4),
                                Text(
                                  'Payment is not enabled yet.',
                                  style: TextStyle(color: Colors.black54, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PremiumScreen()),
                            ),
                            child: const Text('View'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ad area placeholder • Real ads must be configured before launch.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final AppFeature feature;
  final VoidCallback onTap;

  const FeatureCard({super.key, required this.feature, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(21),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(21),
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: brandPurple.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.035),
                blurRadius: 11,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(feature.icon, color: brandPurple, size: 31),
              ),
              const SizedBox(height: 11),
              Text(
                feature.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 5),
              Text(
                feature.premium
                    ? 'PREMIUM'
                    : feature.partnerLinks
                        ? 'PARTNER LINKS'
                        : 'EXPLORE',
                style: TextStyle(
                  color: feature.premium
                      ? Colors.deepOrange
                      : feature.partnerLinks
                          ? Colors.teal
                          : Colors.black45,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureScreen extends StatelessWidget {
  final AppFeature feature;

  const FeatureScreen({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(feature.title)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [brandPurple, Color(0xFF9575CD)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(feature.icon, size: 48, color: Colors.white),
                const SizedBox(height: 13),
                Text(feature.title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(feature.subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text('Available options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 9),
          ...feature.services.map(
            (service) => Card(
              color: Colors.white,
              elevation: 0,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFEDE7F6),
                  child: Icon(Icons.arrow_forward_rounded, color: brandPurple),
                ),
                title: Text(service.title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(service.description),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(service.title),
                    content: Text(
                      '${service.description}\n\nThis starter screen does not connect to an external provider yet.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (feature.partnerLinks) ...[
            const SizedBox(height: 12),
            const Card(
              color: Color(0xFFE0F2F1),
              elevation: 0,
           
