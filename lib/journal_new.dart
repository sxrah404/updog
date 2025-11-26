import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class JournalNewEntryPage extends StatelessWidget {
  final void Function(int) select;
  const JournalNewEntryPage({super.key, required this.select});

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
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.05),
              child: SizedBox(
                height: screenHeight * 0.4,
                width: screenHeight * 0.4, 
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'Type here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                      ),
                    ),
                  )
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),
        

            //Back and save buttons
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      select(0);
                    },
                    child: Image.asset('assets/images/arrow.png',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.10,
                    ),
                  ),

                  SizedBox(width: screenHeight * 0.2),
                  GestureDetector(
                    onTap: () {
                      select(2);
                    },
                    child: Image.asset('assets/images/save.png',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}