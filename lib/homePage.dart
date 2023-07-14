import 'package:flutter/material.dart';
import 'package:tiktok_ui/homescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,




          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'home',
                icon: Icon(
                  Icons.home,

                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,

              ),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 40,
              ),
              label: 'add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,

              ),
              label: 'message',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,

              ),
              label: 'profile',
            )
          ]),
    );
  }
}
