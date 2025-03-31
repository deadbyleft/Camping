import 'package:flutter/material.dart';

class CampingSitesPage extends StatelessWidget {
  const CampingSitesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // 이전 페이지로 돌아가기
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '경북 야영장',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.black),
            onPressed: () {
              // 홈(지역 선택 화면)으로 이동
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF5EFF7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        '구미',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: const Icon(Icons.search, color: Colors.black54),
                      onPressed: () {
                        // 돋보기 버튼 => SearchResultPage 이동
                        Navigator.pushNamed(context, '/search_result');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter Tags
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Row(
                children: [
                  _buildFilterTag('지자체'),
                  const SizedBox(width: 10),
                  _buildFilterTag('국립공원'),
                ],
              ),
            ),
          ),

          // Camping Sites List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  // 1) 구미 캠핑장
                  InkWell(
                    onTap: () {
                      // 구미 캠핑장 클릭 => camping_info_screen.dart 이동
                      Navigator.pushNamed(context, '/camping_info');
                    },
                    child: _buildCampSiteCard(
                      image: 'assets/images/camp1.jpg',
                      location: '경북 구미시',
                      stars: 180,
                      name: '구미 캠핑장',
                      type: '지자체야영장',
                      isAvailable: true,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // 2) 소백산삼가야영장
                  _buildCampSiteCard(
                    image: 'assets/images/camp2.jpg',
                    location: '경북 영주시',
                    stars: 10,
                    name: '소백산삼가야영장',
                    type: '국립공원 야영장',
                    isAvailable: false,
                  ),
                  const SizedBox(height: 10),

                  // 3) 구미 금오산야영장
                  _buildCampSiteCard(
                    image: 'assets/images/camp3.jpg',
                    location: '경북 구미시',
                    stars: 60,
                    name: '구미 금오산야영장',
                    type: '지자체야영장',
                    isAvailable: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        '#$text',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCampSiteCard({
    required String image,
    required String location,
    required int stars,
    required String name,
    required String type,
    bool isAvailable = true,
    bool hasAvailabilityTag = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Camp Image
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                image,
                width: 75,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Camp Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    Text(
                      ' $stars',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          // Availability Tag
          if (hasAvailabilityTag)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  isAvailable ? '예약 가능' : '예약 마감',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
