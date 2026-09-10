import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import 'map_embed_web.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const phone = '+97761590432';
  static const email = 'stay@thenighttrails.com';
  static const address = '6XC3+QX Pokhara, Gandaki Province, Nepal';

  Future<void> _launch(String uri) async {
    final u = Uri.parse(uri);
    if (await canLaunchUrl(u)) {
      await launchUrl(u);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 800;

    return Container(
      color: AppTheme.panel,
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Book a room', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    Text(
                      'Call or write to us directly — we keep the desk small on purpose.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    isNarrow
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _contactItems(context),
                          )
                        : Row(
                            children: _contactItems(context)
                                .map((w) => Expanded(child: w))
                                .toList(),
                          ),
                    const SizedBox(height: 48),
                    Text('Find us', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: const SizedBox(
              height: 380,
              width: double.infinity,
              child: MapEmbed(query: address),
            ),
          ),
          const SizedBox(height: 48),
          Center(
            child: Text(
              '© 2026 The Night Trails. All rights reserved.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _contactItems(BuildContext context) {
    return [
      _ContactTile(
        icon: Icons.call_outlined,
        label: 'Phone',
        value: phone,
        onTap: () => _launch('tel:$phone'),
      ),
      _ContactTile(
        icon: Icons.mail_outline,
        label: 'Email',
        value: email,
        onTap: () => _launch('mailto:$email'),
      ),
      _ContactTile(
        icon: Icons.place_outlined,
        label: 'Address',
        value: address,
        onTap: () => _launch('https://maps.google.com/?q=${Uri.encodeComponent(address)}'),
      ),
    ];
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 24),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: AppTheme.lantern),
                const SizedBox(width: 8),
                Text(label, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
