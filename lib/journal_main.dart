import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalPageMain extends StatelessWidget {
  const JournalPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Column(
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
        );
        
      },
    );
  }
}