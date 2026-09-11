import 'package:flutter/material.dart';
import '../screens/cafe_menu_screen.dart';
import '../theme/app_theme.dart';

class CafeSection extends StatelessWidget {
  const CafeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 800;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset(
          'assets/images/cafe.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => Container(
            color: AppTheme.panel,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe_outlined,
              color: AppTheme.parchment.withValues(alpha: 0.3),
              size: 36,
            ),
          ),
        ),
      ),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Northern Trails Café',
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text(
          'On the ground floor, open to guests and passersby alike. Coffee from 8:00 AM and a short kitchen menu through\nthe evening for anyone who came back tired.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        const _InfoRow(Icons.schedule, 'Open daily, 8:00 AM – 8:00 PM'),
        const SizedBox(height: 8),
        const _InfoRow(
            Icons.location_on_outlined, 'Ground floor, main lobby entrance'),
      ],
    );

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CafeMenuScreen()),
      ),
      child: Container(
        color: AppTheme.panel,
        padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: isNarrow
                ? Column(children: [image, const SizedBox(height: 32), text])
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: image),
                      const SizedBox(width: 56),
                      Expanded(child: text),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppTheme.lantern),
        const SizedBox(width: 10),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
