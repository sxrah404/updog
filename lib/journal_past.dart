import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalPastEntriesPage extends StatelessWidget {
  const JournalPastEntriesPage({super.key});

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
              'assets/images/arrow.png',
              fit: BoxFit.contain,
              height: screenHeight * 0.18,
            ),
          ],
        );
        
      },
    );
  }
}