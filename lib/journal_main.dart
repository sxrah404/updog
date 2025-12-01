import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalMainPage extends StatelessWidget {
  final void Function(int) select;
  const JournalMainPage({super.key, required this.select});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(left: screenHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    select(1);
                  },
                  child: Image.asset(
                    'assets/images/new_entry.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.18,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    select(3);
                  },
                  child: Image.asset(
                    'assets/images/past_entries.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.18,
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
