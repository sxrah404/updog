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
                Center(
                  child: Image.asset(
                    'assets/images/journal1.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
