import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class ChatWelcomeGrid extends StatelessWidget {
  final ValueChanged<String> onActionTap;

  const ChatWelcomeGrid({
    super.key,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          
          // "Hi, Welcome!👋" heading
          Row(
            children: [
              Text(
                'Hi, Welcome!',
                style: AppStyles.headingXL.copyWith(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '👋',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),

          const SizedBox(height: 36),

          // 2x2 Grid for Quick Actions
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.25,
            children: [
              _buildQuickActionCard(
                icon: const Icon(Icons.psychology, color: Colors.blueAccent, size: 28),
                title: 'Smart Replies',
                subtitle: 'Get intelligent...',
                onTap: () => onActionTap('Tell me about Smart Replies.'),
              ),
              _buildQuickActionCard(
                icon: const Icon(Icons.sentiment_satisfied_alt, color: Colors.greenAccent, size: 28),
                title: 'Mood Mode',
                subtitle: 'Mood Responses...',
                onTap: () => onActionTap('What is Mood Mode?'),
              ),
              _buildQuickActionCard(
                icon: const Icon(Icons.mic, color: Colors.purpleAccent, size: 28),
                title: 'Voice Input',
                subtitle: 'Voice Recognition...',
                onTap: () => onActionTap('How does Voice Input work?'),
              ),
              _buildQuickActionCard(
                icon: const Icon(Icons.history, color: Colors.orangeAccent, size: 28),
                title: 'Chat History',
                subtitle: 'Chat History...',
                onTap: () => onActionTap('Show my Chat History.'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required Widget icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF131A2D), // Dark blue card color
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
