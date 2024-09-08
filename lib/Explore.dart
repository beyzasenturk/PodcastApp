import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'NowPlaying.dart';

class Explore extends StatelessWidget {
  Explore({super.key});

  final TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> trendingItems = [
    {
      "image": "assets/images/drew-hays-agGIKYs4mYs-unsplash-removebg-preview 1.png",
      "image2": " ",
      "title": "The missing 96 percent of the universe",
      "subtitle": "Claire Malone",
      "color": "#B548C6"

    },
    {
      "image": "assets/images/jonas-kakaroto-KIPqvvTOC1s-unsplash-removebg-preview 1.png",
      "image2": "assets/images/Group.svg",
      "title": "How Dolly Parton led me to an epiphany",
      "subtitle": "Abumenyang",
      "color": "#32A7E2"
    },
    {
      "image": "assets/images/christian-buehner-DItYlc26zVI-unsplash-removebg-preview 1.png",
      "image2": " ",
      "title": "Understanding quantum physics",
      "subtitle": "Tir McDohl",
      "color": "#EC663C"
    },
    {
      "image": "assets/images/julian-wan-WNoLnJo7tS8-unsplash-removebg-preview 1.png",
      "image2": " ",
      "title": "Ngobam with Denny Caknan",
      "subtitle": "Denny Kulon",
      "color": "#FFBF47"

    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF1F1D2B),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 14),
              _buildSearchSection(context),
              const SizedBox(height: 14),
              _buildCategoryTabs(context),
              const SizedBox(height: 14),
              _buildTrendingSection(context)  // Trending section'ı çağırıyoruz
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  /// AppBar Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 75,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 51,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 29,
          top: 21,
          bottom: 22,
        ),
        child: SvgPicture.asset(
          "assets/images/Group 1030.svg",
          height: 12,
          width: 22,
        ),
      ),
      centerTitle: true,
      title: const Text(
        "Podkes",
        style: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 17,
            right: 30,
            bottom: 18,
          ),
          child: SvgPicture.asset(
            "assets/images/Notification.svg",
            height: 20,
            width: 20,
          ),
        )
      ],
    );
  }

  /// Search Section Widget
  Widget _buildSearchSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: searchController,
        style: const TextStyle(
          color: Color(0X7FFFFFFF),
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            color: Color(0X7FFFFFFF),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.search,
              color: Color(0xff757575),
            ),
          ),
          filled: true,
          fillColor: Color(0XFF252836),
        ),
      ),
    );
  }

  /// Category Tabs Widget
  Widget _buildCategoryTabs(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 352,
        margin: const EdgeInsets.only(left: 35),
        child: Row(
          children: [
            _buildCategoryTab("All", true),
            const SizedBox(width: 12),
            _buildCategoryTab("Life", false),
            const SizedBox(width: 12),
            _buildCategoryTab("Comedy", false),
            const SizedBox(width: 12),
            _buildCategoryTab("Tech", false, isSvg: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, bool isActive, {bool isSvg = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0XFF2F3142) : const Color(0XFF2F3142),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? const Color(0XFFF9F9FA) : const Color(0XFFC4C4C4),
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Trending Section Widget
  Widget _buildTrendingSection(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trending",
              style: TextStyle(
                color: Color(0XFFF4F7FC),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 223,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: trendingItems.length,
                itemBuilder: (context, index) {
                  final item = trendingItems[index];
                  return ExploreOneItemWidget(
                    imagePath1: item['image']!,
                    imagePath2: item['image2']!,
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                    color: hexToColor(item['color']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Bottom Navigation Bar Widget
  Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF252836),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Column(
            children: [
              SvgPicture.asset("assets/images/Home.svg"),
              const Text(
                "Discover",
                style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              SvgPicture.asset("assets/images/Library.svg"),
              const Text(
                "Library",
                style: TextStyle(
                  color: Color(0XFF8B8C8C),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Column(
            children: [
              SvgPicture.asset("assets/images/User.svg"),
              const Text(
                "Profile",
                style: TextStyle(
                  color: Color(0XFF8B8C8C),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          label: '',
        ),
      ],
    );
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "");
  if (hex.length == 6) {
    hex = "FF$hex";
  }
  return Color(int.parse(hex, radix: 16));
}

class ExploreOneItemWidget extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final String title;
  final String subtitle;
  final Color color;

  const ExploreOneItemWidget({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Yeni sayfaya geçiş
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  NowPlaying(
              imagePath1: imagePath1,
              imagePath2: imagePath2,
              title: title,
              subtitle: subtitle,
              color: color,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 144,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: color,
                  image: DecorationImage(
                    image: AssetImage(imagePath1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(imagePath2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Color(0XFFF4F7FC),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0XFFABB3BB),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
