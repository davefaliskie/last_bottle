# Last Bottle

A Flutter Game Built With Flame.

## Run The Generator

```
dart run build_runner watch -d
```

# Hive Help

this is a way to show a hive value with real time updates

```
ValueListenableBuilder(
  valueListenable: Hive.box("gameData").listenable(keys: ['appStartTime']),
  builder: ((context, box, child) {
    final time = box.get("appStartTime");
    return Text("start time: $time");
  }),
),
```

## Android build

```
flutter build appbundle
```

## Localization

check the current local:

```
Localizations.localeOf(context).languageCode
```
