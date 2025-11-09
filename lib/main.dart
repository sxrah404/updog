import 'dart:io';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'journal.dart';
import 'settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(800, 1200));
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _buildHomePage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double topPadding = constraints.maxHeight * 0.08;
          return Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/logo.png', width: 600),
            ),
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomePage(),
      const JournalPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[_selectedIndex],
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/home.png', width: 60),
                  onPressed: () => _onItemTapped(0),
                ),
                const SizedBox(width: 40),
                IconButton(
                  icon: Image.asset('assets/images/journal.png', width: 60),
                  onPressed: () => _onItemTapped(1),
                ),
                const SizedBox(width: 40),
                IconButton(
                  icon: Image.asset('assets/images/settings.png', width: 60),
                  onPressed: () => _onItemTapped(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
