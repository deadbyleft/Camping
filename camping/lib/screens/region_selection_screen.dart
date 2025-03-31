import 'package:flutter/material.dart';

class RegionSelectionScreen extends StatelessWidget {
  final List<String> regions = [
    "서울", "인천", "경기", "강원",
    "충남/대전", "충북", "경남", "경북",
    "대구", "전남/광주", "전북", "제주"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("금오캠핑 (가제)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("지역을 선택해주세요"),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2.5,
                children: regions.map((region) {
                  return _buildRegionButton(context, region);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionButton(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail', arguments: text);
        },
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 14)),
      ),
    );
  }
}