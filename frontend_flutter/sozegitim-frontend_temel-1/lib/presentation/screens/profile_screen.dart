import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onGoHome;

  const ProfileScreen({
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
              const SizedBox(height: 32),
              _buildProfileCard(),
              const SizedBox(height: 32),
              _buildStats(),
              const SizedBox(height: 32),
              _buildMenuItems(),
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
          'Profil',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 46),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.blue.withAlpha(153)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.yellow,
            child: const Icon(Icons.person, size: 50, color: AppColors.darkNavy),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ali Irmak',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ali.irmak@example.com',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.yellow.withAlpha(51),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'VIP Üye',
              style: TextStyle(
                color: AppColors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _statCard('Toplam XP', '2450 XP', AppColors.blue),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _statCard('Sıralama', '#2', AppColors.yellow),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _statCard('Gün', '42', AppColors.green),
        ),
      ],
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withAlpha(153)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _menuItem(Icons.settings_outlined, 'Ayarlar'),
        _menuItem(Icons.favorite_border, 'Kayıtlı Kelimeler'),
        _menuItem(Icons.history, 'Geçmiş'),
        _menuItem(Icons.notifications_none, 'Bildirimler'),
        _menuItem(Icons.help_outline, 'Yardım'),
        _menuItem(Icons.logout, 'Çıkış Yap'),
      ],
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blue, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 18),
        ],
      ),
    );
  }
}
