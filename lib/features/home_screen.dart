import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'cart/cart.dart';
import 'profile/profile.dart';
import 'shopping/shopping.dart';
import '../style/theme.dart';

class HomeScreen extends StatefulWidget {
  final int index;

  HomeScreen({required String tab, Key? key})
      : index = indexFrom(tab),
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static int indexFrom(String tab) {
    switch (tab) {
      case 'cart':
        return 1;
      case 'profile':
        return 2;
      case 'shopping':
      default:
        return 0;
    }
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsApp.mainColor,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
              switch (index) {
                case 0:
                  context.go('/shop');
                  break;
                case 1:
                  context.go('/cart');
                  break;
                case 2:
                  context.go('/profile');
                  break;
              }
            },
          );
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [Shopping(), Cart(), Profile()],
      ),
    );
  }
}
