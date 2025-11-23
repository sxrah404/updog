import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.1),
            child: Stack(
              children: [
                Container(
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
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/page.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            // turn this into button later
                            'assets/images/new_entry.png',
                            fit: BoxFit.contain,
                            height: screenHeight * 0.18,
                          ),
                          Image.asset(
                            // turn this into button later
                            'assets/images/past_entries.png',
                            fit: BoxFit.contain,
                            height: screenHeight * 0.18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Trying something out
