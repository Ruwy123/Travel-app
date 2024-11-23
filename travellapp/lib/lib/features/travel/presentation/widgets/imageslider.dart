import 'dart:async';

import 'package:flutter/material.dart';

class Imageslider extends StatefulWidget {
  const Imageslider({super.key});

  @override
  State<Imageslider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<Imageslider> {
  final PageController _pageController = PageController();
  int _currentpage = 0;
  Timer? _timer;
  final List<String> Images = [
    'assets/images/Frame 47.png',
    'assets/images/Frame 133.png',
    'assets/images/Frame 47.png'
  ];
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    startSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void startSlide() {
    _timer = Timer.periodic(Duration(microseconds: 300), (timer) {
      if (_currentpage < Images.length - 1) {
        _currentpage++;
      } else {
        _currentpage = 0;
      }
      _pageController.animateTo(_currentpage.toDouble(),
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    });
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
            onPageChanged: (value) {
              setState() {
                _currentpage = value;
              }
            },
            scrollDirection: Axis.horizontal,
            allowImplicitScrolling: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return AnimatedContainer(
                duration: Duration(microseconds: 300),
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
              duration: const Duration(milliseconds: 300),
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
