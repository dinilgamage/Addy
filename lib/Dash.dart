import 'package:addy/homescreen/home.dart';
import 'package:addy/postscreen/post.dart';
import 'package:addy/profilescreen/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int _pageIndex = 0; // Variable to track the currently selected page index

  // List of pages to navigate to
  final List<Widget> _pages = [
    HomeScreen(),
    PostScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex], // Show the currently selected page
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).colorScheme.primary,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 35, 93, 89)
                : Color.fromARGB(255, 112, 177, 173),
          ),
          Icon(
            Icons.add_circle,
            size: 30,
            color: Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 35, 93, 89)
                : Color.fromARGB(255, 112, 177, 173),
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Theme.of(context).brightness == Brightness.light
                ? Color.fromARGB(255, 35, 93, 89)
                : Color.fromARGB(255, 112, 177, 173),
          ),
        ],
        onTap: (index) {
          // Handle navigation when a tab is selected
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
