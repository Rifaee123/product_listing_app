import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_listing_app/presentation/homePage/home_page1.dart';
import 'package:product_listing_app/presentation/loginPage/login_page1.dart';
import 'package:product_listing_app/presentation/wishlistPage/wishlist_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage1(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomePage1(),
    WishlistPage(),
    Placeholder(
      color: Colors.indigoAccent,
    )
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              label: "Products"),
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
      ),
    );
  }
}
