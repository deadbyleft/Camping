import 'package:flutter/material.dart';
import 'screens/region_selection_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/camping_info_screen.dart';
import 'screens/camping_reservation_screen.dart';
import 'screens/camping_sites_page.dart';
import 'screens/search_result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '금오캠핑',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // ← 초기 화면으로 복구됨!
      routes: {

        '/': (context) => RegionSelectionScreen(),
        '/detail': (context) => DetailScreen(),
        '/camping_info': (context) => CampingInfoScreen(),
        '/camping_reservation': (context) => CampingReservationScreen(),
        '/camping_sites_page': (context)=>CampingSitesPage(),
        '/search_result': (context)=>SearchResultPage()
      },
    );
  }
}