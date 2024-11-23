import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travellapp/lib/features/travel/presentation/widgets/imageslider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(stops: [
          0.41,
          0.76
        ], colors: [
          Color.fromRGBO(226, 204, 175, 1),
          Color.fromRGBO(255, 255, 255, 1)
        ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Row(
                  children: [
                    Image.asset('assets/vectors/Frame 11.png'),
                    const Spacer(),
                    Image.asset('assets/vectors/Union.png'),
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset('assets/vectors/cart.png')
                  ],
                ),
              ),
              const Imageslider()
            ],
          ),
        ),
      ),
    );
  }
}
