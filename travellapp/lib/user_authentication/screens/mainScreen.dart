import 'package:flutter/material.dart';

import 'package:travellapp/user_authentication/screens/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/karsten-winegeart-QOYNpMkcAFA-unsplash.jpg',
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.only(left: 14, top: 55),
              child: Image.asset(
                'assets/images/Group 37.png',
                width: 88.96,
                height: 27.47,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 12, left: 17),
              width: 247,
              child: const Text(
                'Explore Amazing Places Around The Globe',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 500,
            ),
            Center(
              child: Container(
                  width: 213,
                  height: 33,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('GET STARTED',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.backgroundcolor,
                        elevation: 10),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
