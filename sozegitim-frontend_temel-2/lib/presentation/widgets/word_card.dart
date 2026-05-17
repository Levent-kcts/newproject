import 'package:flutter/material.dart';
import 'package:my_app/domain/entities/word.dart';

class WordCard extends StatelessWidget {
  final Word word;

  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.term,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 12),
            Text(
              word.definition,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            if (word.examples.isNotEmpty) ...[
              const SizedBox(height: 18),
              const Text(
                'Örnekler',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...word.examples.map(
                (example) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('• $example'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
