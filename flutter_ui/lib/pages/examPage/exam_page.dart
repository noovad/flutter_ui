
import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/examPage/banner_image.dart';
import 'package:flutter_ui/pages/examPage/category_grid.dart';
import 'package:flutter_ui/pages/examPage/product_list.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            BannerImage(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            CategoryGrid(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Popular Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ProductList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
