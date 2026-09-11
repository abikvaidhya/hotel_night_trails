import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Fullscreen gallery: swipe between photos, pinch/scroll to zoom,
/// tap the close button to exit. Reuses the same Hero tags as the
/// carousel so the transition feels continuous.
class FullscreenGallery extends StatefulWidget {
  final List<String> images;
  final String heroTagPrefix;
  final int initialIndex;

  const FullscreenGallery({
    super.key,
    required this.images,
    required this.heroTagPrefix,
    this.initialIndex = 0,
  });

  @override
  State<FullscreenGallery> createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<FullscreenGallery> {
  late final PageController _controller;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              return Center(
                child: Hero(
                  tag: '${widget.heroTagPrefix}-$i',
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 4,
                    child: Image.asset(
                      widget.images[i],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stack) => Icon(
                        Icons.image_outlined,
                        color: AppTheme.parchment.withOpacity(0.3),
                        size: 48,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    if (widget.images.length > 1)
                      Text(
                        '${_index + 1} / ${widget.images.length}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    const SizedBox(width: 48), // balances the close button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
