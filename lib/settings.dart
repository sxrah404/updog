import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.1),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    themeProvider.getImagePath('assets/images/settings_bg.png'),
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.12),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: screenHeight * 0.024,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        color: themeProvider.textColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      padding: EdgeInsets.only(right: screenHeight * 0.014),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            themeProvider.isDarkMode
                                ? 'assets/images/dark_mode.png'
                                : 'assets/images/light_mode.png',
                            width: screenHeight * 0.08,
                            height: screenHeight * 0.08,
                          ),
                          SizedBox(width: screenHeight * 0.02),
                          Text(
                            themeProvider.isDarkMode
                                ? 'Dark Mode'
                                : 'Light Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat',
                              fontSize: screenHeight * 0.02,
                              color: themeProvider.textColor,
                            ),
                          ),
                          SizedBox(width: screenHeight * 0.02),
                          Switch(
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme();
                            },
                            activeThumbColor: Colors.lightGreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
