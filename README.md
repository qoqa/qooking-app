# Qooking App
Flutter Open Source Qooking App developed with ❤

## Useful command :
Run web app on Chrome
```
flutter run -d chrome
```
Generate a release build for the web
```
flutter build web
```
Generate model
```
flutter packages pub run build_runner build
```

### Env configuration in IntelliJ/Android Studio
Click on Run -> Edit Configurations, select Flutter, and then select the lib/config/main_<environement>.dart file for the Dart entrypoint

## Implementation and next steps
- [x] Environments (dev, prod) implementation
- [x] GraphQl implementation to retrieve recipe basic information
- [] Display all recipes
- [] GraphQl implementation to retrieve all the attributes and components linked to the recipe
- [] Open a recipe
- [] Search by recipe
- [] Start a recipe
- [] Recipe by locale
- [] Login
- [] Add favorite
- [] Bring integration
