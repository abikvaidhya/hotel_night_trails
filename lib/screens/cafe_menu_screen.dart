import 'package:flutter/material.dart';
import '../models/cafe_menu.dart';
import '../theme/app_theme.dart';

class CafeMenuScreen extends StatelessWidget {
  const CafeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ink,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.ink,
            foregroundColor: AppTheme.parchment,
            pinned: true,
            elevation: 0,
            title: Text(
              'Northern Trails Café',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 40, 32, 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu', style: Theme.of(context).textTheme.displayMedium),
                      const SizedBox(height: 16),
                      Text(
                        'A short list, changes with the seasons.\nEverything is made a few steps from where it\'s served.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          for (var i = 0; i < cafeMenu.length; i++)
            SliverToBoxAdapter(
              child: _MenuSpread(
                group: cafeMenu[i],
                imageOnLeft: i.isEven,
                background: i.isEven ? AppTheme.ink : AppTheme.panel,
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _MenuSpread extends StatelessWidget {
  final MenuGroup group;
  final bool imageOnLeft;
  final Color background;

  const _MenuSpread({
    required this.group,
    required this.imageOnLeft,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 800;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Image.asset(
          group.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => Container(
            color: background == AppTheme.ink ? AppTheme.panel : AppTheme.ink,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe_outlined,
              color: AppTheme.parchment.withOpacity(0.25),
              size: 36,
            ),
          ),
        ),
      ),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 20,
      children: [
        Text(group.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 26)),
        for (var i = 0; i < group.items.length; i++) ...[
          _MenuItemRow(item: group.items[i]),
          if (i != group.items.length - 1) const SizedBox(height: 28),
        ],
      ],
    );

    return Container(
      color: background,
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [image, const SizedBox(height: 36), text],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: imageOnLeft
                      ? [
                          Expanded(flex: 4, child: image),
                          const SizedBox(width: 64),
                          Expanded(flex: 5, child: text),
                        ]
                      : [
                          Expanded(flex: 5, child: text),
                          const SizedBox(width: 64),
                          Expanded(flex: 4, child: image),
                        ],
                ),
        ),
      ),
    );
  }
}

class _MenuItemRow extends StatelessWidget {
  final MenuItem item;
  const _MenuItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 19),
        ),
        const SizedBox(height: 6),
        Text(
          item.notes,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.parchment.withOpacity(0.6),
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    );
  }
}
