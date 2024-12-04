import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Imageslider extends StatefulWidget {
  const Imageslider({super.key});

  @override
  State<Imageslider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<Imageslider> {
  final PageController _pageController = PageController();
  int _currentpage = 0;

  final List<String> Images = [
    'assets/images/Frame 47.png',
    'assets/images/Frame 133.png',
    'assets/images/Frame 47.png'
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentpage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        child: PageView.builder(
            controller: _pageController,
            itemCount: Images.length,
            onPageChanged: (Index) {
              _pageController.nextPage(
                  duration: Duration(microseconds: 300), curve: Curves.easeIn);
            },
            scrollDirection: Axis.horizontal,
            allowImplicitScrolling: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    image: DecorationImage(
                      image: AssetImage(Images[index]),
                    )),
              );
            }),
      ),
      Positioned(
        bottom: 50,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            Images.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: _currentpage == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentpage == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
