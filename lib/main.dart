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
    await DesktopWindow.setWindowSize(const Size(780, 1000));
    await DesktopWindow.setMinWindowSize(const Size(500, 700));
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
    final screenHeight = MediaQuery.of(context).size.height;
    final grassHeight = screenHeight * 0.1;

    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            themeProvider.getImagePath('assets/images/bg.png'),
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    themeProvider.getImagePath('assets/images/grass.png'),
                    width: double.infinity,
                    height: grassHeight,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              _pages[_selectedIndex],
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: grassHeight,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/home.png',
                          width: grassHeight * 0.6,
                        ),
                        onPressed: () => _onItemTapped(0),
                      ),
                      SizedBox(width: grassHeight * 0.4),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/journal.png',
                          width: grassHeight * 0.6,
                        ),
                        onPressed: () => _onItemTapped(1),
                      ),
                      SizedBox(width: grassHeight * 0.4),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/settings.png',
                          width: grassHeight * 0.6,
                        ),
                        onPressed: () => _onItemTapped(2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.1),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.04),
                  child: Image(
                    image: AssetImage(
                      themeProvider.getImagePath('assets/images/logo.png'),
                    ),
                    width: screenHeight * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "i'm feeling...",
                  style: TextStyle(
                    fontSize: screenHeight * 0.024,
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
                            ? _buildWideLayout(themeProvider, screenHeight)
                            : _buildNarrowLayout(themeProvider, screenHeight);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWideLayout(ThemeProvider themeProvider, double screenHeight) {
    final buttonSize = screenHeight * 0.2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/happy.png'),
          'happy',
          buttonSize,
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/sad.png'),
          'sad',
          buttonSize,
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/mad.png'),
          'mad',
          buttonSize,
        ),
        _buildEmotionButton(
          themeProvider.getImagePath('assets/images/other.png'),
          'other',
          buttonSize,
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(ThemeProvider themeProvider, double screenHeight) {
    final buttonSize = screenHeight * 0.2;

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
              buttonSize,
            ),
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/sad.png'),
              'sad',
              buttonSize,
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
              buttonSize,
            ),
            _buildEmotionButton(
              themeProvider.getImagePath('assets/images/other.png'),
              'other',
              buttonSize,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmotionButton(String asset, String label, double size) {
    return GestureDetector(
      onTap: () => _onEmotionSelected(label),
      child: Container(
        constraints: BoxConstraints(maxWidth: size, maxHeight: size),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(asset, width: size, height: size, fit: BoxFit.contain),
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
