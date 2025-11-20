import 'dart:io';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'journal.dart';
import 'settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(800, 1000));
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
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
  final List<Widget> _pages = const [HomePage(), JournalPage(), SettingsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [_pages[_selectedIndex], _buildNavBar()]),
    );
  }

  Widget _buildNavBar() {
    return Positioned(
      bottom: 6,
      left: 0,
      right: 0,
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                themeProvider.getImagePath('assets/images/bg.png'),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image(
                    image: AssetImage(
                      themeProvider.getImagePath('assets/images/logo.png'),
                    ),
                    width: 500,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "I'm feeling...",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    color: themeProvider.isDarkMode
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final bool isWide = constraints.maxWidth > 1000;
                        return isWide
                            ? _buildWideLayout(themeProvider)
                            : _buildNarrowLayout(themeProvider);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(ThemeProvider themeProvider) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/happy.png'),
          'happy',
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/sad.png'),
          'sad',
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/mad.png'),
          'mad',
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/other.png'),
          'other',
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(ThemeProvider themeProvider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/happy.png'),
              'happy',
            ),
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/sad.png'),
              'sad',
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/mad.png'),
              'mad',
            ),
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/other.png'),
              'other',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmotionButton(String asset, String label) {
    return GestureDetector(
      onTap: () => _onEmotionSelected(label),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(asset, width: 200, height: 200, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }

  void _onEmotionSelected(String emotion) {
    print('Selected: $emotion');
    // figure out logic later
  }
}
