import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
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
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                          Image.asset(
                            // turn this into button later
                            'assets/images/past_entries.png',
                            fit: BoxFit.cover,
                            height: 200,
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