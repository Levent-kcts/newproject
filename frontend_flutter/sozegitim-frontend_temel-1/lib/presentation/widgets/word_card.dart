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
              word.word,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 6),
            if (word.translation.isNotEmpty)
              Text(
                word.translation,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
              ),
            if (word.phonetic != null && word.phonetic!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                word.phonetic!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
            ],
            const SizedBox(height: 12),
            ...word.meanings.map(
              (meaning) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaning.partOfSpeech,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(meaning.definition),
                    if (meaning.example != null && meaning.example!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text('Örnek: ${meaning.example!}'),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
