import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'journal_main.dart';
import 'journal_new.dart';
import 'journal_past.dart';

class JournalPage extends StatefulWidget {
  final int startingIndex;
  final String? emotion;

  const JournalPage({super.key, this.startingIndex = 0, this.emotion});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  late int _index;
  final List<NewEntry> _entries = [];

  @override
  void initState() {
    super.initState();
    _index = widget.startingIndex;
  }

  void _select(int i) => setState(() => _index = i);

  void _addEntry(NewEntry entry) {
    setState(() {
      _entries.add(entry);
    });
  }

  void _deleteEntry(int index) {
  setState(() {
    _entries.removeAt(index);
  });
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<Widget> pages = [
      JournalMainPage(select: _select),
      JournalNewEntryPage(
        select: _select,
        emotion: widget.emotion,
        onSave: _addEntry,
      ),
      JournalPastEntriesPage(entries: _entries, select: _select,onDelete: _deleteEntry,),
    ];

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.1),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        themeProvider.getImagePath('assets/images/bg.png'),
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/page.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                    IndexedStack(index: _index, children: pages),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
