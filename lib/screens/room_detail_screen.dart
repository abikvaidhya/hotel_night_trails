import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/room.dart';
import '../theme/app_theme.dart';
import '../widgets/contact_section.dart';
import '../widgets/fullscreen_gallery.dart';

class RoomDetailScreen extends StatefulWidget {
  final Room room;
  const RoomDetailScreen({super.key, required this.room});

  @override
  State<RoomDetailScreen> createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  final PageController _carouselController = PageController();
  int _carouselIndex = 0;

  String get _heroPrefix => 'room-photo-${widget.room.name}';

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  void _openFullscreen([int? startAt]) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => FullscreenGallery(
          images: widget.room.images,
          heroTagPrefix: _heroPrefix,
          initialIndex: startAt ?? _carouselIndex,
        ),
      ),
    );
  }

  Future<void> _launch(String uri) async {
    final u = Uri.parse(uri);
    if (await canLaunchUrl(u)) await launchUrl(u);
  }

  @override
  Widget build(BuildContext context) {
    final room = widget.room;

    return Scaffold(
      backgroundColor: AppTheme.ink,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.ink,
            foregroundColor: AppTheme.parchment,
            pinned: true,
            elevation: 0,
            title: Text(room.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
          ),
          SliverToBoxAdapter(
            child: Column(
              spacing: 15,
              children: [
                _Carousel(
                  room: room,
                  controller: _carouselController,
                  heroPrefix: _heroPrefix,
                  index: _carouselIndex,
                  onIndexChanged: (i) => setState(() => _carouselIndex = i),
                  onTapImage: () => _openFullscreen(),
                  onTapFullscreenButton: () => _openFullscreen(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(room.name, style: Theme.of(context).textTheme.headlineMedium),
                          ),
                          Text(
                            room.price,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.lantern, fontSize: 20),
                          ),
                        ],
                      ),
                      Text(room.description, style: Theme.of(context).textTheme.bodyLarge),
                      Text('Amenities', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18)),
                      Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        children: [
                          for (final amenity in room.amenities) _AmenityChip(amenity: amenity),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: AppTheme.parchment.withOpacity(0.12), height: 1),
                Center(
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => _launch('tel:${ContactSection.phone}'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.lantern,
                        foregroundColor: AppTheme.charcoal,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        elevation: 0,
                      ),
                      child: Text('Book ${room.name} — ${room.price}'),
                    ),
                  ),
                ),
                const SizedBox(height: 15,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Carousel extends StatelessWidget {
  final Room room;
  final PageController controller;
  final String heroPrefix;
  final int index;
  final ValueChanged<int> onIndexChanged;
  final VoidCallback onTapImage;
  final VoidCallback onTapFullscreenButton;

  const _Carousel({
    required this.room,
    required this.controller,
    required this.heroPrefix,
    required this.index,
    required this.onIndexChanged,
    required this.onTapImage,
    required this.onTapFullscreenButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.75,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: room.images.length,
            onPageChanged: onIndexChanged,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: onTapImage,
                child: Hero(
                  tag: '$heroPrefix-$i',
                  child: Image.asset(
                    room.images[i],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      color: AppTheme.panel,
                      alignment: Alignment.center,
                      child: Icon(Icons.image_outlined, color: AppTheme.parchment.withOpacity(0.3), size: 36),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 16,
            right: 16,
            child: _RoundIconButton(
              icon: Icons.fullscreen,
              onTap: onTapFullscreenButton,
            ),
          ),
          if (room.images.length > 1)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < room.images.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: i == index ? 18 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: i == index ? AppTheme.lantern : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.45),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

class _AmenityChip extends StatelessWidget {
  final Amenity amenity;
  const _AmenityChip({required this.amenity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(amenity.icon, size: 20, color: AppTheme.lantern),
          const SizedBox(width: 10),
          Expanded(
            child: Text(amenity.label, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
