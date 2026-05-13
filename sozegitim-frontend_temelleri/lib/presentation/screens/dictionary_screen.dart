import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/theme/app_colors.dart';

class DictionaryScreen extends StatelessWidget {
  final VoidCallback onGoHome;

  const DictionaryScreen({
    super.key,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildWordCard(),
              const SizedBox(height: 20),
              _buildLearningCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onGoHome,
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.cardNavy,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 26,
            ),
          ),
        ),
        const Text(
          'Sözlük',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const Icon(
          Icons.bookmark_border,
          color: AppColors.white,
          size: 32,
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 62,
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: AppColors.grey, size: 30),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Kelime ara...',
              style: TextStyle(color: AppColors.grey, fontSize: 18),
            ),
          ),
          Icon(Icons.mic_none, color: AppColors.blue, size: 30),
        ],
      ),
    );
  }

  Widget _buildWordCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Ambition',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Icon(Icons.star_border, color: AppColors.blue, size: 32),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(Icons.volume_up, color: AppColors.purple),
              SizedBox(width: 10),
              Text(
                '/æmˈbɪʃən/',
                style: TextStyle(fontSize: 18, color: AppColors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'NOUN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          _buildActionButtons(),
          const SizedBox(height: 24),
          _sectionTitle('ANLAMI'),
          const SizedBox(height: 8),
          const Text(
            'Büyük başarı elde etme arzusu; hırs, istek, azim.',
            style: TextStyle(fontSize: 16, color: AppColors.white),
          ),
          const Divider(height: 32, color: AppColors.cardBorder),
          _sectionTitle('ÖRNEK CÜMLELER'),
          const SizedBox(height: 10),
          _bulletText('She has a great ambition and wants to be the best.'),
          _bulletText('His ambition drives him to work harder every day.'),
          const Divider(height: 32, color: AppColors.cardBorder),
          _sectionTitle('EŞ ANLAMLILAR'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _chip('aspiration'),
              _chip('drive'),
              _chip('desire'),
              _chip('goal'),
              _chip('aim'),
            ],
          ),
          const Divider(height: 32, color: AppColors.cardBorder),
          _sectionTitle('NOTLARIM'),
          const SizedBox(height: 12),
          _buildNoteBox(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        _actionButton(Icons.volume_up, 'Telaffuz Et', AppColors.blue),
        const SizedBox(width: 8),
        _actionButton(Icons.add, 'Not Ekle', AppColors.yellow),
        const SizedBox(width: 8),
        _actionButton(Icons.note_add, 'Listeye Ekle', AppColors.green),
      ],
    );
  }

  Widget _actionButton(IconData icon, String text, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: AppColors.blue, fontSize: 22)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: AppColors.navy,
      labelStyle: const TextStyle(color: AppColors.white),
      side: BorderSide.none,
    );
  }

  Widget _buildNoteBox() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: const Row(
        children: [
          Icon(Icons.assignment, color: AppColors.yellow),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Hayalimdeki işi yapmak için çok çalışmalıyım.',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.purple),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 48,
            lineWidth: 10,
            percent: 0.72,
            center: const Text(
              '72%',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            progressColor: AppColors.purple,
            backgroundColor: AppColors.navy,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KELİMEYİ ÖĞRENME DURUMU',
                  style: TextStyle(
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Doğru Cevaplama Oranı'),
                SizedBox(height: 6),
                Text(
                  'Son çalışma: Bugün',
                  style: TextStyle(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
