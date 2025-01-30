import 'package:flutter/material.dart';
import 'package:product_listing_app/presentation/homePage/home_page1.dart';
import 'package:product_listing_app/presentation/profilePage/profile_page1.dart';
import 'package:product_listing_app/presentation/wishlistPage/wishlist_page.dart';

class BottemnavigationPage extends StatefulWidget {
  const BottemnavigationPage({super.key});

  @override
  State<BottemnavigationPage> createState() => _BottemnavigationPageState();
}

class _BottemnavigationPageState extends State<BottemnavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage1(),
    // Placeholder(
    //   color: Colors.amber,
    // ),
    WishlistPage(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                elevation: 0,
                onTap: _onItemTapped,
                backgroundColor: Colors.transparent,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                      label: "Wishlist"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: "Profile"),
                ],
              )),
        ));
  }
}
