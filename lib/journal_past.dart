import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updog/journal_new.dart';
import 'theme_provider.dart';

class JournalPastEntriesPage extends StatefulWidget {
  final List<NewEntry> entries;
  final void Function(int) select;

  const JournalPastEntriesPage({
    super.key,
    required this.entries,
    required this.select,
  });

  @override
  State<JournalPastEntriesPage> createState() => _JournalPastEntriesPageState();
}

class _JournalPastEntriesPageState extends State<JournalPastEntriesPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final entries = widget.entries;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.05),
                child: SizedBox(
                  width: screenHeight * 0.45,
                  height: screenHeight * 0.5,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(60, 66, 66, 66),
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Color.fromARGB(200, 66, 66, 66),
                              width: 6,
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              entry.feeling,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: screenHeight * 0.016,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              entry.entryDate,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: screenHeight * 0.014,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                widget.select(1);
              },
              child: Image.asset(
                'assets/images/arrow.png',
                fit: BoxFit.contain,
                height: screenHeight * 0.10,
              ),
            ),
          ],
        );
      },
    );
  }
}
