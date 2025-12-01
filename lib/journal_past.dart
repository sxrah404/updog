import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:updog/journal_new.dart';
import 'theme_provider.dart';

class JournalPastEntriesPage extends StatefulWidget {
  final List<NewEntry> entries;
  final void Function(int) select;
  final void Function(int)? onDelete;
  final void Function(NewEntry)? onView;

  const JournalPastEntriesPage({
    super.key,
    required this.entries,
    required this.select,
    this.onDelete,
    this.onView,
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
        return Padding(
          padding: EdgeInsets.only(left: screenHeight * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.15),
              SizedBox(
                width: screenHeight * 0.45,
                height: screenHeight * 0.5,
                // list of past entries
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
                            width: 4,
                          ),
                        ),
                        // entry tile
                        child: ListTile(
                          onTap: () {
                            widget.onView?.call(entry);
                          },
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
                          // delete button
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromARGB(200, 66, 66, 66),
                            ),
                            onPressed: () {
                              widget.onDelete?.call(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              // Back button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  SizedBox(width: screenHeight * 0.21),
                  SizedBox(width: screenHeight * 0.10),
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
