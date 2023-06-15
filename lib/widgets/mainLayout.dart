import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int keyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
        title: const Text('Home'),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: keyIndex,
        onTap: (index) => {setState(() => keyIndex = index)},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: '用户'),
        ],
      ),
    );
  }
}
