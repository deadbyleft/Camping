import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색
      backgroundColor: Colors.white,
      // 상단 앱바
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작 예시
          },
        ),
        title: const Text(
          '검색 결과',
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
              // 홈으로 이동 로직
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 검색 바
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '찾고싶은 캠핑장을 검색하세요',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black54),
                    onPressed: () {
                      // 검색 로직
                    },
                  ),
                ],
              ),
            ),
          ),

          // 필터 태그
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterTag('지자체'),
                const SizedBox(width: 8),
                _buildFilterTag('국립공원'),
              ],
            ),
          ),

          // 검색 결과 리스트
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
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
                  // 2번째 캠핑장 카드
                  _buildCampSiteCard(
                    image: 'assets/images/camp2.jpg',
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

  /// 필터 태그 위젯
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

  /// 캠핑장 카드 위젯
  Widget _buildCampSiteCard({
    required String image,
    required String location,
    required int stars,
    required String name,
    required String type,
    bool isAvailable = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // 이미지
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
          // 텍스트 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 위치 + 별점
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
                // 캠핑장 이름
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                // 캠핑장 유형
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
          // 예약 가능/마감 태그
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
