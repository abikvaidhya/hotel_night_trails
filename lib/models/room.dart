import 'package:flutter/material.dart';

class Amenity {
  final IconData icon;
  final String label;

  const Amenity(this.icon, this.label);
}

class Room {
  final String name;
  final String description;
  final String price;
  final List<String> images;
  final List<Amenity> amenities;

  const Room({
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.amenities,
  });
}

const List<Room> rooms = [
  Room(
    name: 'The Deluxe Suite',
    description:
        'The Deluxe Suite features a king-sized bed, a private bathroom and a lake-facing balcony over the water.',
    price: '\$50 / night',
    images: [
      'assets/images/room_birchwood.jpg',
      'assets/images/room_birchwood_1.jpg',
      // 'assets/images/room_birchwood_3.jpg',
    ],
    amenities: [
      Amenity(Icons.deck_outlined, 'Private balcony'),
      Amenity(Icons.bathtub_outlined, 'Soaking tub'),
      Amenity(Icons.king_bed_outlined, 'King bed'),
      Amenity(Icons.wifi, 'Free Wi-Fi'),
      Amenity(Icons.ac_unit_outlined, 'Air conditioning'),
      Amenity(Icons.local_cafe_outlined, 'Coffee & tea'),
    ],
  ),
  Room(
    name: 'The Couples Rooms',
    description:
        'A warm, double-bed room built for couple travelers, complete with a private bathroom, TV, AC and a cozy seating area plus a balcony view.',
    price: '\$40 / night',
    images: [
      'assets/images/room_lantern.jpg',
      'assets/images/room_lantern_1.jpg',
    ],
    amenities: [
      Amenity(Icons.bed_outlined, 'Queen bed'),
      Amenity(Icons.wifi, 'Free Wi-Fi'),
      Amenity(Icons.ac_unit_outlined, 'Air conditioning'),
      Amenity(Icons.local_cafe_outlined, 'Coffee & tea'),
      Amenity(Icons.desk_outlined, 'Writing desk'),
    ],
  ),
  Room(
    name: 'Single Rooms',
    description:
        'Floor-to-ceiling windows with a view of the surrounding landscape, private bathroom, TV and AC.',
    price: '\$30 / night',
    images: [
      'assets/images/room_ridgeline.jpg',
      // 'assets/images/room_ridgeline_2.jpg',
      // 'assets/images/room_ridgeline_3.jpg',
    ],
    amenities: [
      Amenity(Icons.wallpaper_outlined, 'Floor-to-ceiling windows'),
      Amenity(Icons.king_bed_outlined, 'King bed'),
      Amenity(Icons.chair_outlined, 'Sitting area'),
      Amenity(Icons.wifi, 'Free Wi-Fi'),
      Amenity(Icons.ac_unit_outlined, 'Air conditioning'),
      Amenity(Icons.local_cafe_outlined, 'Coffee & tea'),
    ],
  ),
  Room(
    name: 'Bunker Rooms',
    description: 'Room with shared bed spaces for multiple guests.',
    price: '\$20 / bed / night',
    images: [
      'assets/images/room_hollow.jpg',
      // 'assets/images/room_hollow_1.jpg',
    ],
    amenities: [
      Amenity(Icons.bed_outlined, 'Single bed'),
      Amenity(Icons.wifi, 'Free Wi-Fi'),
      Amenity(Icons.ac_unit_outlined, 'Air conditioning'),
      Amenity(Icons.local_cafe_outlined, 'Coffee & tea'),
    ],
  ),
];
