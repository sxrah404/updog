import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalEmotionsPage extends StatelessWidget {
  final void Function(int) select;
  const JournalEmotionsPage({super.key, required this.select});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    select(1);
                  },
                  child: Image.asset(
                    'assets/images/happy.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    select(1);
                  },
                  child: Image.asset(
                    'assets/images/sad.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    select(1);
                  },
                  child: Image.asset(
                    'assets/images/mad.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    select(1);
                  },
                  child: Image.asset(
                    'assets/images/other.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
                  ),
                ),
                
              ],
            ),
            GestureDetector(
              onTap: () {
                select(1);
              },
              child: Image.asset(
                'assets/images/arrow.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.10,
              ),
            ),
            SizedBox(width: screenHeight * 0.21),
            SizedBox(width: screenHeight * 0.10),
            
          ],
        );
        
      },
    );
  }
}