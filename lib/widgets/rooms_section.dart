import 'package:flutter/material.dart';
import '../models/room.dart';
import '../screens/room_detail_screen.dart';
import '../theme/app_theme.dart';

// class _Room {
//   final String name;
//   final String description;
//   final String price;
//   final String image;
//   const _Room(this.name, this.description, this.price, this.image);
// }
//
// const _rooms = [
//   _Room(
//     'The Deluxe Suite',
//     'The Deluxe Suite features a king-sized bed, a private bathroom and a lake-facing balcony over the water.',
//     '\$60 / night',
//     'assets/images/room_birchwood.jpg',
//   ),
//   _Room(
//     'The Couples Rooms',
//     'A warm, double-bed room built for couple travelers, complete with a private bathroom, TV, AC and a cozy seating area plus a balcony view.',
//     '\$40 / night',
//     'assets/images/room_lantern.jpg',
//   ),
//   _Room(
//     'Single Rooms',
//     'Floor-to-ceiling windows with a view of the surrounding landscape, private bathroom, TV and AC.',
//     '\$35 / night',
//     'assets/images/room_ridgeline.jpg',
//   ),
//   _Room(
//     'Bunker Rooms',
//     'Room with shared bed spaces for multiple guests.',
//     '\$20 / bed / night',
//     'assets/images/room_hollow.jpg',
//   ),
// ];

class RoomsSection extends StatelessWidget {
  const RoomsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.ink,
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 32),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rooms', style: Theme.of(context).textTheme.headlineMedium),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              'Four rooms, each named for something you pass on the trail.\nNo two are decorated the same way.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: rooms.length,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, i) => _RoomCard(room: rooms[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final Room room;
  const _RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RoomDetailScreen(room: room)),
      ),
      child: SizedBox(
        width: 300,
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.asset(
                  room.images.first,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stack) => Container(
                    color: AppTheme.panel,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_outlined,
                      color: AppTheme.parchment.withValues(alpha: 0.3),
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              room.name,
              style:
                  Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            Text(
              room.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              room.price,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: AppTheme.lantern),
            ),
          ],
        ),
      ),
    );
  }
}
