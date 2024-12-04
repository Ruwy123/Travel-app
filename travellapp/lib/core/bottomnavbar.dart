import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travellapp/core/configs/theme/colors.dart';
import 'package:travellapp/lib/features/travel/presentation/pages/homescreen.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int currentIndex = 0;
  final navscreens = [
    const home(),
    Container(
      child: Text('hello'),
    ),
    Container(
      child: Text('holaaa'),
    ),
    Container(
      child: Text('ahhhhhh'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          backgroundColor: Color.fromRGBO(226, 204, 175, 1),
          indicatorColor: ColorApp.welcomeText,
          height: 75,
          elevation: 0,
          selectedIndex: currentIndex,
          onDestinationSelected: (Index) => setState(() {
                currentIndex = Index;
              }),
          destinations: const [
            NavigationDestination(
                icon: ImageIcon(AssetImage('assets/vectors/home (1).png')),
                label: 'Home'),
            NavigationDestination(
                icon: ImageIcon(AssetImage('assets/vectors/shopping-bag.png')),
                label: 'Store'),
            NavigationDestination(
                icon: ImageIcon(AssetImage('assets/vectors/heart (1).png')),
                label: 'Saved'),
            NavigationDestination(
                icon: ImageIcon(AssetImage('assets/vectors/profile.png')),
                label: 'Home'),
          ]),
      body: navscreens[currentIndex],
    );
  }
}
