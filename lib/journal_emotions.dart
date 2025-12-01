import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalEmotionsPage extends StatelessWidget {
  final void Function(int) select;
  final void Function(String) onEmotionSelected;
  const JournalEmotionsPage({super.key, required this.select, required this.onEmotionSelected});

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
                SizedBox(height: screenHeight * 0.1),
                //children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onEmotionSelected('happy');
                        select(1);
                      },
                      child: Image.asset(
                        'assets/images/happy.png',
                        fit: BoxFit.contain,
                        height: screenHeight * 0.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onEmotionSelected('sad');
                        select(1);
                      },
                      child: Image.asset(
                        'assets/images/sad.png',
                        fit: BoxFit.contain,
                        height: screenHeight * 0.2,
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
                        onEmotionSelected('mad');
                        select(1);
                      },
                      child: Image.asset(
                        'assets/images/mad.png',
                        fit: BoxFit.contain,
                        height: screenHeight * 0.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onEmotionSelected('other');
                        select(1);
                      },
                      child: Image.asset(
                        'assets/images/other.png',
                        fit: BoxFit.contain,
                        height: screenHeight * 0.2,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: screenHeight * 0.105),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(width: screenHeight * 0.31),
                    //SizedBox(width: screenHeight * 0.10),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
              ],
            )
          ),
        );
        
      },
    );
  }
}