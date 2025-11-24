import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalNewEntryPage extends StatelessWidget {
  const JournalNewEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Feeling image
            Image.asset(
              // turn this into button later
              'assets/images/other.png',
              fit: BoxFit.contain,
              height: screenHeight * 0.18,
            ),

            //Feeling text on the left and date on the right
            Row(children: [],),

            //Journal entry
            TextField(
              decoration: const InputDecoration(
                hintText: 'Type here'
              )
              
            ),

            //Back and save buttons
            Row(
              children: [
                Image.asset(
                  // turn this into button later
                  'assets/images/arrow.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.18,
                ),
                Image.asset(
                  // turn this into button later
                  'assets/images/save.png',
                  fit: BoxFit.contain,
                  height: screenHeight * 0.18,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}