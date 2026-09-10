# The Night Trails

A single-page Flutter Web site for a boutique hotel: hero, room gallery,
café, front-courtyard parking, and a contact/booking section with an
embedded map.

## Run it

You'll need the Flutter SDK installed locally (this was scaffolded in an
environment without Flutter or internet access, so it hasn't been built
or run yet — but it's ready to go on your machine).

```bash
flutter pub get
flutter run -d chrome
```

To produce a deployable build:

```bash
flutter build web
# output lands in build/web — host that folder anywhere static
# (Firebase Hosting, Netlify, GitHub Pages, S3, etc.)
```

## What to customize first

1. **Photos** — drop real images into `assets/images/` using the
   filenames listed in `assets/images/README.md`. The layout already
   falls back to soft placeholders, so nothing breaks in the meantime.
2. **Contact details & map** — in `lib/widgets/contact_section.dart`,
   update `phone`, `email`, and `address` to the real ones. The map in
   `lib/widgets/map_embed_web.dart` reads the same `address` string, so
   updating it there updates the map too — no API key needed.
3. **Room copy & pricing** — `lib/widgets/rooms_section.dart` holds the
   four room entries (name, description, price, image path).
4. **Colors & type** — all design tokens live in one place:
   `lib/theme/app_theme.dart`.

## Structure

```
lib/
  main.dart                  — app shell, scroll-to-section wiring
  theme/app_theme.dart        — colors, type scale
  widgets/
    nav_bar.dart
    hero_section.dart
    rooms_section.dart
    cafe_section.dart
    parking_section.dart
    contact_section.dart
    map_embed_web.dart        — Google Maps <iframe> embed (web only)
assets/images/                — put your photos here
```

## Notes

- The map embed uses `dart:html` / `dart:ui_web`, which are web-only —
  fine here since this project targets Flutter Web specifically.
- `url_launcher` powers the tap-to-call and tap-to-email contact rows.
