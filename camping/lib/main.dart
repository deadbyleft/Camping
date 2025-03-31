import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "금오캠핑 (가제)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("지역을 선택해주세요"),
              SizedBox(height: 20),
              SizedBox(
                width: 250, // 전체 너비 조정 (작게 줄임)
                child: GridView.count(
                  shrinkWrap: true, // GridView가 Column 안에서 크기 조절되도록 함
                  crossAxisCount: 2, // 한 줄에 2개씩 배치
                  crossAxisSpacing: 8, // 버튼 사이 가로 간격 조정
                  mainAxisSpacing: 8, // 버튼 사이 세로 간격 조정
                  childAspectRatio: 2.5, // 버튼의 가로 세로 비율 조정 (좁고 길게)
                  children: [
                    "서울", "인천", "경기", "강원",
                    "충남/대전", "충북", "경남", "경북",
                    "대구", "전남/광주", "전북", "제주"
                  ].map((region) => _buildRegionButton(region)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 버튼 스타일을 위한 함수 (크기 축소)
  Widget _buildRegionButton(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300], // 버튼 배경색
        borderRadius: BorderRadius.circular(15), // 둥근 모서리 조정
      ),
      padding: EdgeInsets.symmetric(vertical: 10), // 버튼 높이 조정
      child: TextButton(
        onPressed: () {
          print("$text 선택됨"); // 버튼 클릭 시 출력
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 14), // 폰트 크기 축소
        ),
      ),
    );
  }
}
