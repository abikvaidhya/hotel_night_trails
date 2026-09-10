import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ParkingSection extends StatelessWidget {
  const ParkingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 800;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.asset(
          'assets/images/parking.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => Container(
            color: AppTheme.ink,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_parking_outlined,
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
        Text('Parking', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text(
          'Enough space for your vehicle at the front of the hotel holds parking for '
          'our guests, lit through the night and watched by the front desk.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        const _InfoRow(
            Icons.directions_car_outlined, 'Free for registered guests'),
        // const SizedBox(height: 8),
        // const _InfoRow(Icons.bolt_outlined, '2 EV charging spaces'),
        const SizedBox(height: 8),
        const _InfoRow(Icons.security_outlined, 'Lit and monitored overnight'),
      ],
    );

    return Container(
      color: AppTheme.ink,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isNarrow
              ? Column(children: [image, const SizedBox(height: 32), text])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: text),
                    const SizedBox(width: 56),
                    Expanded(child: image),
                  ],
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
