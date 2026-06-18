import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Entity/Product.dart';
import '../../shares/system_provider.dart';
import '../Widgets/ProductList.dart';
import '../../pages/cart.dart';
import 'AboutPage.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cartLength = ref.watch(myCartProvider).length;

    final List<Widget> pages = [
      // Home tab
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text(
            "Product List",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: ProductListReponsive(products: Product.products),
        ),
      ),
      // Cart tab
      const CartPage(),
      // Profile tab
      const AboutPage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart),
                if (cartLength > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$cartLength',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
