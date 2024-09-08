import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NowPlaying extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final String title;
  final String subtitle;
  final Color color;

  const NowPlaying({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF1F1D2B),
        appBar: _buildAppBar(context),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 42),
          child: Column(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          color: const Color(0XFFB548C6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Image.asset(
                              imagePath1,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 262,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0XFFCCCCCC),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 75,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/foo.png",
                ),
              ),
              const SizedBox(height: 22),
              const SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "24:32",
                      style: TextStyle(
                        color: Color(0XFFF4F7FC),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "34:00",
                      style: TextStyle(
                        color: Color(0XFFF4F7FC),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "assets/images/skip_back.svg",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(
                          minHeight: 56,
                          minWidth: 56,
                        ),
                        padding: const EdgeInsets.all(0),
                        icon: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: const Color(0XFF2F3142),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(
                            "assets/images/Play.svg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "assets/images/Skip Fwd.svg",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 96,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 58,
      leading: Padding(
        padding: const EdgeInsets.only(left: 30, top: 14, bottom: 14),
        child: IconButton(
          icon: SizedBox(
            height: 28,
            width: 28,
            child: SvgPicture.asset(
              "assets/images/ChevronLeftOutline.svg",
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      centerTitle: true,
      title: const Text(
        "Now Playing",
        style: TextStyle(
          color: Color(0XFFFFFFFF),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

