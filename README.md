A wrapper of Flutter commands, used daily for flutter development.

## Features

Currently, these commands are available. 
Wrapper Command | Flutter Command
--- | --- 
`fcm apk` | `flutter build apk --dart-define="env=env" --flavor flavor --target target`
`fcm build` | `flutter pub run build_runner build --delete-conflicting-outputs`
`fcm fmt` | `flutter format .`
`fcm ipa` | `flutter build ipa --release --dart-define="env=env" --flavor flavor --export-options-plist=export-options.plist --target target`
`fcm run` | `flutter run --dart-define="env=env" --flavor flavor --target target`
`fcm ss` | `flutter screenshot`
`fcm test` | `flutter test`

## Getting started

Activate this package in the machine using this command
```
dart pub global activate --source git https://github.com/syedmurtaza108/flutter_commands
```

To deactivate this package
```
dart pub global deactivate flutter_commands
```

## Usage

Following flags can also be used to manipulate default behaviour of the commands
Flag | Availability | Description
--- | --- | ---
`-h, --help` | all | Prints usage information
`-f, --flutter` | all | Modifies default alias (`flutter`) to the given one. e.g. `fcm fmt -f flutter2` would run `flutter2 format .`
`-e, --env` | `run`, `apk`, `ipa` | Changes the environment of flutter application
`-l, --flavor` | `run`, `apk`, `ipa` | Changes the flavor of flutter application
`-x, --export-options` | `ipa` | Changes the `export-options-plist` flag of `flutter build ipa` command
`-l, --flavor` | `run`, `apk`, `ipa` | Changes the flavor of flutter application

