import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'theme_provider.dart';
import 'journal_main.dart';
import 'journal_new.dart';
import 'journal_past.dart';
import 'journal_view.dart';
import 'journal_emotions.dart';

class JournalPage extends StatefulWidget {
  final int startingIndex;
  final String? emotion;

  const JournalPage({super.key, this.startingIndex = 0, this.emotion});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  late int _index;
  List<NewEntry> _entries = [];
  bool _isLoading = true;
  NewEntry? _selectedEntry;
  String? _selectedEmotion;

  @override
  void initState() {
    super.initState();
    _selectedEmotion = widget.emotion;
    _index = widget.emotion != null ? 1 : widget.startingIndex;
    _loadEntries();
  }

  // load entries from shared prefs
  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final String? entriesJson = prefs.getString('journal_entries');

    if (entriesJson != null) {
      final List<dynamic> decoded = json.decode(entriesJson);
      setState(() {
        _entries = decoded.map((item) => NewEntry.fromJson(item)).toList();
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // save entries to shared prefs
  Future<void> _saveEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = json.encode(
      _entries.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('journal_entries', encoded);
  }

  void _select(int i) => setState(() => _index = i);

  void _addEntry(NewEntry entry) {
    setState(() {
      _entries.add(entry);
    });
    _saveEntries();
  }

  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
    _saveEntries();
  }

  void _viewEntry(NewEntry entry) {
    setState(() {
      _selectedEntry = entry;
      _index = 4; 
    });
  }

  void _setEmotion(String feeling){
    setState((){
      _selectedEmotion = feeling;
      _index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (_isLoading) { // loading screen
      return Center(child: CircularProgressIndicator());
    }

    List<Widget> pages = [
      JournalMainPage(select: _select),
      JournalNewEntryPage(
        select: _select,
        emotion: _selectedEmotion,
        onSave: _addEntry,
      ),
      JournalEmotionsPage(
        select: _select,
        onEmotionSelected: _setEmotion,
      ),
      JournalPastEntriesPage(
        entries: _entries,
        select: _select,
        onDelete: _deleteEntry,
        onView: _viewEntry,
      ),
      if (_selectedEntry != null) 
        JournalViewEntryPage(
          entry: _selectedEntry!,
          select: _select,
        ),
      
      
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
