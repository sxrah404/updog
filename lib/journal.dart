import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'journal_main.dart';
import 'journal_new.dart';
import 'journal_past.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  int _index = 0;

  void _select(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<Widget> pages = [JournalMainPage(select: _select), JournalNewEntryPage(select: _select), JournalPastEntriesPage(select: _select)];


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
                    //TODO format pages and add navigation feature
                    //JournalMainPage, JournalNewEntryPage, JournalPastEntriesPage
                    
                    Center(child: IndexedStack(index: _index, children: pages)),
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
