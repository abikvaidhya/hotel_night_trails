# The Night Trails

A single-page Flutter Web site for Hotel Night Trails: room gallery,
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
