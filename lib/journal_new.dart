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
            Padding(
              padding: const EdgeInsets.only(left: 44),
              child: SizedBox(
                height: 360, //376
                width: 400, //420
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

            SizedBox(height: 38,),
        

            //Back and save buttons
            Padding(
              padding: const EdgeInsets.only(left: 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // turn this into button later
                    'assets/images/arrow.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
                  ),

                  SizedBox(width: 180,),
                  Image.asset(
                    // turn this into button later
                    'assets/images/save.png',
                    fit: BoxFit.contain,
                    height: screenHeight * 0.10,
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