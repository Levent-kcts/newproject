import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class QuizScreen extends StatefulWidget {
  final VoidCallback onGoHome;

  const QuizScreen({
    super.key,
    required this.onGoHome,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int correctAnswers = 0;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: '"Ambition" kelimesinin Türkçe anlamı nedir?',
      options: ['Başarısızlık', 'Arzu, Hırs', 'Korku', 'İlgi'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: '"Eloquent" ne demek?',
      options: ['Sessiz', 'Akıcı Konuşan', 'Hızlı', 'Yavaş'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: '"Perseverance" nedir?',
      options: ['Pes Etme', 'Azim, Sebat', 'Korku', 'Hızlılık'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: '"Serendipity" anlamı?',
      options: ['Kader', 'Tesadüfi İyi Şans', 'Başarısızlık', 'Talihsizlik'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: '"Meticulous" ne anlama gelir?',
      options: ['Dikkatsiz', 'Ayrıntılı Dikkat', 'Hızlı', 'Tembel'],
      correctIndex: 1,
    ),
  ];

  void selectAnswer(int index) {
    if (index == questions[currentQuestion].correctIndex) {
      setState(() {
        correctAnswers++;
      });
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardNavy,
        title: const Text(
          'Quiz Tamamlandı!',
          style: TextStyle(color: AppColors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              '$correctAnswers / ${questions.length}',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.yellow,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${((correctAnswers / questions.length) * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 24,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onGoHome();
            },
            child: const Text(
              'Ana Sayfa',
              style: TextStyle(color: AppColors.yellow),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestion = 0;
                correctAnswers = 0;
              });
            },
            child: const Text(
              'Tekrar Et',
              style: TextStyle(color: AppColors.blue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: AppColors.darkNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildProgressBar(progress),
              const SizedBox(height: 24),
              _buildQuestionCard(question),
              const SizedBox(height: 24),
              _buildOptions(question),
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
          onTap: widget.onGoHome,
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
        Text(
          'Soru ${currentQuestion + 1}/${questions.length}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.yellow.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '+$correctAnswers',
            style: const TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'İlerleme',
          style: TextStyle(color: AppColors.grey, fontSize: 12),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppColors.navy,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(QuizQuestion question) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.blue.withOpacity(0.6)),
      ),
      child: Text(
        question.question,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOptions(QuizQuestion question) {
    return Column(
      children: List.generate(
        question.options.length,
        (index) => GestureDetector(
          onTap: () => selectAnswer(index),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.blue, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      String.fromCharCode(65 + index),
                      style: const TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    question.options[index],
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}
