import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'journal_new.dart';
import 'theme_provider.dart';

class JournalViewEntryPage extends StatefulWidget {
  final NewEntry entry;
  final void Function(int) select;

  const JournalViewEntryPage({
    super.key,
    required this.entry,
    required this.select,
  });

  @override
  State<JournalViewEntryPage> createState() => _JournalViewEntryPageState();
}

class _JournalViewEntryPageState extends State<JournalViewEntryPage> {
  // displays different image based on emotion
  String _emotionImage() {
    switch (widget.entry.feeling) {
      case 'happy':
        return 'assets/images/happy_blank.png';
      case 'sad':
        return 'assets/images/sad_blank.png';
      case 'mad':
        return 'assets/images/mad_blank.png';
      default:
        return 'assets/images/other_blank.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Padding(
          padding: EdgeInsets.only(left: screenHeight * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset(
                _emotionImage(),
                fit: BoxFit.contain,
                height: screenHeight * 0.2,
              ),
              // Feeling text on the left and date on the right
              SizedBox(
                width: screenHeight * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'feeling: ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight * 0.016,
                          ),
                        ),
                        Text(
                          widget.entry.feeling,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.016,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.entry.entryDate,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.016,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(height: screenHeight * 0.02),
              // Journal entry
              Container(
                height: screenHeight * 0.3,
                width: screenHeight * 0.4,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(200, 66, 66, 66),
                    width: 4,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.entry.entryText,
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
                  ),
                ),
              ),
              Spacer(),
              // Back button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.select(3);
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
              SizedBox(height: screenHeight * 0.105),
            ],
          ),
        );
      },
    );
  }
}
