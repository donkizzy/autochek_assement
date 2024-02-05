import 'package:autochek_assessment/features/cars/presentation/pages/home.dart';
import 'package:autochek_assessment/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  List<Widget> children = const [
    Home(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1.0,
        backgroundColor: codGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.yellow,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mineShaftBlack,
        unselectedItemColor: armadilloBrown.withOpacity(0.5),
        onTap: onTabChanged,
        currentIndex: selectedIndex,
        elevation: 1.0,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: SizedBox(), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: children,
      ),
    );
  }

  void onTabChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
