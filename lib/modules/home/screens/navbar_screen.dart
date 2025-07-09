import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_review/modules/home/screens/dashboard_screen.dart';
import 'package:movie_review/modules/home/screens/profile_screen.dart';

import 'movie_detail_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});
  // static String get linkRoute => "/dashboard";
  // static String get toRoute => "/home";

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    DashboardScreen(),
    MovieDetailScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff002335),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: const Color(0xff001C29),
          selectedItemColor: const Color(0xffFFB703),
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.bookmark),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
