import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';

/// Embeds a Google Maps location using an <iframe>.
///
/// This uses the public maps.google.com "output=embed" URL, which needs
/// no API key. Replace [query] with the hotel's real address (or
/// "lat,lng" coordinates) once you have it.
class MapEmbed extends StatelessWidget {
  final String query;
  const MapEmbed({super.key, required this.query});

  static final Set<String> _registered = {};

  @override
  Widget build(BuildContext context) {
    final viewType = 'map-embed-${query.hashCode}';

    if (!_registered.contains(viewType)) {
      ui_web.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        final iframe = html.IFrameElement()
          ..src =
              'https://maps.google.com/maps?q=${Uri.encodeComponent(query)}&output=embed'
          ..style.border = '0'
          ..style.width = '100%'
          ..style.height = '100%';
        return iframe;
      });
      _registered.add(viewType);
    }

    return HtmlElementView(viewType: viewType);
  }
}
