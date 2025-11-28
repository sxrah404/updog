import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'package:intl/intl.dart';

class NewEntry {
  final String feeling;
  final String entryDate;
  final String entryText;

  NewEntry({
    required this.feeling,
    required this.entryDate,
    required this.entryText,
  });
}

class JournalNewEntryPage extends StatefulWidget {
  final void Function(int) select;
  final void Function(NewEntry)? onSave;
  final String? emotion;

  const JournalNewEntryPage({
    super.key,
    required this.select,
    this.emotion,
    this.onSave,
  });

  @override
  State<JournalNewEntryPage> createState() => _JournalNewEntryPageState();
}

class _JournalNewEntryPageState extends State<JournalNewEntryPage> {
  late TextEditingController _dateController;
  late TextEditingController _journalEntryController;

  @override
  void initState() {
    super.initState();
    String date = DateFormat('MM/dd/yyyy').format(DateTime.now());

    _dateController = TextEditingController(text: date);
    _journalEntryController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _journalEntryController.dispose();
    super.dispose();
  }

  String _emotionImage() {
    switch (widget.emotion) {
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

  void _saveEntry() {
    if (_dateController.text.isEmpty || _journalEntryController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Missing field')));
      return;
    }

    final entry = NewEntry(
      feeling: widget.emotion ?? 'other',
      entryDate: _dateController.text,
      entryText: _journalEntryController.text,
    );

    widget.onSave?.call(entry);

    setState(() {
      //_nameController.clear();
      _journalEntryController.clear();
      //_dateController = TextEditingController(text: DateFormat('MM/dd/yyyy').format(DateTime.now()));
    });
  }

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
              _emotionImage(),
              fit: BoxFit.contain,
              height: screenHeight * 0.18,
            ),
            //Feeling text on the left and date on the right
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenHeight * 0.3,
                    child: Row(
                      children: [
                        Text('feeling: ',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            //color: Colors.black
                          ),
                        ),
                      
                        Text(widget.emotion ?? '',  
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            decoration: TextDecoration.underline
                            //color: Colors.black
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(
                    width: 76,
                    child: TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        //color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Journal entry
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.05),
              child: SizedBox(
                height: screenHeight * 0.3,
                width: screenHeight * 0.4,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  controller: _journalEntryController,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
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
                      widget.select(0);
                    },
                    child: Image.asset(
                      'assets/images/arrow.png',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.10,
                    ),
                  ),

                  SizedBox(width: screenHeight * 0.2),
                  GestureDetector(
                    onTap: () {
                      _saveEntry();
                      widget.select(2);
                    },
                    child: Image.asset(
                      'assets/images/save.png',
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
