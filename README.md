# KordiMobile

Flutter base mobile app, material aid collection app.


## General info

KordiMobile is a mobile application designed and developed for an engineering project, aimed at facilitating the coordination of material aid. Built using the Flutter framework, the app is compatible with both Android and iOS platforms. It utilizes the Flutter version management system, [fvm](https://fvm.app/).

## Technologies

State management:
[`bloc`](https://bloclibrary.dev/#/)<br>
HTTP client:
[`dio`](https://pub.dev/packages/dio)<br>
Navigation:
[`go_router`](https://pub.dev/packages/go_router)<br>
Dependency injection:
[`get_it`](https://pub.dev/packages/get_it)<br>
Modeling:
[`freezed`](https://pub.dev/packages/freezed)<br>


## How to use

Application use outside API created by KUGELO2424, [Kordi](https://github.com/KUGELO2424/Kordi). To proper functioning mobile app it's necessary to clone Kordi repository and launched it on your local machine.

### Requirements

- Windows or MacOs operating system
- Any IDE with Flutter support
- [fvm](https://fvm.app/docs/getting_started/installation/) installed 


### Usage

- Open KordiMobile in your IDE
- Run `fvm use` command in terminal
- Run `fvm flutter pub get` command in terminal
- Run `fvm flutter pub run build_runner build --delete-conflicting-outputs` command in terminal
- **Warning**: You need to change local ip addresses in **KordiEnvironment** class for android and iOS system. Kordi and KordiMobile are now supported only in local environment.

- Run `fvm flutter run` command in terminal

### UI Presentation



Icons and images used in application are from: [`undraw.co`](https://undraw.co/)