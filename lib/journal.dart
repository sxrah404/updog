import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'Journal',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
