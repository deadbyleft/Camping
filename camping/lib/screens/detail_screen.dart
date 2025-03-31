import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final region = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('$region 캠핑장')),
      body: Center(
        child: Text('$region 캠핑장 예약 정보 표시 예정', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
