import 'package:flutter/material.dart';

void main() {
  runApp(const NammaOoruApp());
}

class NammaOoruApp extends StatelessWidget {
  const NammaOoruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namma Ooru App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        splashFactory: InkSparkle.splashFactory,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.ink,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class AppColors {
  static const primary = Color(0xFF6D3DE7);
  static const deepPurple = Color(0xFF3F1D87);
  static const lavender = Color(0xFFEDE6FF);
  static const background = Color(0xFFF8F7FC);
  static const ink = Color(0xFF211A35);
  static const muted = Color(0xFF756E83);
  static const border = Color(0xFFEAE6F2);
}

class Feature {
  const Feature({
    required this.title,
    required this.englishTitle,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.background,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.categories,
    required this.items,
  });

  final String title;
  final String englishTitle;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color background;
  final String heroTitle;
  final String heroSubtitle;
  final List<String> categories;
  final List<FeatureItem> items;
}

class FeatureItem {
  const FeatureItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}

const featureData = <Feature>[
  Feature(
    title: 'விளையாட்டுகள்',
    englishTitle: 'Games',
    subtitle: 'விளையாடலாம்',
    icon: Icons.sports_esports_rounded,
    color: Color(0xFF9A55E8),
    background: Color(0xFFF2E5FF),
    heroTitle: 'சிறிது நேரம் விளையாடலாம்!',
    heroSubtitle: 'உங்களுக்குப் பிடித்த கேம்களைத் தேர்ந்தெடுத்து மகிழுங்கள்.',
    categories: ['அனைத்தும்', 'புதிது', 'பிரபலமானவை'],
    items: [
      FeatureItem(
        title: 'தமிழ் வினாடி வினா',
        subtitle: 'அறிவை சோதிக்கலாம்',
        icon: Icons.quiz_rounded,
        color: Color(0xFF9A55E8),
      ),
      FeatureItem(
        title: 'கேரம் விளையாட்டு',
        subtitle: 'நண்பர்களுடன் விளையாடு',
        icon: Icons.circle_outlined,
        color: Color(0xFFEF7C55),
      ),
      FeatureItem(
        title: 'புதிர் உலகம்',
        subtitle: 'மூளைக்கு ஒரு சவால்',
        icon: Icons.extension_rounded,
        color: Color(0xFF3C9CDA),
      ),
    ],
  ),
  Feature(
    title: 'உணவு ஆர்டர்',
    englishTitle: 'Food Order',
    subtitle: 'சுவையான உணவு',
    icon: Icons.restaurant_rounded,
    color: Color(0xFFE45A42),
    background: Color(0xFFFFE7E1),
    heroTitle: 'இன்று என்ன சாப்பிடலாம்?',
    heroSubtitle: 'உங்கள் ஊரின் பிடித்த உணவுகளை வீட்டிற்கே வரவழையுங்கள்.',
    categories: ['அனைத்தும்', 'சைவம்', 'அசைவம்'],
    items: [
      FeatureItem(
        title: 'பிரியாணி',
        subtitle: 'அருகிலுள்ள உணவகங்கள்',
        icon: Icons.rice_bowl_rounded,
        color: Color(0xFFE45A42),
      ),
      FeatureItem(
        title: 'தோசை & இட்லி',
        subtitle: 'காலை உணவு பிடித்தங்கள்',
        icon: Icons.breakfast_dining_rounded,
        color: Color(0xFFE59B34),
      ),
      FeatureItem(
        title: 'தேநீர் & சிற்றுண்டி',
        subtitle: 'மாலை நேர சுவை',
        icon: Icons.local_cafe_rounded,
        color: Color(0xFF8C624A),
      ),
    ],
  ),
  Feature(
    title: 'உடை ஆர்டர்',
    englishTitle: 'Dress Order',
    subtitle: 'உங்கள் ஸ்டைல்',
    icon: Icons.checkroom_rounded,
    color: Color(0xFF3E82D0),
    background: Color(0xFFE1F0FF),
    heroTitle: 'உங்கள் ஸ்டைல், உங்கள் ஊர்!',
    heroSubtitle: 'உள்ளூர் கடைகளில் இருந்து உங்களுக்குப் பிடித்த ஆடைகளை வாங்குங்கள்.',
    categories: ['அனைத்தும்', 'பெண்கள்', 'ஆண்கள்'],
    items: [
      FeatureItem(
        title: 'புடவை தொகுப்பு',
        subtitle: 'புதிய டிசைன்கள்',
        icon: Icons.auto_awesome_rounded,
        color: Color(0xFFB85A9E),
      ),
      FeatureItem(
        title: 'குர்தா & சட்டை',
        subtitle: 'அன்றாட ஸ்டைல்',
        icon: Icons.checkroom_rounded,
        color: Color(0xFF3E82D0),
      ),
      FeatureItem(
        title: 'குழந்தைகள் உடைகள்',
        subtitle: 'குட்டீஸ்க்கு க்யூட் கலெக்ஷன்',
        icon: Icons.child_care_rounded,
        color: Color(0xFFE59B34),
      ),
    ],
  ),
  Feature(
    title: 'வேலைவாய்ப்புகள்',
    englishTitle: 'Jobs',
    subtitle: 'வேலை தேடலாம்',
    icon: Icons.work_rounded,
    color: Color(0xFF299B78),
    background: Color(0xFFDDF6EC),
    heroTitle: 'உங்கள் அடுத்த வாய்ப்பு இங்கே!',
    heroSubtitle: 'அருகிலுள்ள வேலைகளையும் புதிய வாய்ப்புகளையும் கண்டுபிடியுங்கள்.',
    categories: ['அனைத்தும்', 'முழுநேரம்', 'பகுதி நேரம்'],
    items: [
      FeatureItem(
        title: 'விற்பனை நிர்வாகி',
        subtitle: 'சென்னை • முழுநேரம்',
        icon: Icons.storefront_rounded,
        color: Color(0xFF299B78),
      ),
      FeatureItem(
        title: 'டெலிவரி வேலை',
        subtitle: 'மதுரை • பகுதி நேரம்',
        icon: Icons.delivery_dining_rounded,
        color: Color(0xFFE59B34),
      ),
      FeatureItem(
        title: 'கணினி ஆபரேட்டர்',
        subtitle: 'கோயம்புத்தூர் • முழுநேரம்',
        icon: Icons.computer_rounded,
        color: Color(0xFF3E82D0),
      ),
    ],
  ),
  Feature(
    title: 'திரைப்படங்கள்',
    englishTitle: 'Movies',
    subtitle: 'படம் பார்க்கலாம்',
    icon: Icons.movie_creation_rounded,
    color: Color(0xFFDD477D),
    background: Color(0xFFFFE2EC),
    heroTitle: 'அடுத்த படம் எது?',
    heroSubtitle: 'தமிழ், மலையாளம் மற்றும் ஹாலிவுட் படங்களை ஒரே இடத்தில் பாருங்கள்.',
    categories: ['தமிழ்', 'மலையாளம்', 'ஹாலிவுட்'],
    items: [
      FeatureItem(
        title: 'இன்றைய தமிழ் படங்கள்',
        subtitle: 'திரையரங்கில் வெளியாகிறது',
        icon: Icons.local_movies_rounded,
        color: Color(0xFFDD477D),
      ),
      FeatureItem(
        title: 'மலையாளம்',
        subtitle: 'புதிய வெளியீடுகள்',
        icon: Icons.theaters_rounded,
        color: Color(0xFF299B78),
      ),
      FeatureItem(
        title: 'ஹாலிவுட்',
        subtitle: 'பிளாக்பஸ்டர் படங்கள்',
        icon: Icons.ondemand_video_rounded,
        color: Color(0xFF3E82D0),
      ),
    ],
  ),
  Feature(
    title: 'பயண டிக்கெட்',
    englishTitle: 'Travel Ticket',
    subtitle: 'பயணம் தொடங்கலாம்',
    icon: Icons.directions_bus_rounded,
    color: Color(0xFF258AC2),
    background: Color(0xFFDFF4FF),
    heroTitle: 'அடுத்த பயணம் எங்கே?',
    heroSubtitle: 'பேருந்து, ரயில் டிக்கெட்டுகளை எளிதாகத் தேடி முன்பதிவு செய்யுங்கள்.',
    categories: ['பேருந்து', 'ரயில்', 'விமானம்'],
    items: [
      FeatureItem(
        title: 'சென்னை → மதுரை',
        subtitle: 'இன்று • 18 பேருந்துகள்',
        icon: Icons.directions_bus_filled_rounded,
        color: Color(0xFF258AC2),
      ),
      FeatureItem(
        title: 'சென்னை → கோவை',
        subtitle: 'நாளை • 12 ரயில்கள்',
        icon: Icons.train_rounded,
        color: Color(0xFFE59B34),
      ),
      FeatureItem(
        title: 'உங்கள் பயணத்தைத் திட்டமிடுங்கள்',
        subtitle: 'இடங்களைத் தேர்ந்தெடுக்கவும்',
        icon: Icons.map_rounded,
        color: Color(0xFF299B78),
      ),
    ],
  ),
  Feature(
    title: 'புத்தகங்கள்',
    englishTitle: 'Books Download',
    subtitle: 'படிக்கலாம்',
    icon: Icons.menu_book_rounded,
    color: Color(0xFFAA6B2C),
    background: Color(0xFFFFEFD8),
    heroTitle: 'ஒரு பக்கம். ஒரு புதிய உலகம்.',
    heroSubtitle: 'தமிழ் புத்தகங்கள், கதைகள் மற்றும் அறிவைத் தரவிறக்கம் செய்யுங்கள்.',
    categories: ['பிரபலமானவை', 'கதைகள்', 'கல்வி'],
    items: [
      FeatureItem(
        title: 'தமிழ் சிறுகதைகள்',
        subtitle: 'இலவசமாகப் படிக்கலாம்',
        icon: Icons.auto_stories_rounded,
        color: Color(0xFFAA6B2C),
      ),
      FeatureItem(
        title: 'போட்டி தேர்வுகள்',
        subtitle: 'படிக்க வேண்டிய குறிப்புகள்',
        icon: Icons.school_rounded,
        color: Color(0xFF3E82D0),
      ),
      FeatureItem(
        title: 'குழந்தைகள் கதைகள்',
        subtitle: 'குட்டீஸ்க்கான உலகம்',
        icon: Icons.menu_book_rounded,
        color: Color(0xFF299B78),
      ),
    ],
  ),
  Feature(
    title: 'உலகச் செய்திகள்',
    englishTitle: 'World News Live',
    subtitle: 'செய்திகள் உடனுக்குடன்',
    icon: Icons.public_rounded,
    color: Color(0xFF5766D9),
    background: Color(0xFFE8E9FF),
    heroTitle: 'உலகம் என்ன பேசுகிறது?',
    heroSubtitle: 'உலகம் முழுவதும் நடக்கும் முக்கிய செய்திகளை உடனுக்குடன் தெரிந்துகொள்ளுங்கள்.',
    categories: ['முக்கிய செய்திகள்', 'இந்தியா', 'உலகம்'],
    items: [
      FeatureItem(
        title: 'முக்கிய செய்திகள்',
        subtitle: 'இப்போதுதான் வெளியானது',
        icon: Icons.flash_on_rounded,
        color: Color(0xFFE45A42),
      ),
      FeatureItem(
        title: 'இந்தியா',
        subtitle: 'நாட்டின் செய்திகள்',
        icon: Icons.account_balance_rounded,
        color: Color(0xFFFF9B42),
      ),
      FeatureItem(
        title: 'உலகம்',
        subtitle: 'உலகச் செய்திகள்',
        icon: Icons.public_rounded,
        color: Color(0xFF5766D9),
      ),
    ],
  ),
  Feature(
    title: 'மொபைல் ரீசார்ஜ்',
    englishTitle: 'Mobile Recharge',
    subtitle: 'உடனடி ரீசார்ஜ்',
    icon: Icons.phone_android_rounded,
    color: Color(0xFFE08925),
    background: Color(0xFFFFEDD5),
    heroTitle: 'ரீசார்ஜ் செய்யலாம்!',
    heroSubtitle: 'உங்கள் மொபைலுக்கு விரைவாகவும் பாதுகாப்பாகவும் ரீசார்ஜ் செய்யுங்கள்.',
    categories: ['ப்ரீபெய்ட்', 'போஸ்ட்பெய்ட்', 'டேட்டா'],
    items: [
      FeatureItem(
        title: 'ப்ரீபெய்ட் ரீசார்ஜ்',
        subtitle: 'எல்லா நெட்வொர்க்குகளும்',
        icon: Icons.sim_card_rounded,
        color: Color(0xFFE08925),
      ),
      FeatureItem(
        title: 'டேட்டா பேக்',
        subtitle: 'உங்கள் டேட்டாவை நிரப்புங்கள்',
        icon: Icons.wifi_rounded,
        color: Color(0xFF3E82D0),
      ),
      FeatureItem(
        title: 'பில் செலுத்துங்கள்',
        subtitle: 'போஸ்ட்பெய்ட் பில்',
        icon: Icons.receipt_long_rounded,
        color: Color(0xFF299B78),
      ),
    ],
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomNav = 0;

  void _openFeature(Feature feature) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => FeatureDetailPage(feature: feature),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width > 600 ? 32.0 : 20.0;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                18,
                horizontalPadding,
                0,
              ),
              sliver: SliverToBoxAdapter(
                child: _HomeHeader(onNotificationTap: _showNotifications),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                0,
              ),
              sliver: SliverToBoxAdapter(
                child: _WelcomeBanner(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                28,
                horizontalPadding,
                12,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'எல்லா சேவைகளும்',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.ink,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                          ),
                    ),
                    Text(
                      '9 சேவைகள்',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.muted,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                0,
                horizontalPadding,
                24,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final feature = featureData[index];
                    return FeatureCard(
                      feature: feature,
                      onTap: () => _openFeature(feature),
                    );
                  },
                  childCount: featureData.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: width > 600 ? 18 : 10,
                  mainAxisSpacing: width > 600 ? 18 : 10,
                  childAspectRatio: width > 600 ? 1.02 : 0.76,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomBar(
        selectedIndex: _selectedBottomNav,
        onSelected: (index) {
          setState(() => _selectedBottomNav = index);
          if (index == 1) {
            _showComingSoon('ஆர்டர்கள்');
          } else if (index == 2) {
            _showComingSoon('சுயவிவரம்');
          }
        },
      ),
    );
  }

  void _showNotifications() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'அறிவிப்புகள்',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 18),
              _NotificationRow(
                icon: Icons.local_offer_rounded,
                color: AppColors.primary,
                title: 'புதிய சலுகைகள் விரைவில்!',
                subtitle: 'உங்கள் ஊரின் சிறந்த சலுகைகளைத் தவறவிடாதீர்கள்.',
              ),
              SizedBox(height: 16),
              _NotificationRow(
                icon: Icons.waving_hand_rounded,
                color: Color(0xFFE08925),
                title: 'நம்ம ஊருக்கு வரவேற்பு!',
                subtitle: 'எல்லா சேவைகளையும் ஒரே இடத்தில் பயன்படுத்துங்கள்.',
              ),
            ],
          ),
        );
      },
    );
  }

  void _showComingSoon(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title பகுதி விரைவில் வருகிறது'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.onNotificationTap});

  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: const Icon(
            Icons.home_work_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'நம்ம ஊர்',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                ),
              ),
              SizedBox(height: 1),
              Text(
                'எல்லாம் ஒரே இடத்தில்',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotificationTap,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.ink,
            fixedSize: const Size(46, 46),
          ),
          icon: const Icon(Icons.notifications_none_rounded, size: 24),
        ),
      ],
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 21, 16, 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.deepPurple, AppColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.28),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'வணக்கம்! 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'உங்கள் நாள்\nஎளிதாகட்டும்.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    height: 1.1,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  'தேவைப்படும் அனைத்தும்\nஇங்கே கிடைக்கும்.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.72),
                    fontSize: 12,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          _BannerIllustration(),
        ],
      ),
    );
  }
}

class _BannerIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 7,
            right: 5,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 0,
            child: Container(
              width: 98,
              height: 74,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(34),
              ),
            ),
          ),
          const Positioned(
            top: 29,
            left: 10,
            child: Icon(
              Icons.favorite_rounded,
              color: Color(0xFFFFB5D0),
              size: 25,
            ),
          ),
          const Positioned(
            top: 13,
            right: 12,
            child: Icon(
              Icons.auto_awesome_rounded,
              color: Color(0xFFFFE39B),
              size: 20,
            ),
          ),
          Container(
            width: 73,
            height: 73,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.grid_view_rounded,
              color: AppColors.primary,
              size: 42,
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 8,
            child: Icon(
              Icons.local_mall_rounded,
              color: Color(0xFFFFD36E),
              size: 31,
            ),
          ),
          const Positioned(
            bottom: 11,
            right: 15,
            child: Icon(
              Icons.local_dining_rounded,
              color: Color(0xFFFF9B8D),
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.feature,
    required this.onTap,
    super.key,
  });

  final Feature feature;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 12, 8, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: feature.background,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(feature.icon, color: feature.color, size: 22),
              ),
              const Spacer(),
              Text(
                feature.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 13,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                feature.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureDetailPage extends StatefulWidget {
  const FeatureDetailPage({required this.feature, super.key});

  final Feature feature;

  @override
  State<FeatureDetailPage> createState() => _FeatureDetailPageState();
}

class _FeatureDetailPageState extends State<FeatureDetailPage> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final feature = widget.feature;

    return Scaffold(
      backgroundColor: feature.background.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: feature.background.withOpacity(0.4),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () => _showMessage('சேமிக்கப்பட்டது'),
            icon: const Icon(Icons.bookmark_border_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          _DetailHero(feature: feature),
          const SizedBox(height: 24),
          SizedBox(
            height: 39,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: feature.categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final selected = index == _selectedCategory;
                return ChoiceChip(
                  label: Text(feature.categories[index]),
                  selected: selected,
                  onSelected: (_) {
                    setState(() => _selectedCategory = index);
                  },
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppColors.muted,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: feature.color,
                  side: BorderSide(
                    color: selected ? feature.color : AppColors.border,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'உங்களுக்காக',
                style: TextStyle(
                  color: AppColors.ink,
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '${feature.items.length} தேர்வுகள்',
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          ...feature.items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _FeatureListItem(
                item: item,
                onTap: () => _showMessage('${item.title} தேர்ந்தெடுக்கப்பட்டது'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: () => _showMessage('${feature.title} விரைவில் கிடைக்கும்'),
            icon: const Icon(Icons.arrow_forward_rounded, size: 19),
            label: const Text('தொடங்கலாம்'),
            style: FilledButton.styleFrom(
              backgroundColor: feature.color,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class _DetailHero extends StatelessWidget {
  const _DetailHero({required this.feature});

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: feature.color.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.englishTitle.toUpperCase(),
                  style: TextStyle(
                    color: feature.color,
                    fontSize: 10,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  feature.heroTitle,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 22,
                    height: 1.15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feature.heroSubtitle,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: feature.background,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(feature.icon, color: feature.color, size: 36),
          ),
        ],
      ),
    );
  }
}

class _FeatureListItem extends StatelessWidget {
  const _FeatureListItem({required this.item, required this.onTap});

  final FeatureItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.11),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(item.icon, color: item.color, size: 25),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: item.color,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 72,
      backgroundColor: Colors.white,
      indicatorColor: AppColors.lavender,
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'முகப்பு',
        ),
        NavigationDestination(
          icon: Icon(Icons.receipt_long_outlined),
          selectedIcon: Icon(Icons.receipt_long_rounded),
          label: 'ஆர்டர்கள்',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person_rounded),
          label: 'சுயவிவரம்',
        ),
      ],
    );
  }
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(icon, color: color, size: 21),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.ink,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 11,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}