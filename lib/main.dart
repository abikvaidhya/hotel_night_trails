import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/rooms_section.dart';
import 'widgets/cafe_section.dart';
import 'widgets/parking_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const NightTrailsApp());
}

class NightTrailsApp extends StatelessWidget {
  const NightTrailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Night Trails',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _roomsKey = GlobalKey();
  final GlobalKey _cafeKey = GlobalKey();
  final GlobalKey _parkingKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ink,
      body: Column(
        children: [
          NavBar(
            onRoomsTap: () => _scrollTo(_roomsKey),
            onCafeTap: () => _scrollTo(_cafeKey),
            onParkingTap: () => _scrollTo(_parkingKey),
            onContactTap: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeroSection(onBookTap: () => _scrollTo(_contactKey)),
                  Container(key: _roomsKey, child: const RoomsSection()),
                  Container(key: _cafeKey, child: const CafeSection()),
                  Container(key: _parkingKey, child: const ParkingSection()),
                  Container(key: _contactKey, child: const ContactSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
