# Images go here

The app looks for these exact filenames. Until they exist, each spot
falls back to a simple placeholder so the site still runs.

- hero_night.jpg              — wide, full-bleed hero image (1920x1080+)
- cafe.jpg                    — The Understory Café (homepage section)
- parking.jpg                 — the front courtyard parking area

Room photos (used in both the room card and the room detail carousel —
add as many per room as you like, just extend the `images` list in
`lib/models/room.dart` to match):

- room_birchwood_1.jpg, room_birchwood_2.jpg, room_birchwood_3.jpg
- room_lantern_1.jpg, room_lantern_2.jpg
- room_ridgeline_1.jpg, room_ridgeline_2.jpg, room_ridgeline_3.jpg
- room_hollow_1.jpg, room_hollow_2.jpg

Café menu photos (one per menu group, on the café menu screen):

- cafe_menu_1.jpg  — Coffee & Espresso
- cafe_menu_2.jpg  — Tea & Infusions
- cafe_menu_3.jpg  — Morning Pastries
- cafe_menu_4.jpg  — Light Bites

Room, café, and parking images look best around a 4:3 ratio. Hero and
carousel images look best around 16:9. Café menu photos look best
around 4:5 (portrait) to match the magazine-style spread.
