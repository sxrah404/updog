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

  // converting to JSON for shared prefs
  Map<String, dynamic> toJson() {
    return {'feeling': feeling, 'entryDate': entryDate, 'entryText': entryText};
  }

  // creating from JSON
  factory NewEntry.fromJson(Map<String, dynamic> json) {
    return NewEntry(
      feeling: json['feeling'] as String,
      entryDate: json['entryDate'] as String,
      entryText: json['entryText'] as String,
    );
  }
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

  // displays different hint text based on emotion
  String _getHintText() {
    switch (widget.emotion) {
      case 'happy':
        return 'What made you happy today?';
      case 'sad':
        return 'What made you sad today?';
      case 'mad':
        return 'What made you mad today?';
      default:
        return 'Write about your day...';
    }
  }

  // displays different image based on emotion
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
    widget.select(3);

    setState(() {
      _journalEntryController.clear();
    });
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
              // Emotion image and button to change emotion
              GestureDetector(
                onTap: () {
                  widget.select(2);
                },
                child: Image.asset(
                  _emotionImage(),
                  fit: BoxFit.contain,
                  height: screenHeight * 0.2,
                ),
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
                          widget.emotion ?? '',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.016,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenHeight * 0.12,
                      child: TextFormField(
                        controller: _dateController,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.016,
                        ),
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
                  )
                ),
                
                child: TextField(
                  maxLines: null,
                  expands: true,
                  controller: _journalEntryController,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: _getHintText(),
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),  
              ),
              Spacer(),
              // Back and save buttons
              Row(
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
                  SizedBox(width: screenHeight * 0.15),
                  GestureDetector(
                    onTap: () {
                      _saveEntry();
                    },
                    child: Image.asset(
                      'assets/images/save.png',
                      fit: BoxFit.contain,
                      height: screenHeight * 0.10,
                    ),
                  ),
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
