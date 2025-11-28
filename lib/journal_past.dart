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
    required this.select
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
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return Card(
                    
                    child: ListTile(
                      title: Text(entry.feeling),
                      subtitle: Text(entry.entryDate),
                      //onTap: () => _openRecipeDetails(recipe),
                    ),
                  );
                },
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