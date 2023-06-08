import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'contact_page.dart';
import 'home_page.dart';
import 'meats_page.dart';
import 'promotions_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final HomePage homePage = HomePage();
  final MeatsPage meatsPage = MeatsPage();
  final PromotionsPage promotionsPage = PromotionsPage();
  final ContactPage contactPage = ContactPage();

  Widget _showPage = HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return homePage;
        break;
      case 1:
        return meatsPage;
        break;
      case 2:
        return promotionsPage;
        break;
      case 3:
        return contactPage;
        break;
      default:
        return Container(
          child: Center(
            child: Text(
              'No page found by page chooser.',
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.local_dining, title: 'Carnes'),
          TabItem(icon: Icons.label, title: 'Promoções'),
          TabItem(icon: Icons.info, title: 'Informações'),
        ],
        backgroundColor: Colors.black,
        initialActiveIndex: pageIndex,
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
