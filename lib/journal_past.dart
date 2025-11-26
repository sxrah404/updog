import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalPastEntriesPage extends StatelessWidget {
  final void Function(int) select;
  const JournalPastEntriesPage({super.key, required this.select});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                select(1);
              },
              child: Image.asset('assets/images/arrow.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.10,
              ),
            ),

          
          ],
        );
        
      },
    );
  }
}