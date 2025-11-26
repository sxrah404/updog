import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'journal_main.dart';
import 'journal_new.dart';
import 'journal_past.dart';

class JournalPage extends StatefulWidget {
  final int startingIndex;
  const JournalPage({super.key, this.startingIndex = 0});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {

  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.startingIndex;
  }

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
