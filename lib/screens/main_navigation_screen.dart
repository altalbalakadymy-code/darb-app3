import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'home/home_screen.dart';
import 'orders/orders_screen.dart';
import 'chat/chat_screen.dart';
import 'profile/profile_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    OrdersScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      body: IndexedStack(
        index: provider.currentNavIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: provider.currentNavIndex,
          onDestinationSelected: (idx) => provider.setNavIndex(idx),
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFF0D9488).withOpacity(0.15),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded, color: Color(0xFF0D9488)),
              label: 'استكشف',
            ),
            NavigationDestination(
              icon: Icon(Icons.assignment_outlined),
              selectedIcon: Icon(Icons.assignment_rounded, color: Color(0xFF0D9488)),
              label: 'الحجوزات',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat_rounded, color: Color(0xFF0D9488)),
              label: 'المحادثة',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded, color: Color(0xFF0D9488)),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
