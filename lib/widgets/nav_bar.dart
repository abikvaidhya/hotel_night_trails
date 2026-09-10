import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onRoomsTap;
  final VoidCallback onCafeTap;
  final VoidCallback onParkingTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onRoomsTap,
    required this.onCafeTap,
    required this.onParkingTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 720;
    return Container(
      color: AppTheme.ink,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hotel Night Trails',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          if (!isNarrow)
            Row(
              children: [
                _NavLink('Rooms', onRoomsTap),
                _NavLink('Café', onCafeTap),
                _NavLink('Parking', onParkingTap),
                _NavLink('Contact', onContactTap),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.parchment),
              onPressed: onContactTap,
              tooltip: 'Book a room',
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: InkWell(
        onTap: onTap,
        child: Text(label, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
