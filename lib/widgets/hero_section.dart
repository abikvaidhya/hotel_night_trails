import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onBookTap;
  const HeroSection({super.key, required this.onBookTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 600;

    return SizedBox(
      height: 640,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Drop assets/images/hero_night.jpg in place to replace this.
          Image.asset(
            'assets/images/hero_night.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF13212F), AppTheme.ink],
                ),
              ),
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.35)),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'A quiet shelter at the edge\nof your trail.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: isNarrow ? 32 : 56,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Hotel Night Trails — a small hotel for people\nwho walk far.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    onPressed: onBookTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.lantern,
                      foregroundColor: AppTheme.charcoal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      elevation: 0,
                    ),
                    child: const Text('Book your stay'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
